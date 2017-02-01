//Demo script by Nina Lutz 

/*A script that generates a random city on a predetermined grid 
and makes 3 different lights

Just my way of experimenting with Processing 3D */

void setup() {
  size(900, 700, P3D);
  initCity();
}

void draw() {
  
  background(20);
  
  camera(mouseX, mouseX, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);

  translate(width/2, height/2 + 100, 0);

  rotateX(-radians(20));
  rotateY(radians(45+num));
  
  pointLight(0, 255, 0, lightx1, -40, lightz1);
  pointLight(0, 0, 255, lightx2, -40, lightz2);
  pointLight(255, 0, 0, lightx3, -40, lightz3);
  
//  spotLight(0, 255, 0, lightx1, -40, lightz1, -1, 0, 0, PI/2, 2);
//  spotLight(0, 0, 255, lightx2, -40, lightz2, -1, 0, 0, PI/2, 2);
//  spotLight(255, 0, 0, lightx3, -40, lightz3, -1, 0, 0, PI/2, 2);

  strokeWeight(1);
  
  drawBuildings();
  drawLights();
  

}
