// Oval balls with a direction, bouncing off the walls
Ball ball1, ball2;

void setup()
{
  size(600, 400);
  smooth();

  ball1 = new Ball(20, 50, -5, 8, 23, #002277);
  ball2 = new Ball(120, 150, 7, -3, 31, #007722);
}

void draw()
{
  background(#AAFFEE);
  ball1.Move();
  ball2.Move();
  ball1.Display();
  ball2.Display();
}


class Ball
{
  float posX, posY; // Position
  float speedX, speedY; // Movement (linear)
  float radius;
  color ballColor;
  float angle;
  float squashFactor;

  Ball(float px, float py, float sX, float sY, float r, color c)
  {
    posX = px; posY = py;
    speedX = sX; speedY = sY;
    radius = r; ballColor = c;
  }

  void Move()
  {
    squashFactor = 1.2;
    posX += speedX;
    if (posX < radius || posX > width - radius)
    {
      speedX = -speedX;
      posX += speedX;
      squashFactor = 1.0;
    }
    posY += speedY;
    if (posY < radius || posY > height - radius)
    {
      speedY = -speedY;
      posY += speedY;
      squashFactor = 1.0;
    }
    angle = atan2(speedY, speedX);
  }

  void Display()
  {
    noStroke();
    fill(ballColor);
// Old drawing method, easy and boring...
//    ellipse(posX, posY, radius * 2, radius * 2);
    // New method: I draw at 0, 0 and translate and rotate at the right place
    pushMatrix();
    translate(posX, posY);
    rotate(angle);
    ellipse(0, 0, radius * 2 * squashFactor, radius * 2 / squashFactor);
    stroke(255);
    noFill();
    ellipse(2 * radius / 3, 0, radius / 3, radius / 3);
    popMatrix();
  }
}
