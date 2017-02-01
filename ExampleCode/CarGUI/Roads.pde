
 float xPos=0;  
 float xDir=.5;
        
 StopWatchTimer sw = new StopWatchTimer();
 StopWatchTimer sw2 = new StopWatchTimer();

public class Road{
  public String name; 
  public int capacity, speed, id;
  public float flow, len;
  PVector start, end; 
  color c;
 
 
   Road(PVector _start, PVector _end, int _id, float _flow, int _capacity, int _speed){
    start = _start;
    flow = _flow;
    id = _id;
    end = _end;
    capacity = _capacity;
    speed = _speed;
  }


}


public class RoadNetwork{
  
  public color none = color(46, 229, 13);
  public color full = color(255, 0, 0);
  
  public ArrayList<Road>Roads = new ArrayList<Road>();
  public FloatList Flows = new FloatList();
  
  public int time;
  public String name;
  public boolean AM, carpool;
  
  RoadNetwork(String _name, int _time, boolean _AM, boolean _carpool){
      time = _time;
      AM = _AM;
      carpool = _carpool;
      name = _name;
  }
  
  public void flows(){
      for(int i = 0; i<Roads.size(); i++){
          Flows.append(abs(Roads.get(i).flow));
      }
  
  }

  public void drawRoads(PGraphics p){
    
   p.beginDraw();
//   
//     for(int i =0; i <nodes.getRowCount(); i++){
//    PVector loc = mercatorMap.getScreenLocation(new PVector(nodes.getFloat(i, "lat"), nodes.getFloat(i, "lon")));
//    p.text(nodes.getInt(i, "id"), loc.x + 5, loc.y);
//   }


  //if(am){
    for(int i = 0; i<Roads.size(); i++){
          //println(Flows.max());
          PVector startViz = mercatorMap.getScreenLocation(Roads.get(i).start);
          PVector endViz = mercatorMap.getScreenLocation(Roads.get(i).end);
   
          color inter = lerpColor(none, full, abs(Roads.get(i).flow)/Roads.get(i).capacity);
          p.strokeWeight(7);
          p.stroke(inter);
          p.fill(#0000ff);
          
          p.line(startViz.x, startViz.y, endViz.x, endViz.y);

    }
  //}   

  
    
       p.endDraw();
       p.clear();
  }
  public void drawCars(PGraphics p){
      println("Drawing cars");
        p.beginDraw();
        
        //p. ellipse(xPos, 200, 40, 40);
   
        xPos=xPos+xDir;

    for(int i = 0; i<Roads.size(); i++){
      
              if(Roads.get(i).flow <= Roads.get(i).capacity){
                for(int j = 0; j<round(Roads.get(i).flow); j++){   
//                    PVector thing = mercatorMap.endpoint(Roads.get(i).start, xPos, mercatorMap.bearing(Roads.get(i).start, Roads.get(i).end));
                    PVector intermed = mercatorMap.intermediate(Roads.get(i).start, Roads.get(i).end, 1.0/round(Roads.get(i).flow)*j);
                     PVector thing = mercatorMap.endpoint(intermed, xPos, mercatorMap.bearing(Roads.get(i).start, Roads.get(i).end));
                    
                    //println(intermed);
        
                    PVector intermed2 = mercatorMap.getScreenLocation(intermed);
                    PVector thing2 = mercatorMap.getScreenLocation(thing);
                 //println(sw.getElapsedTime());
                 if(sw.getElapsedTime() > 900){
                   xPos = 0;
                   sw.start();
                 }

                    p.noStroke();
                    p.fill(color(255, 238, 0));
                    p.ellipse(thing2.x, thing2.y, 7, 7);
                }
          }
          
          if(Roads.get(i).flow > Roads.get(i).capacity){
                for(int j = 0; j<round(Roads.get(i).flow); j++){   
//                    PVector thing = mercatorMap.endpoint(Roads.get(i).start, xPos, mercatorMap.bearing(Roads.get(i).start, Roads.get(i).end));
                    PVector intermed = mercatorMap.intermediate(Roads.get(i).start, Roads.get(i).end, 1.0/round(Roads.get(i).flow)*j);
                     PVector thing = mercatorMap.endpoint(intermed, xPos*(Roads.get(i).capacity/Roads.get(i).flow), mercatorMap.bearing(Roads.get(i).start, Roads.get(i).end));
                          
                    PVector intermed2 = mercatorMap.getScreenLocation(intermed);
                    PVector thing2 = mercatorMap.getScreenLocation(thing);
                    

                 if(sw.getElapsedTime() > 900){
                   xPos = 0;
                   sw.start();
                 }

                    p.noStroke();
                    p.fill(color(255, 238, 0));
                    
//                    println(thing2, mercatorMap.getScreenLocation(Roads.get(i).end));
                    p.ellipse(thing2.x, thing2.y, 7, 7);
                }
          }
    }
  p.endDraw();
  p.clear();
  }
  


}
