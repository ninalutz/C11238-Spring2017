/* A little, messy sketch to see if a PVector is in a PShape
*/

int numvertices = int(random(4, 10));
PVector point = new PVector(random(50, width-50), random(50, height-50));
color c = color(random(255), random(255), random(255));
PShape s;
int inshape = 0;

void setup(){
  size(800, 600, P3D);
  
  //initializes a random shape
  initShape();
}

void draw(){
  background(255);
  fill(0);
  text("Press 's' for a new shape, 'p' for a new point, and space for both. Hovering on shape fills it black.", 20, 20);
  
  //hover function determines color if hovering
  hover();
  
  //draws shape
  shape(s, 0, 0);
  
  //draws a random point and colors it if its in or out of the polygon
  if(inPolygon(s, point) == true){
  fill(0,255,0);
  ellipse(point.x, point.y, 10, 10);
  }
  if(inPolygon(s, point) == false){
  fill(255, 0, 0);
  ellipse(point.x, point.y, 10, 10);
  }
  
}

void keyPressed(){ 
  if(key == 'p'){
    point = new PVector(random(50, width-50), random(50, height-50));
    redraw();
  }
  if(key == 's'){
    initShape();
    redraw();
  }
  if(key == ' '){
    initShape();
    point = new PVector(random(50, width-50), random(50, height-50));
    redraw();
  }
}


//returns if a PVector is in a PShape
boolean inPolygon(PShape shape, PVector point){
    int num = shape.getVertexCount();
    int i = num - 1;
    int j = i;
    boolean contains = false;
    
    for (i = 0; i < num; i++){
      PVector vi = shape.getVertex(i);
      PVector vj = shape.getVertex(j);
         
        if(vi.y < point.y && vj.y >= point.y || vj.y < point.y && vi.y >= point.y){
            if (vi.x + (point.y - vi.y) / (vj.y - vi.y) * (vj.x - vi.x) < point.x){
               contains=!contains;
            }
          }
      j=i;
    }
    return contains;
}

//initializes a random PShape 
void initShape(){
  numvertices = int(random(4, 10));
   c = color(random(255), random(255), random(255));
  s = createShape(); 
  s.beginShape(); 
  s.stroke(0);
  PVector firstpoint = new PVector(random(50, width-50), random(50, height-50));
  
  for(int i =0; i<numvertices; i++){   
      PVector vertice = new PVector(random(50, width-50), random(50, height-50));
      println(vertice);
      //add first point at begining and end to complete the outline
      if(i == 0 || i == numvertices-1){
          s.vertex(firstpoint.x, firstpoint.y);
      }
      else{
        s.vertex(vertice.x, vertice.y);
      }
  }
  s.endShape();

}

//hover behavior for the mouse and color
void hover(){
  PVector mouse = new PVector(mouseX, mouseY);
  if(inPolygon(s, mouse) == true){
    s.setFill(#000000);
  }
  
 if(inPolygon(s, mouse) == false){
    s.setFill(c);
  }
  
}
