public class POI{
PVector location;
int income, id, total, close, open;
ArrayList<Edge> edgein = new ArrayList<Edge>();
ArrayList<Edge> edgeout = new ArrayList<Edge>();


  POI(PVector _location, int _id, int _income, int _total, int _close, int _open){
        location = _location;
        id = _id;
        close = _close;
        open = _open;
        total = _total;
        income = _income;
         }
  
//  void drawNodes(PGraphics p){
//      PVector loc = mercatorMap.getScreenLocation(location);
//      p.beginDraw();
//      p.stroke(0);
//      p.strokeWeight(2);
//      if(total > 0){
//      if(income == 1){
//      p.fill(income1color, 10*(total/5));
//      }
//      if(income == 2){
//      p.fill(income2color, 10*(total/5));
//      }
//      if(income == 3){
//      p.fill(income3color, 10*(total/5));
//      }
//      p.ellipse(loc.x, loc.y, 15, 15);
//      }
//      else{
//      p.fill(255, 50);
//      p.ellipse(loc.x, loc.y, 15, 15);
//      }
//  p.endDraw();  
//}

}

public class Places{
ArrayList<POI>places = new ArrayList<POI>();
int id;

Places(int _id){
    id = _id;
}

  void drawNodes(PGraphics p){
     p.beginDraw();
    for(int i = 0; i<places.size(); i++){
      PVector loc = mercatorMap.getScreenLocation(places.get(i).location);

      p.stroke(0);
      p.strokeWeight(2);
      int total = places.get(i).total;
      if(total > 0){
      if(places.get(i).income == 1){
      p.fill(income1color);
      }
      if(places.get(i).income == 2){
      p.fill(income2color);
      }
      if(places.get(i).income == 3){
      p.fill(income3color);
      }
      p.ellipse(loc.x, loc.y, 15, 15);
      }
      else{
      p.fill(255, 50);
      p.ellipse(loc.x, loc.y, 15, 15);
      }
    }
  p.endDraw();  
  p.clear();
}

}

