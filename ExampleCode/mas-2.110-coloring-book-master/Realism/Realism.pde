//painting is oil painting "Cow" by Lucy Deane

PFont Helvetica;
public static int eraser_width = 100;
public static int eraser_height = 150;
PImage outline, colored;

void setup() {
  background(255);
  size(900, 1000);
  outline = loadImage("outline.png");
  colored = loadImage("color.jpg");
  image(outline,0,0);
  imageMode(CORNERS);
  smooth();
  
  Helvetica = createFont("Helvetica", 16, true);
}
void draw() {
  textFont(Helvetica);       
  fill(0);
  textAlign(CENTER);
  text("Color the cow!",width/2, 790);
  imageMode(CORNERS);
//copies the colored image on top according to eraser constraints; creates an eraser effect 
  if(mousePressed) 
      copy(colored, constrain(mouseX-eraser_width/2,0,width), constrain(mouseY-eraser_height/2,0,height), 
           eraser_width,eraser_height, constrain(mouseX-eraser_width/2,0,width), constrain(mouseY-eraser_height/2,0,height), 
              eraser_width,eraser_height);
}
