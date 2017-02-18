final float PHI = (1 + sqrt(5))/2;  //golden ratio
ArrayList<Ball> balls;
int counter = 0;
float start;
PVector curmin;
int minsize = 5;
int hrsize = 10;
int clockrad = 260;
int hrrad = 50;
/*------------------------------*/


void setup()
{
  size(400, 400);
  start = second();
  balls = new ArrayList<Ball>();
  //balls.add (new Ball(10, 0));
  
  noStroke(); 
  
  ellipseMode(CENTER);
  
  frameRate(30);

}



void draw()
{  
    background(150);
  //println(balls.size());
   // noFill();
   // stroke(255);
    //ellipse(width/2, height/2, clockrad, clockrad);
    float angle = -90;
    for(int i = 1; i<61; i++){
         fill(0);
         stroke(0);
      angle += 360.0/60;
      if(i % 5 == 0){
            hrsize = 10;
          if(i/5 == hour() || (i == 60 && hour() == 0)){
            stroke(255);
             fill(255);
             hrsize = 15;
          }
           ellipse(hrrad*cos(radians(angle)) + width/2, hrrad*sin(radians(angle)) + height/2, hrsize, hrsize);
      }
      if(i == minute()){
        curmin = new PVector(clockrad/2*cos(radians(angle)) + width/2, clockrad/2*sin(radians(angle)) + height/2);
      }
      if(i> minute()){
        fill(0);
        stroke(0);
      }
      else{
        fill(255);
        stroke(255);
      }
      ellipse(clockrad/2*cos(radians(angle)) + width/2, clockrad/2*sin(radians(angle)) + height/2, minsize, minsize);
    }
    
    stroke(255);
    fill(255);
 
  //loop backwards to test the balls from the center to the edges
  for (int i = balls.size() - 1; i >= 0; i--)
  {
    Ball b = balls.get(i);
    b.move(i, balls);
    fill(255);
    b.display();   
  }
  
  if(second() != start){
    start = second();
    balls.clear();
    counter = 0;
  }
  
  counter++;
  
  if(second() !=0){
  balls.add (new Ball(random(5, 20), counter*PHI*TAU, curmin));  
  }

  
  fill(255);
  
  
}


/*------------------------------*/


class Ball
{
  PVector center,  //screen center
             pos,  //position
             dir;  //direction
  float diam;  //diameter
  
  ////////////
  
  Ball(float diam_, float angle, PVector _center)
  {
    center = _center;
    pos = center.get();
    dir = new PVector(cos(angle), sin(angle), 0);
    diam = diam_;
  }
  
  ///////////
  
  void move(int id, ArrayList<Ball> balls){
    //tests if balls created afterwards are too close
    for (int i = id + 1; i < balls.size() - 1; i++)
    {
      Ball b = balls.get(i);
      if (PVector.dist(pos, b.pos) < 12)  pos.add(dir);
    }
  }
   
  /////////// 
   
  void display()
  {
    ellipse(pos.x, pos.y, diam, diam);
    textSize(diam*.75);
    fill(0);
    
    textAlign(CENTER, CENTER);
    text(second(), pos.x, pos.y - diam/10);
  }
  
  ///////////

}