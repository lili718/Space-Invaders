class Player{
  //properties
  int lives;
  int speedx;
  int w;
  int h;
  int px;
  int py;
  int score;
  //Constructors
  Player(){
    w=100;
    h=50;
    lives=3;
    score=0;
    px= width/2;
    py= height- height/6;
  }
  //Abilities
  void move(){
    px= px+ speedx; 
    if(px>width-w || px<width-width){
      speedx=0;
    }
  }
  void setSpeed(char key){
    //right
    if (key=='d'){
      speedx=2;
    }
    //stop
    if(key=='s'){
      speedx=0;
    }
    //left
    if(key=='a'){
      speedx=-2;
    }
  }
  void render(){
    fill(245, 188, 74);
    rect(px, py, w, h);
    textSize(20);
    text("Score: " + score, 80, 980);
    text("Lives: " +lives, 900, 980);
  }
}