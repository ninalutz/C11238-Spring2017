// noise, vertex

float incr1, incr2, incr3, h, a;

void setup() {
  size(900, 400);
  background(#292929);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  frameRate(20);
  fill(0,1);
  noStroke();
  rect(0, 0, width, height);
  incr2 = 300;
  incr3 = - 250;
  h = 0;
  a = 100;
  strokeWeight(random(.3,1));
  for (int i = 0; i < 7; i++) {
    beginShape();
    for (float x = 0; x <= width+200; x++) {
      stroke(h, 70, 100, a);
      vertex(x-200, (height+incr3)*noise(incr1, x/incr2));
    }
    endShape();
    incr1 +=.0004;
    incr2 -= 37;
    incr3 += 70;
    h += 5;
    a -= 7;
  }
}


