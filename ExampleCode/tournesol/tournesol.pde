final float PHI = (1 + sqrt(5))/2;  //golden ratio
ArrayList<Ball> balls;
int counter = 0;


/*------------------------------*/


void setup()
{
  size(500, 500);
  balls = new ArrayList<Ball>();
  balls.add (new Ball(10, 0));
  
  noStroke();  
  fill(255, 220, 0);
}


/*------------------------------*/


void draw()
{
  background(22, 8, 0);
 
  //loop backwards to test the balls from the center to the edges
  for (int i = balls.size() - 1; i >= 0; i--)
  {
    Ball b = balls.get(i);
    b.move(i, balls);
    b.display();
    if (b.isDead())  balls.remove(i);    
  }
  
  
  counter++;
  balls.add (new Ball(10 - (counter%500)/50, counter*PHI*TAU));  
}


/*------------------------------*/


class Ball
{
  PVector center,  //screen center
             pos,  //position
             dir;  //direction
  float diam;  //diameter
  
  ////////////
  
  Ball(float diam_, float angle)
  {
    center = new PVector(width/2, height/2, 1); 
    pos = center.get();
    dir = new PVector(cos(angle), sin(angle), 0);
    diam = diam_;
  }
  
  ///////////
  
  void move(int id, ArrayList<Ball> balls)
  {
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
  }
  
  ///////////
  
  boolean isDead()
  {
    if (PVector.dist(pos, center) > width/2) return true;
    else return false;
  }
}