//runs once
void setup() {
  size(400, 400);
  //RGB??? 
  //0-255 0; none of that color; 255 being a lot 
   background(21, 255, 0);
}

//variable types
int x = 6;
float y = 6.7;
boolean f = false;
color; 
ellipse();

//runs every single frame
void draw() {
  //ellipse(x, y, sizex, sizey);
  ellipse(20, 20, 50, 20);

  println(mouseX, mouseY);  
  
 
  
}

