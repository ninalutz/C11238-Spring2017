//delay between loops (in milliseconds)
int delay = 1000;
//speed for the edges, you could also set this individually
float increment = .0005;

//duration of animation
int duration, sel, mini;
//initialTime, loops per animation
long initialTime;

public class Edge {
    //speed of animation
    private float increment;
    private PVector orig, dest;
    private color incomecolor;
    
    ArrayList<PVector>preps = new ArrayList<PVector>();
    int amount, type, origin_id, destination_id, id, income;
    
    //constructor
          Edge(PVector _origin, PVector _destination, float _increment, int _amount, int _income, color _incomecolor, int _oi, int _di){
              increment = _increment; 
              orig = _origin;
              dest = _destination;
              amount = _amount; 
              income = _income; 
              origin_id = _oi;
              destination_id = _di;
              incomecolor = _incomecolor;
          }
    
    
    //draw lines
    public void pauseEdge(){
      noStroke();
      PVector origin = mercatorMap.getScreenLocation(orig);
      PVector destination = mercatorMap.getScreenLocation(dest);
      //println(origin, destination);
      fill(incomecolor, 150);
      PVector hold = new PVector(destination.x, destination.y);
      PVector B = new PVector(hold.x-origin.x, hold.y-origin.y);
      hold = new PVector(destination.x, destination.y);
      B.normalize();
      B.mult(duration/(amount*10));
      B.rotate(PI/2);  
      PVector pointa = new PVector(hold.x + B.x, hold.y+B.y);
      hold = new PVector(destination.x, destination.y);
//      PVector pointb = hold.sub(B);
      PVector pointb = new PVector(hold.x-B.x, hold.y-B.y);
      hold = new PVector(destination.x, destination.y);
     triangle(origin.x, origin.y, pointa.x, pointa.y, pointb.x, pointb.y);
            if(origin.x == destination.x && origin.y == destination.y){
               fill(incomecolor);
               ellipse(origin.x, origin.y, amount, amount);
             }
      }
        
    public void drawEdge(){
      noStroke();
      //println("drwaing thing");
      fill(incomecolor, 150);
        PVector origin = mercatorMap.getScreenLocation(orig);
        PVector destination = mercatorMap.getScreenLocation(dest);
        float x = origin.x; 
        float y = origin.y;
        float xspeed = abs(destination.x-origin.x)*increment;
        float yspeed = abs(destination.y-origin.y)*increment;
        
     //there are 4 cases of lines and need to cover all 4 to preserve the orientation of going from origin to destination 
     //case 1: line moving down and right
      if(origin.x <= destination.x && origin.y <= destination.y){ //<>//
            if(x+(millis()-initialTime)*xspeed < destination.x && y+(millis()-initialTime)*yspeed < destination.y){ //<>//
                    PVector holddest = new PVector(x+(millis()-initialTime)*xspeed, y + (millis()-initialTime)*yspeed);
                    PVector Bf = new PVector(holddest.x-origin.x, holddest.y-origin.y);
//                    PVector Bf = holddest.sub(origin);
                    holddest = new PVector(x+(millis()-initialTime)*xspeed, y + (millis()-initialTime)*yspeed);
                    Bf.normalize();
                    Bf.mult(((millis()-initialTime))/(amount*10));
                    Bf.rotate(PI/2);  
//                    PVector point1 = holddest.add(Bf);
                    PVector point1 = new PVector(holddest.x+Bf.x, holddest.y+Bf.y);
                    holddest = new PVector(x+(millis()-initialTime)*xspeed, y + (millis()-initialTime)*yspeed);
//                    PVector point2 = holddest.sub(Bf);
                    PVector point2 = new PVector(holddest.x-Bf.x, holddest.y-Bf.y);
                    
                    triangle(origin.x, origin.y, point1.x, point1.y, point2.x, point2.y);
                    duration = int(millis()-initialTime);                    
               }
               

            else if(!needLoop){
                    PVector hold = new PVector(destination.x, destination.y);
//                    PVector B = hold.sub(origin);
                    PVector B = new PVector(hold.x-origin.x, hold.y-origin.y);
                    hold = new PVector(destination.x, destination.y);
                    B.normalize();
                    B.mult(duration/(amount*10));
                    B.rotate(PI/2);  
//                    PVector pointa = hold.add(B);
                   PVector pointa = new PVector(hold.x+B.x, hold.y+B.y);    
                    hold = new PVector(destination.x, destination.y);
//                    PVector pointb = hold.sub(B);
                    PVector pointb = new PVector(hold.x-B.x, hold.y-B.y);  
                    hold = new PVector(destination.x, destination.y);
                   triangle(origin.x, origin.y, pointa.x, pointa.y, pointb.x, pointb.y);
                      if(millis() > initialTime+duration + delay){
                          needLoop = !needLoop;
                          }
                 }   
      }
      //case 2: line moving up and right
      if(origin.x <= destination.x && origin.y >= destination.y){
            if(x+(millis()-initialTime)*xspeed < destination.x && y+(millis()-initialTime)*yspeed > destination.y){
                  line(x,y,x+(millis()-initialTime)*xspeed, y - (millis()-initialTime)*yspeed);
                    PVector holddest = new PVector(x+(millis()-initialTime)*xspeed, y - (millis()-initialTime)*yspeed);
//                    PVector Bf = holddest.sub(origin);
                    PVector Bf = new PVector(holddest.x-origin.x, holddest.y-origin.y);
                    holddest = new PVector(x+(millis()-initialTime)*xspeed, y - (millis()-initialTime)*yspeed);
                    Bf.normalize();
                    Bf.mult(((millis()-initialTime))/(amount*10));
                    Bf.rotate(PI/2);  
//                    PVector point1 = holddest.add(Bf);
                     PVector point1 = new PVector(holddest.x+Bf.x, holddest.y+Bf.y);
                    holddest = new PVector(x+(millis()-initialTime)*xspeed, y - (millis()-initialTime)*yspeed);
                     PVector point2 = new PVector(holddest.x-Bf.x, holddest.y-Bf.y);
                    triangle(origin.x, origin.y, point1.x, point1.y, point2.x, point2.y);
                    duration = int(millis()-initialTime);
                }
            else if(!needLoop){
                  PVector hold = new PVector(destination.x, destination.y);
                    PVector B = new PVector(hold.x-origin.x, hold.y-origin.y);
                    hold = new PVector(destination.x, destination.y);
                    B.normalize();
                    B.mult(duration/(amount*10));
                    B.rotate(PI/2);  
//                    PVector pointa = hold.add(B);
                    PVector pointa = new PVector(hold.x+B.x, hold.y+B.y);  
                    hold = new PVector(destination.x, destination.y);
//                    PVector pointb = hold.sub(B);
                  PVector pointb = new PVector(hold.x-B.x, hold.y-B.y);  
                    hold = new PVector(destination.x, destination.y);
                   triangle(origin.x, origin.y, pointa.x, pointa.y, pointb.x, pointb.y);
                      if(millis() > initialTime+duration + delay){
                          needLoop = !needLoop;
                          }
                  }
      }
      
      //case 3: line moving left and up
      if(origin.x >= destination.x && origin.y >= destination.y){
          if(x-(millis()-initialTime)*xspeed > destination.x && y+(millis()-initialTime)*yspeed > destination.y){
                //line(x,y,x-(millis()-initialTime)*xspeed, y - (millis()-initialTime)*yspeed);
                   PVector holddest = new PVector(x-(millis()-initialTime)*xspeed, y - (millis()-initialTime)*yspeed);
//                    PVector Bf = holddest.sub(origin);
                    PVector Bf = new PVector(holddest.x-origin.x, holddest.y-origin.y);
                    holddest = new PVector(x-(millis()-initialTime)*xspeed, y - (millis()-initialTime)*yspeed);
                    Bf.normalize();
                    Bf.mult(((millis()-initialTime))/(amount*10));
                    Bf.rotate(PI/2);  
//                    PVector point1 = holddest.add(Bf);
                  PVector point1 = new PVector(holddest.x+Bf.x, holddest.y+Bf.y);
                    holddest = new PVector(x-(millis()-initialTime)*xspeed, y - (millis()-initialTime)*yspeed);
                    //PVector point2 = holddest.sub(Bf);
                     PVector point2 = new PVector(holddest.x-Bf.x, holddest.y-Bf.y);
                    triangle(origin.x, origin.y, point1.x, point1.y, point2.x, point2.y);
                    duration = int(millis()-initialTime);
               }
          else if(!needLoop){
                   PVector hold = new PVector(destination.x, destination.y);
//                    PVector B = hold.sub(origin);
                    PVector B = new PVector(hold.x-origin.x, hold.y-origin.y);  
                    hold = new PVector(destination.x, destination.y);
                    B.normalize();
                    B.mult(duration/(amount*10));
                    B.rotate(PI/2);  
//                    PVector pointa = hold.add(B);
                    PVector pointa = new PVector(hold.x+B.x, hold.y+B.y);  
                    hold = new PVector(destination.x, destination.y);
//                    PVector pointb = hold.sub(B);
                    PVector pointb = new PVector(hold.x-B.x, hold.y-B.y);  
                    hold = new PVector(destination.x, destination.y);
                   triangle(origin.x, origin.y, pointa.x, pointa.y, pointb.x, pointb.y);
                  if(millis() > initialTime+duration + delay){
                      needLoop = !needLoop;
                  }
            }
      }
      
      //case 4: line moving left and down
      if(origin.x >= destination.x && origin.y <= destination.y){
          if(x-(millis()-initialTime)*xspeed > destination.x && y+(millis()-initialTime)*yspeed < destination.y){
                 PVector holddest = new PVector(x-(millis()-initialTime)*xspeed, y + (millis()-initialTime)*yspeed);
//                    PVector Bf = holddest.sub(origin);
                    PVector Bf = new PVector(holddest.x-origin.x, holddest.y-origin.y);
                    holddest = new PVector(x-(millis()-initialTime)*xspeed, y + (millis()-initialTime)*yspeed);
                    Bf.normalize();
                    Bf.mult(((millis()-initialTime))/(amount*10));
                    Bf.rotate(PI/2);  
//                    PVector point1 = holddest.add(Bf);
                    PVector point1 = new PVector(holddest.x+Bf.x, holddest.y+Bf.y);
                    holddest = new PVector(x-(millis()-initialTime)*xspeed, y + (millis()-initialTime)*yspeed);
//                    PVector point2 = holddest.sub(Bf);
                    PVector point2 = new PVector(holddest.x-Bf.x, holddest.y-Bf.y);
                    triangle(origin.x, origin.y, point1.x, point1.y, point2.x, point2.y);
                    duration = int(millis()-initialTime);
                }
          else if(!needLoop){
              PVector hold = new PVector(destination.x, destination.y);
//                    PVector B = hold.sub(origin);
                    PVector B = new PVector(hold.x-origin.x, hold.y-origin.y);  
                    hold = new PVector(destination.x, destination.y);
                    B.normalize();
                    B.mult(duration/(amount*10));
                    B.rotate(PI/2);  
//                    PVector pointa = hold.add(B);
                    PVector pointa = new PVector(hold.x+B.x, hold.y+B.y);  
                    hold = new PVector(destination.x, destination.y);
//                    PVector pointb = hold.sub(B);
                   PVector pointb = new PVector(hold.x-B.x, hold.y-B.y);  
                    hold = new PVector(destination.x, destination.y);
                   triangle(origin.x, origin.y, pointa.x, pointa.y, pointb.x, pointb.y);
                    if(millis() > initialTime+duration + delay){
                        needLoop = !needLoop;
                    }
              }
        }
        
      if(origin.x == destination.x && origin.y == destination.y){
         ellipse(origin.x, origin.y, amount, amount);
       }
    }
}
