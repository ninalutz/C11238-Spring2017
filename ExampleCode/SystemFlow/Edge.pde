/*EDGE Class

Every edge has a speed, thickness, color, type, origin, destination, id, and an origin and destination id

Therefore each edge knows what towers it goes between 

This code sets the increment as universal, but it can be set differently for different edges 

To draw the line animations, you have to consider the four cases of lines and draw accordingly

There is a "pause" function in here that just draws stagnant lines 
*/

public class Edge {
    //speed of animation
    private float increment;
    private PVector origin, destination;
    private color language; 
    ArrayList<PVector>preps = new ArrayList<PVector>();
    int amount, type, origin_id, destination_id, id;
    
    //constructor
          Edge(PVector _origin, PVector _destination, float _increment, int _amount, color _language, int _type, int _oi, int _di, int _id){
              increment = _increment; 
              origin = _origin;
              destination = _destination;
              amount = _amount; 
              language = _language; 
              type = _type;
              origin_id = _oi;
              destination_id = _di;
              id = _id;
          }
    
    //draw lines
    public void pauseEdge(){
      fill(language, 150);
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
               fill(language, 200);
               ellipse(origin.x, origin.y, amount, amount);
             }
      }
        
    public void drawEdge(){
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
