Ball ball;
Paddle paddle;

/*The working code is in Pong; there's working versions of the classes, etc. 
Try to do this assignment without peaking, but if you get stuck, go reference that
*/

void setup(){
  size(400, 400);
  paddle = new Paddle(15, 60);
  //instantiate a ball here

}

void draw(){
  fill(255);
  stroke(255);
  background(0);
  
  //Uncomment these once you've finish instantiating your class to debug these functions
//  ball.display();
//  ball.update();
  
  paddle.display();
  paddle.update();
  

}
