//initilize ArrayList and PFont
ArrayList <Splatter> splatters = new ArrayList <Splatter> ();
PFont Helvetica;
 
void setup() {
  size(1400, 1000);
  Helvetica = createFont("Helvetica", 16, true);
  smooth();
}

void draw() {
  background(255);
  textFont(Helvetica);       
  fill(0);
  textAlign(CENTER);
  text("Drag and hold your mouse to paint splatter whatever cow you feel. Just click for one splatter. \n Press b for all black splatters, r for a medium rare surprise, and c to default to grayscale. \n Press space to clear the screen.",width/2,90); 

//resets the canvas by clearing the splatters  
  if (keyPressed) {
    if (key == ' ' || key == ' ') {
      splatters.clear();
  }
    }
    
//display splatters 
  for (Splatter s: splatters){  
    s.display(); 
  }
}
