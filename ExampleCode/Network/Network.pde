
// Global variables
int bobCount = 60;
ArrayList<Bob> bobs = new ArrayList<Bob>();
float borderOffset = 60;


class Bob {
  
  PVector pos;
  PVector dir;
  float speed;
  
  Bob(float _x, float _y, float _angle, float _speed) {
    this.pos = new PVector(_x, _y);
    
    this.dir = new PVector(sin(radians(_angle)), cos(radians(_angle)));
    this.dir.normalize();
    
    this.speed = _speed;
  }
  
  void move() {
    this.pos.x += this.dir.x*this.speed;
    this.pos.y += this.dir.y*this.speed;
  }
  
  void keepInBounds() {
    if (this.pos.x < borderOffset) {
      this.pos.x = borderOffset;
      this.dir.x *= -1;
    } else if (this.pos.x > width-borderOffset) {
      this.pos.x = width-borderOffset;
      this.dir.x *= -1;
    }
    
    if (this.pos.y < borderOffset) {
      this.pos.y = borderOffset;
      this.dir.y *= -1;
    } else if (this.pos.y > height-borderOffset) {
      this.pos.y = height-borderOffset;
      this.dir.y *= -1;
    }
  }
  
  // Get number of close enough bobs
  ArrayList<Bob> getNeighbors(float threshold) {
    ArrayList<Bob> proximityBobs = new ArrayList<Bob>();
    
    for (Bob otherBob : bobs) {
      if (this == otherBob) {
        continue;
      }
      
      float distance = dist(this.pos.x, this.pos.y, otherBob.pos.x, otherBob.pos.y);
      if (distance < threshold) {
        proximityBobs.add(otherBob);
      }
    }
    
    return proximityBobs;
  }
  
  void draw() {
    ArrayList<Bob> proximityBobs = this.getNeighbors(100);
    
    // Draw blue glow
    stroke(150, 255, 200, 15);
    strokeWeight(120);
    point(this.pos.x, this.pos.y);
    
    if (proximityBobs.size() > 0) {
      float sat = map(proximityBobs.size(), 0, 10, 20, 255);
      
      // Draw line
      stroke(0, sat, 255, 50);
      strokeWeight(proximityBobs.size()*0.5);
      
      for (Bob otherBob : proximityBobs) {
        line(this.pos.x, this.pos.y, otherBob.pos.x, otherBob.pos.y);
      }
      
      // Draw red glow
      strokeWeight(proximityBobs.size()*6);
      point(this.pos.x, this.pos.y);
    }
    
    // Bobs with too many neighbours slow down, otherwise speed it up
    if (proximityBobs.size() > 3) {
      this.speed *= 0.99;
    } else {
      this.speed *= 1.01;
    }
    
    this.speed = max(0.25, min(this.speed, 6));
    
    // Draw bob
    stroke(255);
    strokeWeight(proximityBobs.size());
    point(this.pos.x, this.pos.y);
  }
}


void setup() {
  size(750, 750);
  background(0);
  colorMode(HSB, 255);
  
  for (int i = 0; i < bobCount; i++) {
    bobs.add(new Bob(random(0.0, width-borderOffset), 
                     random(0.0, height-borderOffset), 
                     random(0.0, 360.0), 
                     random(0.5, 2.0)));
  }
}


void draw() {
  background(0);
  
  for (Bob bob : bobs) {
    bob.move();
    bob.keepInBounds();
    bob.draw();
  }
}