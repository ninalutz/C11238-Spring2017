class Paddle{
  float x, y;
  Paddle(float _x, float _y){
    x = _x;
    y = _y;
  }
  
  void update(){
    y = (mouseY);
  }
 
  
  void display(){
    rect(x, y, 25, 85);
  }
  
}
