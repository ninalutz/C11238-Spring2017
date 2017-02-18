// http://wiki.processing.org/w/From_several_arrays_to_classes

// Ball handling
final int BALL_NB = 5;
Ball[] balls = new Ball[BALL_NB];
 
void setup()
{
  size(600, 400);
  smooth();
 
  // The colors to use
  color[] colors = { #DDEE55, #AA44EE, #22BBAA, #0022FF, #00FF22 };
  // Initialize the balls' data
  for (int i = 0; i < BALL_NB; i++)
  {
    balls[i] = new Ball(8 + i * 8, colors[i]);
  }
}
 
void draw()
{
  // Erase the sketch area
  background(#AAFFEE);
  for (int i = 0; i < BALL_NB; i++)
  {
    // Compute the new ball position
    balls[i].moveBall();
    // And display it
    balls[i].displayBall();
  }
}

boolean bStopped;
void mousePressed() { if (bStopped) loop(); else noLoop(); bStopped = !bStopped; }

class Ball
{
  float posX, posY; // Position
  float speedX, speedY; // Movement (linear)
  int radius; // Radius of the ball
  color ballColor; // And its color

  Ball(int r, color c)
  {
    // This actually calls the other constructor, providing the missing values
    this(random(r, width - r), random(r, height - r), random(-7, 7), random(-7, 7), r, c);
  }

  Ball(float x, float y, float sx, float sy, int r, color c)
  {
    posX = x;
    posY = y;
    speedX = sx;
    speedY = sy;
    radius = r;
    ballColor = c;
  }
 
  void moveBall()
  {
    // Move by the amount determined by the speed
    posX += speedX;
    // Check the horizontal position against the bounds of the sketch
    if (posX < radius || posX > width - radius)
    {
      // We went out of the area, we invert the h. speed (moving in the opposite direction)
      // and put back the ball inside the area
      speedX = -speedX;
      posX += speedX;
    }
    // Idem for the vertical speed/position
    posY += speedY;
    if (posY < radius || posY > height - radius)
    {
      speedY = -speedY;
      posY += speedY;
    }
  }
   
  void displayBall()
  {
    // Simple filled circle
    noStroke();
    fill(ballColor);
    ellipse(posX, posY, radius * 2, radius * 2);
  }
}

