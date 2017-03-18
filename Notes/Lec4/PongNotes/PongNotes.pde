int x = 60;
float y = 70.5;
  
boolean colorgray = true;
int xdirection = 5;
int ydirection = 3;
  
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
  if(colorgray == true){
    ellipse(x, y, 50, 50);
  }
 //bar
  rect(20, mouseY, 20, 50); 
  moveBall();
}

void moveBall(){
  x += xdirection;
  y+= ydirection;
  // || = or, && = and, != and == 
  if (x >= width || x <= 0) {
    xdirection *= -1;
  }
  if(y >= height || y <= 0){
    ydirection *= -1;
  }
}
