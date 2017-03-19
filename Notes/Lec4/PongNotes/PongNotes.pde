float x = 60;
float y = 70.5;
  
boolean colorgray = true;
int xdirection = 5;
int ydirection = 3;

Ball ball = new Ball(20, x, y, 5.5, 3.5);
Paddle paddle = new Paddle(15, 60);  
//this function runs once
void setup(){
  background(255, 0, 0);
  //hex codes
  //background(#00ff00);
  size(400, 400);
  
}
//this one runs all the time
void draw(){
  background(0, 255, 0);
  ball.display();
  ball.update();
  paddle.display();
  paddle.update();
}

class Paddle{
  float x, y;
  Paddle(float _x, float _y){
    x = _x;
    y = _y;
  }
  //ball.x --> ball.xpos
  //ball.y --> ball.ypos
  void update(){
    y = (mouseY);
    if (ball.xpos > width-10 && ball.xspeed > 0) {
      ball.xspeed = -ball.xspeed;
    }
  
    if (ball.ypos> width - 10 && ball.yspeed > 0) {
      ball.yspeed = -ball.yspeed;
    }
  
    if (ball.ypos < 10 && ball.yspeed < 0) {
      ball.yspeed = abs(ball.yspeed);
    }
  
    if (ball.xpos < x + 35 && ball.ypos > y && ball.ypos < y + 85) {
      ball.xspeed = -ball.xspeed;
    }
  }
 
  
  void display(){
    rect(x, y, 25, 85);
  }
  
}

class Ball{
  int radius;
  float xpos, ypos, xspeed, yspeed;
  
  Ball(int _radius, float _xpos, float _ypos, float _xspeed, float _yspeed){
         radius = _radius;
         xpos = _xpos;
         ypos = _ypos;
         xspeed = _xspeed;
         yspeed = _yspeed;
   }
   
  void update(){
    xpos += xspeed;
    ypos += yspeed;
  }
  
  void display(){
    ellipse(xpos, ypos, radius, radius);
  }
  
}

