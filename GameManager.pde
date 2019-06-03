class GameManager {
  //Properties
  Player p;
  ArrayList<Bullet> bullets;
  ArrayList<Alien>aliens;
  ArrayList<Bomb>bombs;
  boolean hitwall;
  int gamemode;
  //Constructors
  GameManager() {
    //define new player
    p= new Player();
    //bomb arraylist
    bombs= new ArrayList<Bomb>();
    //bullet array list
    bullets= new ArrayList<Bullet>();
    //alien array list
    aliens= new ArrayList<Alien>();
    // create alien columns and rows
    for (int i=0; i<12; i++) {
      for (int k=0; k<5; k++) {
        aliens.add(new Alien(i*60+20, k*60 + 10));
      }
    }
    gamemode=0;
  }
  //Abilities

  void render() {
    if (gamemode==0) {
      //draw player
      p.render();
      //draw bullets
      for (Bullet b : bullets) {
        b.render();
      }
      //draw aliens
      for (Alien a : aliens) {
        a.render();
      }
      //draw bombs
      for (Bomb c : bombs) {
        c.render();
      }
    }
  }
  void update() {
    if (gamemode==0) {
      //move player
      p.move();
      //move bullet
      for (Bullet b : bullets) {
        b.move();
      }
      //if hit top of screen delete bullet
      for (int i=0; i<bullets.size(); i++) {
        Bullet bu= bullets.get(i);
        if (bu.y<=0) {
          bullets.remove(i);
        }
      }
      //move aliens
      for (Alien a : aliens) {
        a.move();
      }
      //change boolean variable if alien hits wall
      for (Alien a : aliens) {
        if (a.x<=0 || a.x>= width-45) {
          hitwall=true;
        }
      }
      //move bombs
      for (Bomb c : bombs) {
        c.move();
      }
      //reverse speed based on boolean
      if (hitwall==true) {
        for (Alien a : aliens) {
          hitwall=false;
          a.reverseSpeed();
        }
      }
      //collision detection
      //alien collision: muliple things against multiple things, a loop inside a loop, add logic so u only do check if aliens are there
      for (int i=aliens.size()-1; i>=0; i--) {
        for (int b=bullets.size()-1; b>=0; b--) {
          if (i<=aliens.size()-1) {  
            Bullet ba= bullets.get(b);
            Alien au= aliens.get(i);
            if (ba.x>=au.x-ba.w && ba.x<=au.x+au.w && ba.y<= au.y+ au.h && ba.y>=au.y+ba.h) {
              bullets.remove(b);
              aliens.remove(i);
              p.score= p.score+20;
            }
          }
        }
      }
      // collision detection btwn bomb and player
      for (int b=bombs.size()-1; b>=0; b--) {
        Bomb c= bombs.get(b);
        if (c.x>= p.px - c.w && c.x<= p.px + p.w && c.y<= p.py + p.h && c.y>= p.py + c.h) {
          bombs.remove(c);
          p.lives= p.lives-1;
        }
      }
      // randomly drop bombs
      if (random(100)<1) {
        // randomly select alien to drop bomb from
        int A= (int)random(aliens.size());
        // create bomb
        bombs.add(new Bomb(aliens.get(A).x, aliens.get(A).y));
      }
    }
    // see if u died
    if (p.lives== 0) {
      gamemode=2;
    }
    for (int i=aliens.size()-1; i>=0; i--) {
      if (i<=aliens.size()-1) {
        Alien a= aliens.get(i);
        if(p.py<= a.y+ a.h){
          gamemode=2;
        }
      }
    }
    // see if you win
    if (aliens.size()==0){
      gamemode=1;
    }
    //you win
    if(gamemode==1){
      text("YOU WIN", width/2, height/2);
    }
    //you lose
    if (gamemode==2) {
      text("YOU LOSE", width/2, height/2);
    }
  }
  void action(char key) {
    //set player speed
    p.setSpeed(key);
    //fire bullet
    if (key==' ') {
      if(bullets.size()<=5){
        bullets.add(new Bullet(p.px+p.w/2, p.py));
      }
    }
  }
}
//count down 