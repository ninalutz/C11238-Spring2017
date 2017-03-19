//Cow Painting, Sophia by Cari Humphry
PFont Helvetica;
public static int eraser_width = 100;
public static int eraser_height = 150;
PImage outline,colored, fauv1, fauv2, fauv3, fauv4, fauv5, fauv6, other1, other2, other3, other4;

void setup() {
  background(255);
  size(1600, 900);
  outline = loadImage("outline.png");
  colored = loadImage("color.jpg");
  fauv1 = loadImage("1.png");
  fauv2 = loadImage("2.png");
  fauv3 = loadImage("3.png");
  fauv4 = loadImage("4.png"); 
  fauv5 = loadImage("5.png");
  fauv6 = loadImage("6.png");  
  other1 = loadImage("other1.png"); 
  other2 = loadImage("other2.png"); 
  other3 = loadImage("other3.png"); 
  other4 = loadImage("other4.png");
  image(outline,0,0);
  imageMode(CORNERS);
  
  Helvetica = createFont("Helvetica", 16, true);
}
void draw() {
  textFont(Helvetica);       
  fill(0);
  textAlign(CENTER);
  text("Color the cow! Then slide your fingers across 1-6 to increase the fauvism! \n Press space for a cool pop art array!",width/2, 750);
  imageMode(CORNERS);
//copies the colored image on top according to eraser constraints; creates an eraser effect 
  if(mousePressed) 
      copy(colored, constrain(mouseX-eraser_width/2,0,width), constrain(mouseY-eraser_height/2,0,height), 
           eraser_width,eraser_height, constrain(mouseX-eraser_width/2,0,width), constrain(mouseY-eraser_height/2,0,height), 
              eraser_width,eraser_height);
  if (keyPressed) {
//keys to change the arrays of increasing fauvism 
    if (key == '1' || key == '1') {
      image(fauv1, 0, 0);
    }
    if (key == '2' || key == '2') {
      image(fauv2, 0, 0);
    }
    if (key == '3' || key == '3') {
      image(fauv3, 0, 0);
    }
    if (key == '4' || key == '4') {
      image(fauv4, 0, 0);
    }
    if (key == '5' || key == '5') {
      image(fauv5, 0, 0);
    }
    if (key == '6' || key == '6') {
      image(fauv6, 0, 0);
    }
//pop art array of color variants
    if (key == ' ' || key == ' ') {
      image(fauv6, 0, 0);
      image(other1, 300, 0);
      image(other2, 600, 0);
      image(other3, 900, 0); 
      image(other4, 1200,0);
    }
    
  }
    }

