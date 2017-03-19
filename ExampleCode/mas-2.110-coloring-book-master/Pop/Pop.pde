//Cow Portrait by Marijn van Braak
PFont Helvetica;
public static int eraser_width = 100;
public static int eraser_height = 150;
PImage outline, colored, pop;

void setup() {
  background(255);
  size(1200, 900);
  outline = loadImage("color.jpg");
  colored = loadImage("pop1.png");
  pop = loadImage("transparent_cow.png");
  image(outline,0,0);
  imageMode(CORNERS);
  
  Helvetica = createFont("Helvetica", 20, true);
}
void draw() {
  textFont(Helvetica);       
  fill(0);
  textAlign(CENTER);
  text("Color the cow! Then keep pressing space for more pop!",width/2, 820);
  imageMode(CORNERS);
//copies the colored image on top according to eraser constraints; creates an eraser effect 
  if(mousePressed) 
      copy(colored, constrain(mouseX-eraser_width/2,0,width), constrain(mouseY-eraser_height/2,0,height), 
           eraser_width,eraser_height, constrain(mouseX-eraser_width/2,0,width), constrain(mouseY-eraser_height/2,0,height), 
              eraser_width,eraser_height);
//makes modifiable grid of pop art with randomized colored tiles and transparent cow art
  if (keyPressed) {
    if (key == ' ' || key == ' ') {
      fill(random(250), random(255), random(255));
      noStroke();
      rect(600, 0, 600, 400);
      fill(random(255), random(100), random(255));
      rect(0, 400, 600, 400);
      fill(random(255), random(255), random(100));
      rect(600, 400, 600, 400);
      image(pop, 0, 400);
      image(pop, 600, 400);
      image(pop, 600, 0);
  }
    }
}
