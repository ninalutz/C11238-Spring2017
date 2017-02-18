// Illustration of http://wiki.processing.org/w/How_to_manage_the_steps_of_a_game:_increasing_levels,_displaying_messages,_etc.%3F
 
// Ball handling
float posX, posY;
float speedX, speedY;
int radius;
color ballColor;
 
boolean bDisplayMessage; // False by default
int startTime; // The (last) time when the mouse have been clicked
final int DISPLAY_DURATION = 1000; // in milliseconds = 1s

int playButtonWidth, playButtonHeight;
int playButtonX, playButtonY;
boolean bStarted;
 
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
  
  playButtonWidth = width / 5;
  playButtonHeight = height / 8;
  playButtonX = width / 2;
  playButtonY = 4 * height / 5;
}
 
void draw()
{
  // Erase the sketch area
  background(#AAFFEE);
  
  if (!bStarted)
  {
    showWelcomeScreen();
    return;
  }
  
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
  // Check if we haven't started yet, and if the click is within the button bounds
  if (!bStarted && isMouseOverPlayButton())
  {
    // Now, we can start!
    bStarted = true;
    return;
  }
  
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

void showWelcomeScreen()
{
  // Title
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(#8888FF);
  text("Bouncing Ball", width / 2, height / 2);
  
  // Play button
  fill(#EEEE88);
  stroke(#AAAA55);
  rectMode(CENTER);
  rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight, 10, 10);
  fill(#FF5500);
  textSize(32);
  text("PLAY", playButtonX, playButtonY);
  
  // Instructions
  textSize(24);
  fill(#5555AA);
  text("Click on the ball to win", width / 2, height / 2 + 50);
}

boolean isMouseOverPlayButton()
{
  // Half-wdith
  int hw = playButtonWidth / 2;
  // Half-height
  int hh = playButtonHeight / 2;
  return mouseX >= playButtonX - hw && mouseX <= playButtonX + hw &&
      mouseY >= playButtonY - hh && mouseY <= playButtonY + hh;
}

