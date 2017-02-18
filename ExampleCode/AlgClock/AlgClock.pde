float rad, amp, x, y, incr, n, grow, dot;

void setup() {
  size(400, 400);
  strokeWeight(.1);
  incr = TWO_PI/1000;
  n = 1;
  grow = millis()%1000/1000;
  background(255);
  noFill();
}

void draw() {
  grow += random(.001, .002);
  //println(hour()/10000.0);
  fill(255);
  amp = (sin(second()* .01) * n) * grow;
  rad = (hour() + sin(second()* .016) * minute()) * grow;
  dot = map(sin(second()* .001), -1, 1, .1, 1);
  translate(width/2, height/2);
  rotate(sin(frameCount* .005) * .9);
  for (float ang = 0; ang < TWO_PI; ang += incr) {
    x  = (rad + amp * sin(n*ang)) *cos(ang) ;
    y  = (rad + amp * cos(n*ang)) *sin(ang); 
    stroke(abs(sin(ang*3)*240), grow*50);
    ellipse(x, y, dot, dot);
  }
 
 if(second() == 0){
   loop();
  background(255);
  //n = random(12, 18);
  //n = hour();
  grow = millis()%1000/1000;
 }
}