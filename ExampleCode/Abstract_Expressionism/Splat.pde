class Splatter {
  float x,y;
  float rad;
  PGraphics splatter;
 
  Splatter(float x, float y) {
    this.x = x + 5;
    this.y = y;
    rad = 17;
    splatter = createGraphics(300,300,JAVA2D);
    create();
  }
  
//create splatters
  void create() {
    splatter.beginDraw();
    splatter.smooth();
    splatter.colorMode(HSB,360,100,100); 
    
//key commands to change colors 
    if (key == 'b') {
      splatter.colorMode(HSB, 0, 0, 0);
      splatter.fill(0, 0, 0);
  }
    if (key == 'r'){ 
      splatter.colorMode(RGB, 250, 250, 250);
      splatter.fill(random(250), 0, 0);
    }
    else { 
      splatter.fill(0, 0, random(100));
    }
    
//Getting the actual graphic for the paint splatter utilizing different iterated ellipses 
    splatter.noStroke();
    for (float i=3; i<29; i+=.35) {
      float angle = random(0, TWO_PI);
      float splatterX = (splatter.width-50)/2 + 50 + cos(angle)*2*i;
      float splatterY = (splatter.height-50)/2 + 25 + sin(angle)*3*i;
      splatter.ellipse(splatterX, splatterY, rad-i, rad-i+1.8);
    }
    splatter.endDraw();
  }
//displays them   
  void display() {
    imageMode(CENTER);
    image(splatter,x,y);
  }
}
