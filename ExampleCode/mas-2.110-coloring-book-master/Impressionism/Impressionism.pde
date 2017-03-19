//method implemented is from Processing.org, most specific Learning Processing by Daniel Sherman, I just modified a bit
PFont Helvetica;
PImage img;
int pointillize = 10;

void setup() {
  size(1300,850);
  Helvetica = createFont("Helvetica", 20, true);
  img = loadImage("color.jpg");
  background(0);
  smooth();
}

void draw() {
  image(img, 700, 0);
  frameRate = 5000;
  textFont(Helvetica);
  fill(255);
  textAlign(CENTER);
  text("Press space to make an impressionist version of the cow colored by the computer.",width/2,600); 
  if(key == ' '){
  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  // Draw an ellipse at that location with that color
  fill(r,g,b,100);
  ellipse(x, y, pointillize, pointillize);
  }
}
