int across, down;
int total;
float borderWidth = 0;
float hsp, vsp;
float radInc;
float numberOfOscillations;
float bx, by;
Dot[] dots;
int gifNumber = 0;

void setup()
{
  size(600, 600, P2D);
  background(30);
  
  borderWidth = 50;
  across = 20;
  down = 20;
  total = across * down;
  
  float gridSize = width - (borderWidth * 2);
  
  hsp = gridSize / across;
  vsp = gridSize / down;
  
  radInc = TWO_PI / total;
  numberOfOscillations = 1;
  bx = hsp/2 + width/2 - gridSize/2;
  by = vsp/2 + height/2 - gridSize/2;
  
  dots = new Dot[total];
  
  int column = 0;
  int row = 0;
  
  for(int i = 0; i < total; i++)
  {
    Dot d = new Dot();
    d.x = bx + (column * hsp);
    d.y = by + (row * vsp);
    
    float radiusOffset = minScale() + (d.variance * 0.5) + (d.variance * 0.5);
    //d.x -= radiusOffset;
    //d.y -= radiusOffset;
    
    float offset = abs(total - i);
    d.myInc = doInc(d, i);
    d.minScale = minScale();
    d.maxScale = maxScale();
    d.variance = d.maxScale - d.minScale;
    d.minBrightness = minBrightness();
    d.maxBrightness = maxBrightness();
    //d.angle = i/-0.2 * (float)row/down + (float) column/across;
    d.angle = dist(width/2, height/2, d.x, d.y) * 0.01;

    //println(d.angle);
    
    dots[i] = d;
    column ++;
    
    if(column == across)
    {
      column = 0;
      row ++;
    }
  }
    
}

void draw()
{
  
  //drawBorder();
  
  
  //if(frameCount < 40)
  {
    //saveFrame("line-######.png");
    
    println(frameCount);
    fill(30, 200);
    rectMode(NORMAL);
    rect(0, 0, width, height);
    for(int i = 0; i < total; i++)
    {
      Dot d = dots[i];
      d.update();
      //if(i ==0) println(d.angle / PI);
    }
  }
}
    
  
void drawBorder()
{
  pushMatrix();
  fill(255, 20);
  rectMode(CENTER);
  translate(width/2, height/2);
  rect(0, 0, width-borderWidth*2, height-borderWidth*2);
  popMatrix();
}

float doInc(Dot d, int i)
{
  return 0.025 ;
}

float minScale()
{
  return 5.0;
}

float maxScale()
{
  return 20.0;
}

float minBrightness()
{
  return 0;
}

float maxBrightness()
{
  return 100;
}
class Dot
{
  float x, y;
  float offSet;
  float myInc;
  float minScale, maxScale;
  float radius;
  float variance;
  float brightness;
  float minBrightness, maxBrightness;
  float brightnessVariance;
  float angle;
  
 Dot(){
  
  
 } 
  
 void update()
 {
   angle += myInc;
   float sinVal = sin(angle);
   radius = minScale  + (variance * 0.5) + (variance * 0.5) * sinVal;
   brightness =  (variance * .022) + (variance * 1.2) * sinVal;
   println(variance, minBrightness);
   render();
 }
 
 void render()
 {
   rectMode(CENTER);
   pushMatrix();
   translate(x, y);
   colorMode(HSB);
   //noStroke();
   //stroke(255, brightness * 20, brightness);
   noStroke();
   fill(map(sin(angle), -1, 1, 60, 255), brightness * 15, brightness * 15);
   //fill(0, brightness);
   rect(0, 0, radius, radius);
   
   //stroke(255, 50);
   //fill(map(sin(angle), -1, 1, 0, 180), brightness * 15, brightness * 15);
   //noFill();
   rect(0, 0, minScale, minScale);
   popMatrix();
 }
  
}

