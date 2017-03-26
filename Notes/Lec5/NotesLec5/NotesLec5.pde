PVector p1 = new PVector(5, 6);
PVector p2 = new PVector(5, 6, 7);

ArrayList<PVector>Vecs = new ArrayList<PVector>();
//ArrayList<float>floats = new ArrayList<float>();

float x = 6; 

void setup(){
  size(400, 400);
  for(int i = 0; i<10; i++){
    println(i);
  }
}

color blue = color(0, 0, 255);
color red = color(255, 0, 0);

void draw(){
  
//  strokeWeight(0);
//noStroke();
 
  background(lerpColor(red, blue, .2));
  
  //translate(x, y)
  
  //(255, 255, 255)
  //(0, 0, 0)
  
  //text stuff
  fill(255, 255, 0);
  textSize(20);
  //text("THING", x, y);
  text(lerp(5, 10, .5), 20, 200);
  
    pushMatrix();
      translate(200, 50);
  ellipse(50, 50, 10, 10);
    popMatrix();
    
  rect(40, 40, 200, 200);
  
 

}
