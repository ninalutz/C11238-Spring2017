/*
Waterfall cascades 3d

Controls:
  - Mouse click to change positions of collision objects.
  - Move mouse to rotate camera.

Author:
  Jason Labbe

Site:
  jasonlabbe3d.com
*/

int spawnCount = 10;
int splitCount = 4;

float pMinMass = 2;
float pMaxMass = 8;
float cMinMass = 20;
float cMaxMass = 300;

float waterfallSize = 200;

PVector cameraRot = new PVector(25, 10);

ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<Collision> collisions = new ArrayList<Collision>();


class Particle {
  
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  color displayColor;
  float fallRate;
  
  Particle(float x, float y, float z, float mass, color displayColor) {
    this.pos = new PVector(x, y, z);
    this.vel = new PVector(0, 0, 0);
    this.acc = new PVector(0, 0, 0);
    this.mass = mass;
    this.displayColor = displayColor;
    this.fallRate = map(this.mass, pMinMass, pMaxMass, 0.1, 0.05);
  }
  
  void move() {
    PVector gravity = new PVector(0, this.fallRate);
    this.acc.add(gravity);
    
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }
  
  boolean resolveCollisions() {
    boolean hasCollision = false;
    
    for (int c = 0; c < collisions.size(); c++) {
      Collision col = collisions.get(c);
      
      float distance = dist(this.pos.x, this.pos.y, this.pos.z, col.pos.x, col.pos.y, col.pos.z);
      
      if (distance < col.mass/2) {
        PVector offset = new PVector(this.pos.x, this.pos.y, this.pos.z);
        offset.sub(col.pos);
        offset.normalize();
        offset.mult(col.mass/2-distance);
        this.pos.add(offset);
        
        float friction = 0.3;
        float dampening = map(this.mass, pMinMass, pMaxMass, 1, 0.8);
        float mag = this.vel.mag();
        
        // The further to the center a particle is, the further it will shoot out.
        float magAddition = min(col.mass/2-distance, 15);
        
        PVector bounce = new PVector(this.pos.x, this.pos.y, this.pos.z);
        bounce.sub(col.pos);
        bounce.normalize();
        bounce.mult((mag+magAddition)*friction*dampening);
        this.vel = bounce;
        
        if (this.mass > 2) {
          this.mass = max(1, this.mass-2);
          
          for (int s = 0; s < splitCount; s++) {
            float mass = max(1, this.mass-1);
            color displayColor = color(255);
            
            Particle splash = new Particle(this.pos.x, this.pos.y, this.pos.z, mass, displayColor);
            
            splash.vel = new PVector(this.vel.x, this.vel.y, this.vel.z);
            splash.vel.rotate(radians(random(-45, 45)));
            splash.vel.mult(random(0.6, 0.9));
            
            particles.add(splash);
          }
        }
        
        hasCollision = true;
        
        break;
      }
    }
    
    return hasCollision;
  }
  
  void display() {
    pushMatrix();
    
    translate(this.pos.x, this.pos.y, this.pos.z);
    
    strokeWeight(this.mass);
    stroke(this.displayColor);
    point(0, 0);
    
    popMatrix();
  }
}


class Collision {
  
  PVector pos;
  float mass;
  
  Collision(float x, float y, float z, float mass) {
    this.pos = new PVector(x, y, z);
    this.mass = mass;
  }
  
  void display() {
    pushMatrix();
    
    translate(this.pos.x, this.pos.y, this.pos.z);
    
    stroke(50);
    fill(25);
    sphere(this.mass/2);
    
    popMatrix();
  }
}


void randomizeCollisions() {
  for (Collision col : collisions) {
    col.pos.x = random(-waterfallSize/2, waterfallSize/2);
    col.pos.y = random(height/2, height);
    col.pos.z = random(-waterfallSize/2, waterfallSize/2);
    col.mass = random(cMinMass, cMaxMass);
  }
}


void setup() {
  size(800, 800, P3D);
  
  smooth(0);
  sphereDetail(12);
  
  for (int i = 0; i < 10; i++) {
    collisions.add(new Collision(0, 0, 0, 1));
  }
  
  randomizeCollisions();
}


void draw() {
  background(50);
  
  colorMode(HSB, 360);
  
  for (int num = 0; num < spawnCount; num++) {
    float x = random(-waterfallSize, waterfallSize);
    float z = random(-waterfallSize/4, waterfallSize/4);
    float mass = random(pMinMass, pMaxMass);
    color displayColor;
    
    if (particles.size() % 5 == 0) {
      displayColor = color(240);
    } else {
      displayColor = color(random(180, 210), 255, 255);
    }
    
    particles.add(new Particle(x, 0, z, mass, displayColor));
  }
  
  colorMode(RGB, 255);
  
  translate(width/2, 0, -500);
  rotateX(radians(cameraRot.y));
  rotateY(radians(cameraRot.x));
  
  for (int i = collisions.size()-1; i > -1; i--) {
    Collision col = collisions.get(i);
    
    col.display();
  }
  
  for (int i = particles.size()-1; i > -1; i--) {
    Particle p = particles.get(i);
    
    p.move();
    
    boolean hasCollision = p.resolveCollisions();
    
    p.display();
    
    if (p.pos.y > height) {
      particles.remove(i);
    } else if (hasCollision && p.vel.mag() < 0.1) {
      particles.remove(i);
    }
  }
}


void mouseMoved() {
  cameraRot.x = map(mouseX, 0, width, -90, 90);
  cameraRot.y = map(mouseY, 0, height, -90, 90);
}


void mousePressed() {
  randomizeCollisions();
}