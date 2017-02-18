// Illustration of http://wiki.processing.org/w/How_do_I_display_a_message_for_a_few_seconds%3F
 
// Ball handling
float posX, posY;
float speedX, speedY;
int radius;
color ballColor;
 
boolean bDisplayMessage; // False by default
int startTime; // The (last) time when the mouse have been clicked
final int DISPLAY_DURATION = 1000;; // in milliseconds = 1s
 
void setup()
{
  size(600, 400);
  smooth();
  
  PFont f = createFont("Arial", 48);
  textFont(f);

  // Initialize the ball's data 
  posX = 120;
  posY = 50;
  speedX = -2;
  speedY = 3;
  radius = 24;
  ballColor = #002277;
}
 
void draw()
{
  // Erase the sketch area
  background(#AAFFEE);
  if (bDisplayMessage)
  {
    // Display the message instead of the ball
    fill(#FFAA88);
    text("You got it!", 150, height / 2);
    // If the spent time is above the defined duration
    if (millis() - startTime > DISPLAY_DURATION) 
    {
      // Stop displaying the message, thus resume the ball moving
      bDisplayMessage = false;
    }
  }
  else
  {
    // Compute the new ball position
    moveBall();
    // And display it
    displayBall();
  }
}
 
void mousePressed()
{
  // True if mouse position is close of the center of the ball (less than the radius in distance)
  // (Better than if (cond) b = true; else b = false; !)
  bDisplayMessage = dist(mouseX, mouseY, posX, posY) < radius;
  // Record the time of the event
  startTime = millis();
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

