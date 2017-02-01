RoadNetwork non7, car7, non9, car9, non11, car11, distributedcar, dynamicthingcar, dynamicthing, distributednon, non5, car5, non9pm, car9pm, car10, non10, non11pm, car11pm;

Places stuff;

ArrayList<Edge> all = new ArrayList<Edge>();
ArrayList<Edge> french = new ArrayList<Edge>();
ArrayList<Edge> spanish = new ArrayList<Edge>();
ArrayList<Edge> other = new ArrayList<Edge>();

void generateClosingRoads(){
  String t = "t" + tint;
  dynamicthing = new RoadNetwork("dynamic", 500, false, false);
  dynamicthingcar = new RoadNetwork("dynamiccar", 501, false, true);
  
    for(int i = 0; i<closing.getRowCount(); i++){
    int startid = closing.getInt(i, "Start");
    int endid = closing.getInt(i, "End");
    PVector start = new PVector(nodes.getFloat(startid - 1,"lat"), nodes.getFloat(startid - 1,"lon"));
    PVector end = new PVector(nodes.getFloat(endid - 1,"lat"), nodes.getFloat(endid - 1,"lon"));
    
     Road dynamic = new Road(start, end, i, closing2.getFloat(i, t), opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
     Road dynamiccar = new Road(start, end, i, closing.getFloat(i, t)/2, opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
     dynamicthing.Roads.add(dynamic);
     dynamicthingcar.Roads.add(dynamiccar);
     
    }
  
}

void generateOpeningRoads(){
  stuff = new Places(1);
  non7 = new RoadNetwork("7amnocarpool", 7, true, false);
  car7 = new RoadNetwork("7amcarpool", 7, true, true);
   non9 = new RoadNetwork("9amnocarpool", 7, true, false);
   non11 = new RoadNetwork("11amnocarpool", 7, true, false);
   car11 = new RoadNetwork("11amcarpool", 7, true, true);
   car9 = new RoadNetwork("9amcarpool", 7, true, true);
   distributedcar = new RoadNetwork("distributedcar", 7, true, true);
   distributednon = new RoadNetwork("distributednon", 7, true, true);
   //  RoadNetwork(String _name, int _time, boolean _AM, boolean _carpool){
   
   non5 = new RoadNetwork("5pmnocarpool", 5, false, false);
     car5 = new RoadNetwork("5pmcarpool", 5, false, false);
   car9pm = new RoadNetwork("9pmcarpool", 5, false, false);
      non9pm = new RoadNetwork("9pmnocarpool", 5, false, false);
   car10 = new RoadNetwork("10pmcarpool", 5, false, false);
      non10 = new RoadNetwork("10pmnocarpool", 5, false, false);
   car11pm = new RoadNetwork("11pmcarpool", 5, false, false);
      non11pm = new RoadNetwork("11pmnocarpool", 5, false, false);
 
  
  for(int i = 0; i<opening.getRowCount(); i++){
    int startid = opening.getInt(i, "start node");
    int endid = opening.getInt(i, "end node");
           PVector start = new PVector(nodes.getFloat(startid - 1,"lat"), nodes.getFloat(startid - 1,"lon"));
           PVector end = new PVector(nodes.getFloat(endid - 1,"lat"), nodes.getFloat(endid - 1,"lon"));
            
           Road road7amnon = new Road(start, end, i, opening.getFloat(i, "7_no_carpool"), opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
           Road road7am = new Road(start, end, i, opening.getFloat(i, "7_with_carpool"), opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
           non7.Roads.add(road7amnon);
           car7.Roads.add(road7am);
           
           Road road9amnon = new Road(start, end, i, opening.getFloat(i, "9_no_carpool"), opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
           Road road9am = new Road(start, end, i, opening.getFloat(i, "9_with_carpool"), opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
           non9.Roads.add(road9amnon);
           car9.Roads.add(road9am);
           
           Road road11amnon = new Road(start, end, i, opening.getFloat(i, "11_no_carpool"), opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
           Road road11am = new Road(start, end, i, opening.getFloat(i, "11_with_carpool"), opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
           non11.Roads.add(road11amnon);
           car11.Roads.add(road11am);
           
           Road roaddistnon= new Road(start, end, i, opening.getFloat(i, "dno"), opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
           Road roaddist = new Road(start, end, i, opening.getFloat(i, "dcar"), opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
           distributedcar.Roads.add(roaddist);
           distributednon.Roads.add(roaddistnon);
  }
  
  for(int i = 0; i<closing.getRowCount(); i++){
    int startid = closing.getInt(i, "Start");
    int endid = closing.getInt(i, "End");
    PVector start = new PVector(nodes.getFloat(startid - 1,"lat"), nodes.getFloat(startid - 1,"lon"));
    PVector end = new PVector(nodes.getFloat(endid - 1,"lat"), nodes.getFloat(endid - 1,"lon"));
    
     Road road5pmnon = new Road(start, end, i, closing2.getFloat(i, "t1001"), opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
     Road road5pm = new Road(start, end, i, closing.getFloat(i, "t1001")/2, opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
     non5.Roads.add(road5pmnon);
     car5.Roads.add(road5pm);
     
     Road road9pmnon = new Road(start, end, i, closing2.getFloat(i, "t5001"), opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
     Road road9pm = new Road(start, end, i, closing.getFloat(i, "t5001")/2, opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
     non9pm.Roads.add(road9pmnon);
     car9pm.Roads.add(road9pm);
     
     Road road10pmnon = new Road(start, end, i, closing2.getFloat(i, "t6001"), opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
     Road road10pm = new Road(start, end, i, closing.getFloat(i, "t6001")/2, opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
     non10.Roads.add(road10pmnon);
     car10.Roads.add(road10pm);
     
     Road road11pmnon = new Road(start, end, i, closing2.getFloat(i, "t7001"), opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
     Road road11pm = new Road(start, end, i, closing.getFloat(i, "t7001")/2, opening.getInt(i, "capacity"), opening.getInt(i, "speed (meter/s)"));
     non11pm.Roads.add(road11pmnon);
     car11pm.Roads.add(road11pm);
  
  }
  
  
  non7.flows();
  car7.flows();
  non9.flows();
  car9.flows(); 
  non11.flows();
  car11.flows();
  distributedcar.flows();
  distributednon.flows();
  
  non5.flows();
  car5.flows();
  non9pm.flows();
  car9pm.flows();
  non10.flows();
  car10.flows();
  non11pm.flows();
  car11pm.flows();
}

ArrayList<POI>POINetwork = new ArrayList<POI>();
ArrayList<Edge>ODMatrixCar7am = new ArrayList<Edge>();
ArrayList<Edge>ODMatrixCar5pm = new ArrayList<Edge>();
ArrayList<Edge>ODMatrixCar10pm = new ArrayList<Edge>();
ArrayList<Edge>ODMatrixCar9am = new ArrayList<Edge>();
ArrayList<Edge>ODMatrixCar11am = new ArrayList<Edge>();
ArrayList<Edge>ODMatrixCar9pm = new ArrayList<Edge>();
ArrayList<Edge>ODMatrixCar11pm = new ArrayList<Edge>();

ArrayList<Edge>ODMatrixNon7am = new ArrayList<Edge>();
ArrayList<Edge>ODMatrixNon5pm = new ArrayList<Edge>();
ArrayList<Edge>ODMatrixNon10pm = new ArrayList<Edge>();
ArrayList<Edge>ODMatrixNon9am = new ArrayList<Edge>();
ArrayList<Edge>ODMatrixNon11am = new ArrayList<Edge>();
ArrayList<Edge>ODMatrixNon9pm = new ArrayList<Edge>();
ArrayList<Edge>ODMatrixNon11pm = new ArrayList<Edge>();

void generatePOIs(){
  
  for(int i = 0; i<POIs.getRowCount(); i++){
    //  POI(PVector _location, int _id, int _income, int _total, int _open, int _close){
    POI poi = new POI(new PVector(POIs.getFloat(i, "lat"), POIs.getFloat(i, "lon")), POIs.getInt(i, "id"), POIs.getInt(i, "income"), 100, 0, 0);
    POINetwork.add(poi);
    stuff.places.add(poi);
  }
}

void generateODs(Table OD, int hour, boolean carpooling, boolean am){
  for(int i = 0; i<OD.getRowCount(); i++){
     PVector org = new PVector(nodes.getFloat(0, "lat"), nodes.getFloat(0, "lon"));

    //Edge(PVector _origin, PVector _destination, float _increment, int _amount, int _income, color _incomecolor, int _oi, int _di){
    if(OD.getInt(i, "income") == 1){
      Edge edge;
      if(am){
        edge = new Edge(org, new PVector(OD.getFloat(i, "lat"), OD.getFloat(i, "lon")), increment, OD.getInt(i, "amount"), 
        1, income1color, 1, OD.getInt(i, "id"));
          }
      else{
            edge = new Edge(new PVector(OD.getFloat(i, "lat"), OD.getFloat(i, "lon")), org, increment, OD.getInt(i, "amount"), 
            1, income1color, 1, OD.getInt(i, "id"));
      }
          if(hour == 7){
            if(carpooling){
            ODMatrixCar7am.add(edge);
            }
            else{
              ODMatrixNon7am.add(edge);
            }
          }
          if(hour == 5){
            if(carpooling){
            ODMatrixCar5pm.add(edge);
            }
            else{
              ODMatrixNon5pm.add(edge);
            }
          }
          if(hour == 10){
            if(carpooling){
            ODMatrixCar10pm.add(edge);
            }
            else{
              ODMatrixNon10pm.add(edge);
            }
          }
          
          if(hour == 9){
            if(carpooling){
              if(am){
                ODMatrixCar9am.add(edge);
                  }
              else{
                ODMatrixCar9pm.add(edge);
              }
            }
            else{
                  if(am){
                ODMatrixNon9am.add(edge);
                  }
              else{
                ODMatrixNon9pm.add(edge);
              }
            }
          }
          
          if(hour == 11){
            if(carpooling){
              if(am){
                ODMatrixCar11am.add(edge);
                  }
              else{
                ODMatrixCar11pm.add(edge);
              }
            }
            else{
                  if(am){
                ODMatrixNon11am.add(edge);
                  }
              else{
                ODMatrixNon11pm.add(edge);
              }
            }
          }
          
    }
    if(OD.getInt(i, "income") == 2){
         Edge edge;
      if(am){
    edge = new Edge(org, new PVector(OD.getFloat(i, "lat"), OD.getFloat(i, "lon")), increment, OD.getInt(i, "amount"), 
    2, income2color, 1, OD.getInt(i, "id"));
      }
      else{
            edge = new Edge(new PVector(OD.getFloat(i, "lat"), OD.getFloat(i, "lon")), org, increment, OD.getInt(i, "amount"), 
            2, income2color, 1, OD.getInt(i, "id"));
      }
          
          if(hour == 7){
            if(carpooling){
            ODMatrixCar7am.add(edge);
            }
            else{
              ODMatrixNon7am.add(edge);
            }
          }
          if(hour == 5){
            if(carpooling){
            ODMatrixCar5pm.add(edge);
            }
            else{
              ODMatrixNon5pm.add(edge);
            }
          }
          if(hour == 10){
            if(carpooling){
            ODMatrixCar10pm.add(edge);
            }
            else{
              ODMatrixNon10pm.add(edge);
            }
          }
          
          if(hour == 9){
            if(carpooling){
              if(am){
                ODMatrixCar9am.add(edge);
                  }
              else{
                ODMatrixCar9pm.add(edge);
              }
            }
            else{
                  if(am){
                ODMatrixNon9am.add(edge);
                  }
              else{
                ODMatrixNon9pm.add(edge);
              }
            }
          }
          
          if(hour == 11){
            if(carpooling){
              if(am){
                ODMatrixCar11am.add(edge);
                  }
              else{
                ODMatrixCar11pm.add(edge);
              }
            }
            else{
                  if(am){
                ODMatrixNon11am.add(edge);
                  }
              else{
                ODMatrixNon11pm.add(edge);
              }
            }
          }
          
    }
    if(OD.getInt(i, "income") == 3){
            Edge edge;
      if(am){
    edge = new Edge(org, new PVector(OD.getFloat(i, "lat"), OD.getFloat(i, "lon")), increment, OD.getInt(i, "amount"), 
    3, income3color, 1, OD.getInt(i, "id"));
      }
      else{
            edge = new Edge(new PVector(OD.getFloat(i, "lat"), OD.getFloat(i, "lon")), org, increment, OD.getInt(i, "amount"), 
            3, income3color, 1, OD.getInt(i, "id"));
      }
          
          if(hour == 7){
            if(carpooling){
            ODMatrixCar7am.add(edge);
            }
            else{
              ODMatrixNon7am.add(edge);
            }
          }
          if(hour == 5){
            if(carpooling){
            ODMatrixCar5pm.add(edge);
            }
            else{
              ODMatrixNon5pm.add(edge);
            }
          }
          if(hour == 10){
            if(carpooling){
            ODMatrixCar10pm.add(edge);
            }
            else{
              ODMatrixNon10pm.add(edge);
            }
          }
          
          if(hour == 9){
            if(carpooling){
              if(am){
                ODMatrixCar9am.add(edge);
                  }
              else{
                ODMatrixCar9pm.add(edge);
              }
            }
            else{
                  if(am){
                ODMatrixNon9am.add(edge);
                  }
              else{
                ODMatrixNon9pm.add(edge);
              }
            }
          }
          
          if(hour == 11){
            if(carpooling){
              if(am){
                ODMatrixCar11am.add(edge);
                  }
              else{
                ODMatrixCar11pm.add(edge);
              }
            }
            else{
                  if(am){
                ODMatrixNon11am.add(edge);
                  }
              else{
                ODMatrixNon11pm.add(edge);
              }
            }
          }
          
    }   
}

}
