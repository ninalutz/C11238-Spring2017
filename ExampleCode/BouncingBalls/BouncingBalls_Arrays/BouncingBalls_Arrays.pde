// http://wiki.processing.org/w/From_several_variables_to_arrays

// Ball handling
final int BALL_NB = 5;
// Positions
float[] posX = new float[BALL_NB];
float[] posY = new float[BALL_NB];
// Movement (linear)
float[] speedX = new float[BALL_NB];
float[] speedY = new float[BALL_NB];
// Radius of the balls
int[] radius = { 8, 16, 24, 32, 48 };
// And the colors
color[] ballColor = { #DDEE55, #AA44EE, #22BBAA, #0022FF, #00FF22 };
 
void setup()
{
  size(600, 400);
  smooth();
 
  // Initialize the balls' data
  for (int i = 0; i < BALL_NB; i++)
  {
    posX[i] = random(radius[i], width - radius[i]);
    posY[i] = random(radius[i], height - radius[i]);
    speedX[i] = random(-7, 7);
    speedY[i] = random(-7, 7);
  }
}
 
void draw()
{
  // Erase the sketch area
  background(#AAFFEE);
  for (int i = 0; i < BALL_NB; i++)
  {
    // Compute the new ball position
    moveBall(i);
    // And display it
    displayBall(i);
  }
}
 
void moveBall(int n)
{
  // Move by the amount determined by the speed
  posX[n] += speedX[n];
  // Check the horizontal position against the bounds of the sketch
  if (posX[n] < radius[n] || posX[n] > width - radius[n])
  {
    // We went out of the area, we invert the h. speed (moving in the opposite direction)
    // and put back the ball inside the area
    speedX[n] = -speedX[n];
    posX[n] += speedX[n];
  }
  // Idem for the vertical speed/position
  posY[n] += speedY[n];
  if (posY[n] < radius[n] || posY[n] > height - radius[n])
  {
    speedY[n] = -speedY[n];
    posY[n] += speedY[n];
  }
}
 
void displayBall(int n)
{
  // Simple filled circle
  noStroke();
  fill(ballColor[n]);
  ellipse(posX[n], posY[n], radius[n] * 2, radius[n] * 2);
  fill(#FF0000);
  text(str(n), posX[n], posY[n]);
}

boolean bStopped;
void mousePressed() { if (bStopped) loop(); else noLoop(); bStopped = !bStopped; }

