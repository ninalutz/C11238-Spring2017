/*
Nice code that uses classes
*/

Ball ball;
Paddle paddle;

void setup(){
  size(400, 400);
  ball = new Ball(20, 5, -3, 200, 200);
  paddle = new Paddle(15, 60);

}

void draw(){
  fill(255);
  stroke(255);
  background(0);
  
  ball.display();
  ball.update();
  
  paddle.display();
  paddle.update();
  
  if (ball.x < 10) {
    smooth();
    text("GAME OVER", 165, 200);
  }

}
