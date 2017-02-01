/*
Simple script that draws a Hilbert curve

User can control the recursion by pressing + and -

*/


import peasy.*; 
PeasyCam cam;
int levels = 2; // recursion depth

void setup(){
  size( 700, 700, P3D);
  cam = new PeasyCam(this, 0,0, 0, 100);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(500);
  cam.setDistance(300);
}


void draw(){
  background(255);
  // hilbert3D(center, side-length, recursion depth, start-indices)
  
  //makes vector array for the hilbert coordinates
  Vector c3d[] = hilbert3D(new Vector( 0,0,0) , 100.0, levels, 0, 1, 2, 3, 4, 5, 6, 7); 
  
  strokeWeight(3); stroke(0);
  
  //goes through array and draws curve each frame
  for(int i = 0; i < c3d.length-1; i++)
    line(c3d[i].x, c3d[i].y, c3d[i].z, c3d[i+1].x, c3d[i+1].y, c3d[i+1].z);
    
}

