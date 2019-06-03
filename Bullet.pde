class Bullet extends Projectile{
  //properties
  //constructors
  Bullet(int bx, int by){
    x=bx;
    y=by;
    speedy=-3;
    w=10;
    h=15;
  }
  //abilities
  void render(){
     fill(83, 147, 85);
     rect(x,y,w,h);
  }
}