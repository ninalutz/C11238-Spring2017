///*
//GROSS NO FUNCTIONS :( 
// */
//
//int len=50;
//float ballx, bally, paddlex, paddley, displacementX, displacementY;
//
//void setup() {
//  size(400, 400);
//  paddley = 60;
//  paddlex = 15;
//  displacementY = -3;
//  displacementX = 5;
//  bally = 200;
//  ballx = 200;
//  smooth();
//  noStroke();
//}
//
//void draw() {
//  background(0);
//  //basic stuff
//  fill(255, 255, 255);
//  rect(paddlex, paddley, 25, 85);
//  fill(255);
//  ellipse(ballx, bally, 20, 20);
//  line(200, 0, 200, 400);
//  
//  //update ball
//  ballx= ballx + displacementX;
//  bally= bally + displacementY;
//  
//  //update paddle
//  paddley=(mouseY);
//  if (ballx > width-10 && displacementX > 0) {
//    displacementX = -displacementX;
//  }
//  if (bally> width - 10 && displacementY > 0) {
//    displacementY = -displacementY;
//  }
//  if (bally < 10 && displacementY < 0) {
//    displacementY = abs(displacementY);
//  }
//  if (ballx< paddlex + 35 && bally > paddley && bally <paddley + 85) {
//    displacementX= -displacementX;
//  }
//  
//  //stop the game if you lose
//  if (ballx < 10) {
//    smooth();
//    text("GAME OVER", 165, 200);
//  }
//}
