//Lia Johnson
GameManager game;

void setup(){
  size(1000,1000);
  game = new GameManager();  
}


void draw(){
  background(0);
  game.update();
  game.render();
}


void keyPressed(){
  game.action(key); 
}