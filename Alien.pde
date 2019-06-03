
class Alien{
  //properties
  PImage alien;
  int x;
  int y;
  int speedx;
  int w;
  int h;
  //constructors
  Alien(int ax, int ay){
    speedx= 1;
    x=ax;
    y=ay;
    w=50;
    h=50;
    alien= loadImage("alien2.gif");
  }
  //abilities
  void move(){
    x= x+ speedx;
  }
  void render(){
    image(alien, x, y);
    //fill(0,0,255);
    //rect(x,y,w,h);
  }
  void reverseSpeed(){
    speedx=-speedx;
    y= y+50;
  }
  //
}