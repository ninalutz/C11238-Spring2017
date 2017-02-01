//defaults for trees
int level = 1;
float ratio=2; 

//L System function, recursively grows the L System according to the grammar 

void tree(int level, int max_level, float size, float ratio, float angle, float fan){
  level+=1;
  size *= .7;

  if(level<max_level){
  strokeWeight(size / 10);
   pushMatrix();
   left(angle + fan);
   forward(size - ratio);
   tree(level, max_level, size, ratio, angle, fan);
   popMatrix();

   strokeWeight(size/10);
   
   pushMatrix();
   right(angle - fan);
   forward(size + ratio);
   tree(level, max_level, size, ratio, angle, fan);
   popMatrix();
  }
}

//these functions are the grammer rules of the L System
void forward(float length){
  line(0,0, 0, -length);
  translate(0, -length);
}

void left(float angle){
  rotate(radians(-angle));
}

void right(float angle){
  rotate(radians(angle));
}
