class Ball{
 int radius;
 float xspeed, yspeed, x, y;
 Ball(int _radius, float _xspeed, float _yspeed, int _initx, int _inity){
   radius = _radius;
   xspeed = _xspeed;
   yspeed = _yspeed;
   x = _initx;
   y = _inity;
 }

 void update(){
  x += xspeed;
  y += yspeed;
 }
 
 void display(){
   ellipse(x, y, 20, 20);
 }
 
}
