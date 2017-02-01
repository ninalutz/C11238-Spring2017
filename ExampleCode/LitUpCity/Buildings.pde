class Building {
  PVector loc;

  float size, num, w, h;

  Building(PVector loc, float size, float w, float h) {
    this.loc  = loc;
    this.size = size*12;
    this.h = h;
    this.w = w;
  }
  
  //can draw each frame and still get 60 fps

  void draw() {
    pushMatrix();

    translate(loc.x, loc.y-num/2, loc.z);
    if(size > 1){
      stroke(0);
      //fill(constrain(size, 0, 255));
      fill(100);
    }
    else{
      stroke(255);
      fill(255);
    }
    if(w == 35 && size > 1){
      fill(255);
    }
       
    box(w, num, h);
    

    popMatrix();


    // Animate growth
    if (num < size) {
      num+=map(size, 0, 200, 0.3, 4);
    }
  }
}


void drawBuildings(){
  for (int i = 0; i < city.size (); i++) {
    Building b = (Building) city.get(i);
    b.draw();
  }
  //controls rotation speed
  num+=0.3;

}
