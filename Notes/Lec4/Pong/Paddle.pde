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
    }
  
    if (ball.y> width - 10 && ball.yspeed > 0) {
      ball.yspeed = -ball.yspeed;
    }
  
    if (ball.y < 10 && ball.yspeed < 0) {
      ball.yspeed = abs(ball.yspeed);
    }
  
    if (ball.x < x + 35 && ball.y > y && ball.y < y + 85) {
      ball.xspeed = -ball.xspeed;
    }
  }
 
  
  void display(){
    rect(x, y, 25, 85);
  }
  
}
