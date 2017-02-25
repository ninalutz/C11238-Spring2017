class Paddle{
  float x, y;
  Paddle(float _x, float _y){
    x = _x;
    y = _y;
  }
  
  void update(){
    y = (mouseY);
    if (ball.x > width-10 && ball.xspeed > 0) {
      ball.xspeed = -ball.xspeed;
      println("THING");
    }
  
    if (ball.y> width - 10 && ball.yspeed > 0) {
      ball.yspeed = -ball.yspeed;
      println("THING2");
    }
  
    if (ball.y < 10 && ball.yspeed < 0) {
      ball.yspeed = abs(ball.yspeed);
      println("THING3");
    }
  
    if (ball.x < x + 35 && ball.y > y && ball.y < y + 85) {
      ball.xspeed = -ball.xspeed;
      println("THING4");
    }
  }
 
  
  void display(){
    rect(x, y, 25, 85);
  }
  
}
