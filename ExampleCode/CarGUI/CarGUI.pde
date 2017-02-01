PGraphics Test, Cars, PLACES;
Table opening, nodes, POIs, closing, closing2,am9carpool ;
boolean thing, otherthing, needLoop;
int time;
boolean cars;
int tint = 1;

int hour;

String tablename;


MercatorMap mercatorMap;


void setup(){
  size(1450, 950, P3D);
  cp5 = new ControlP5(this);
  initButtons();
  initSliders();
  opening = loadTable("data/Opening.csv", "header");
  closing = loadTable("data/Closing.csv", "header");
  closing2 = loadTable("data/Closing2.csv", "header");
  nodes = loadTable("data/Simnodes_working_final.csv", "header");
  POIs = loadTable("data/POIs.csv", "header");

  //map = new UnfoldingMap(this, new OpenStreetMap.OpenStreetMapProvider());
  map = new UnfoldingMap(this, new StamenMapProvider.TonerBackground());
 //map = new UnfoldingMap(this, new StamenMapProvider.WaterColor());
  //map = new UnfoldingMap(this, new Microsoft.RoadProvider());
// map = new UnfoldingMap(this, new Microsoft.HybridProvider());
    Location Boston = new Location(42.365986,-71.07584);

  map.zoomAndPanTo(Boston, 16);
  
  Test = createGraphics(width, height);

  Cars = createGraphics(width, height);
    
  PLACES = createGraphics(width, height);
  MapUtils.createDefaultEventDispatcher(this, map);
  AM.on = true;
  
  generateOpeningRoads();
  generatePOIs();
  generateClosingRoads();
  
  //void generateODs(Table OD, int hour, boolean carpooling, boolean am){
    
  am9carpool = loadTable("data/O9carpool.csv","header");
  Table am9non = loadTable("data/O9noncarpool.csv","header");
  Table am7carpool = loadTable("data/O7carpool.csv","header");
  Table am7non = loadTable("data/O7noncarpool.csv","header");
  Table am11carpool = loadTable("data/O11carpool.csv","header");
  Table am11non = loadTable("data/O11noncarpool.csv","header");
  
  Table pm5carpool = loadTable("data/C5carpool.csv","header");
  Table pm5non = loadTable("data/C5noncarpool.csv","header");
  Table pm9carpool = loadTable("data/C9carpool.csv","header");
  Table pm9non = loadTable("data/C9noncarpool.csv","header");
  Table pm11carpool = loadTable("data/C11carpool.csv","header");
  Table pm11non = loadTable("data/C11noncarpool.csv","header");
  Table pm10carpool = loadTable("data/C10carpool.csv","header");
  Table pm10non = loadTable("data/C10noncarpool.csv","header");
  
  generateODs(am9carpool, 9, true, true);
  generateODs(am7carpool, 7, true, true);
  generateODs(am11carpool, 11, true, true);
  generateODs(pm5carpool, 5, true, false);
  generateODs(pm9carpool, 9, true, false);
  generateODs(pm10carpool, 10, true, false);
  generateODs(pm11carpool, 11, true, false);
  
  generateODs(am9non, 9, false, true);
  generateODs(am7non, 7, false, true);
  generateODs(am11non, 11, false, true);
  generateODs(pm5non, 5, false, false);
  generateODs(pm9non, 9, false, false);
  generateODs(pm10non, 10, false, false);
  generateODs(pm11non, 11, false, false);
  
 initialTime = millis();
 
 Congestion.on = true;
  

}


void draw(){
  
  hour = int(cp5.getController("t").getValue());

  //println(hour, AM.on);
  
  am = AM.on;
  pm = PM.on;
 
//  println(edges);

  mercatorMap = new MercatorMap(width, height, CanvasBox().get(0).x, CanvasBox().get(1).x, CanvasBox().get(0).y, CanvasBox().get(1).y, 0);
    //non7.drawRoads(Test);
//  println(AM.on);
  PM.on = !AM.on;
  AM.on = !PM.on;

background(background);

map.draw();

  //resets initial time apporpriately after one iteration and delay
  if(needLoop){
    initialTime += duration;
    initialTime += delay;
    needLoop = !needLoop;
  }
  

String timing = "PM";
if(AM.on == true){
  timing = "AM";
}


if(Congestion.on){ 
            if(AM.on){
              if(hour == 9){
                  if(CarPoolButton.on){
                      Test.clear();
                      car9.drawRoads(Test);
                  }
                  else{
                      Test.clear();
                      non9.drawRoads(Test);
                  }
                  Test.clear();
              }
              
              if(hour == 7){
                  if(CarPoolButton.on){
                    Test.clear();
                      car7.drawRoads(Test);
                  }
                  else{
                    Test.clear();
                      non7.drawRoads(Test);
                  }
                  Test.clear();
              }
              
            if(hour == 11){
                  if(CarPoolButton.on){
                    Test.clear();
                      car11.drawRoads(Test);
                  }
                  else{
                    Test.clear();
                      non11.drawRoads(Test);
                  }
                  Test.clear();
              }  
            if(Distributed.on){
                 if(CarPoolButton.on){
                   Test.clear();
                      distributedcar.drawRoads(Test);
                  }
                  else{
                    Test.clear();
                      distributednon.drawRoads(Test);
                  }
                  Test.clear();
            }
            }
        if(PM.on){
              if(hour == 9){
                  if(CarPoolButton.on){
                      Test.clear();
                      car9pm.drawRoads(Test);
                  }
                  else{
                      Test.clear();
                      non9pm.drawRoads(Test);
                  }
                  Test.clear();
              }
              
              if(hour == 5){
                  if(CarPoolButton.on){
                    Test.clear();
                      car5.drawRoads(Test);
                  }
                  else{
                    Test.clear();
                      non5.drawRoads(Test);
                  }
                  Test.clear();
              }
              
            if(hour == 11){
                  if(CarPoolButton.on){
                    Test.clear();
                      car11pm.drawRoads(Test);
                  }
                  else{
                    Test.clear();
                      non11pm.drawRoads(Test);
                  }
                  Test.clear();
              }  
            if(hour == 10){
                  if(CarPoolButton.on){
                    Test.clear();
                      car10.drawRoads(Test);
                  }
                  else{
                    Test.clear();
                      non10.drawRoads(Test);
                  }
                  Test.clear();
              }  
            } 
  
  image(Test, 0, 0);
}


    stuff.drawNodes(PLACES);
image(PLACES, 0, 0);

if(ODButton.on){
  if(AutoPlay.on == false){
     if(AM.on){
         if(hour == 7){
             if(carpool){
                for(int i = 0; i<ODMatrixCar7am.size(); i++){
                   ODMatrixCar7am.get(i).drawEdge();
                  }
             }
             else{
                 for(int i = 0; i<ODMatrixCar7am.size(); i++){
                   ODMatrixCar7am.get(i).drawEdge();
                  }
             }
         }
         if(hour == 9){
             if(carpool){
               for(int i = 0; i<ODMatrixCar9am.size(); i++){
                   ODMatrixCar9am.get(i).drawEdge();
                  }
             }
             else{
               for(int i = 0; i<ODMatrixNon9am.size(); i++){
                   ODMatrixNon9am.get(i).drawEdge();
                  }
             }
         }
         if(hour == 11){
             if(carpool){
                for(int i = 0; i<ODMatrixCar11am.size(); i++){
                   ODMatrixCar11am.get(i).drawEdge();
                  }
             }
             else{
                for(int i = 0; i<ODMatrixNon11am.size(); i++){
                   ODMatrixNon11am.get(i).drawEdge();
                  }
             }
         }
     }
   
     else{
         if(hour == 5){
             if(carpool){
              for(int i = 0; i<ODMatrixNon5pm.size(); i++){
                   ODMatrixNon5pm.get(i).drawEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon5pm.size(); i++){
                   ODMatrixNon5pm.get(i).drawEdge();
                  } 
             }
         }
         if(hour == 9){
             if(carpool){
              for(int i = 0; i<ODMatrixCar9pm.size(); i++){
                   ODMatrixCar9pm.get(i).drawEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon9pm.size(); i++){
                   ODMatrixNon9pm.get(i).drawEdge();
                  }
             }
         }
         if(hour == 10){
             if(carpool){
              for(int i = 0; i<ODMatrixCar10pm.size(); i++){
                   ODMatrixCar10pm.get(i).drawEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon10pm.size(); i++){
                   ODMatrixNon10pm.get(i).drawEdge();
                  }
             }
         }
         if(hour == 11){
             if(carpool){
              for(int i = 0; i<ODMatrixCar11pm.size(); i++){
                   ODMatrixCar11pm.get(i).drawEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon11pm.size(); i++){
                   ODMatrixNon11pm.get(i).drawEdge();
                  }
             }
         }
     }  

          rect(0, 0, width, 90);
  }
  
  if(AutoPlay.on == true){
         if(AM.on){
         if(hour == 7){
             if(carpool){
                for(int i = 0; i<ODMatrixCar7am.size(); i++){
                   ODMatrixCar7am.get(i).pauseEdge();
                  }
             }
             else{
                 for(int i = 0; i<ODMatrixCar7am.size(); i++){
                   ODMatrixCar7am.get(i).pauseEdge();
                  }
             }
         }
         if(hour == 9){
             if(carpool){
               for(int i = 0; i<ODMatrixCar9am.size(); i++){
                   ODMatrixCar9am.get(i).pauseEdge();
                  }
             }
             else{
               for(int i = 0; i<ODMatrixNon9am.size(); i++){
                   ODMatrixNon9am.get(i).pauseEdge();
                  }
             }
         }
         if(hour == 11){
             if(carpool){
                for(int i = 0; i<ODMatrixCar11am.size(); i++){
                   ODMatrixCar11am.get(i).pauseEdge();
                  }
             }
             else{
                for(int i = 0; i<ODMatrixNon11am.size(); i++){
                   ODMatrixNon11am.get(i).pauseEdge();
                  }
             }
         }
     }
   
     else{
         if(hour == 5){
             if(carpool){
              for(int i = 0; i<ODMatrixNon5pm.size(); i++){
                   ODMatrixNon5pm.get(i).pauseEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon5pm.size(); i++){
                   ODMatrixNon5pm.get(i).pauseEdge();
                  } 
             }
         }
         if(hour == 9){
             if(carpool){
              for(int i = 0; i<ODMatrixCar9pm.size(); i++){
                   ODMatrixCar9pm.get(i).pauseEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon9pm.size(); i++){
                   ODMatrixNon9pm.get(i).pauseEdge();
                  }
             }
         }
         if(hour == 10){
             if(carpool){
              for(int i = 0; i<ODMatrixCar10pm.size(); i++){
                   ODMatrixCar10pm.get(i).pauseEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon10pm.size(); i++){
                   ODMatrixNon10pm.get(i).pauseEdge();
                  }
             }
         }
         if(hour == 11){
             if(carpool){
              for(int i = 0; i<ODMatrixCar11pm.size(); i++){
                   ODMatrixCar11pm.get(i).pauseEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon11pm.size(); i++){
                   ODMatrixNon11pm.get(i).pauseEdge();
                  }
             }
         }
     }  
  rect(0, 0, width, 90);
  }
}


if(Dynamic.on){
  println("Tint", tint);
  
  //if(millis() % 2 == 0){
    if(tint<9001){
    tint+=20;
    }
    else{
    tint = 1;
    }
    generateClosingRoads();
   Test.clear();
  //}
  
  
  Test.clear();
  if(CarPoolButton.on == false){
  dynamicthing.drawRoads(Test);
  }
  if(CarPoolButton.on){
  dynamicthingcar.drawRoads(Test);
  }
  
  image(Test, 0, 0);
  
}


if(showFrameRate){
  println(frameRate);
}


fill(background);
stroke(background);
//rect(0, 0, 100, height);
rect(0, 0, width, 90);


fill(income1color);
text("Income 1", offset + 65, 30);
fill(income2color);
text("Income 2", offset + 180-25, 30);
fill(income3color);
text("Income 3", offset + 265-20, 30);


fill(accentwhite);
text("t = " + int(cp5.getController("t").getValue()), 260 + offset, 67);


if(Dynamic.on == false){
textSize(40);
text(int(cp5.getController("t").getValue()) + timing, 1200, 60);
}
if(Dynamic.on){
  textSize(40);
  float seconds = tint;
  
  if(seconds < 1001){
      text(4 + "PM", 1200, 60);
  }
  
 if(seconds >= 1001 && seconds < 2001){
      text(5 +"PM", 1200, 60);
  }
  
   if(seconds >= 2001 && seconds < 3001){
      text(6 +"PM", 1200, 60);
  }

   if(seconds >= 3001 && seconds < 4001){
      text(7 +"PM", 1200, 60);
  }
  
  if(seconds >= 4001 && seconds < 5001){
      text(8 +"PM", 1200, 60);
  }
  
  if(seconds >= 5001 && seconds < 6001){
      text(9 +"PM", 1200, 60);
  }
  
  if(seconds >= 6001 && seconds < 7001){
      text(10 +"PM", 1200, 60);
  }
  
  if(seconds >= 7001 && seconds < 8001){
      text(11 +"PM", 1200, 60);
  }
  
  if(seconds >= 8001 && seconds < 9001){
      text(12 +"AM", 1200, 60);
  }
  
   if(seconds >= 9001 && seconds < 10001){
      text(1 +"AM", 1200, 60);
  }
  
}


if(AutoPlay.on == false){
  xDir = 0.5;
}

if(AutoPlay.on == true){
  xDir = 0;
}

time = int(cp5.getController("t").getValue());

if(CarButton.on){ 
            if(AM.on){
              if(hour == 9){
                  if(CarPoolButton.on){
                      Cars.clear();
                      car9.drawCars(Cars);
                  }
                  else{
                      Cars.clear();
                      non9.drawCars(Cars);
                  }
                  Cars.clear();
              }
              
              if(hour == 7){
                  if(CarPoolButton.on){
                    Cars.clear();
                      car7.drawCars(Cars);
                  }
                  else{
                    Cars.clear();
                      non7.drawCars(Cars);
                  }
                  Cars.clear();
              }
              
            if(hour == 11){
                  if(CarPoolButton.on){
                    Cars.clear();
                      car11.drawCars(Cars);
                  }
                  else{
                    Cars.clear();
                      non11.drawCars(Cars);
                  }
                  Cars.clear();
              }  
            if(Distributed.on){
                 if(CarPoolButton.on){
                   Cars.clear();
                      distributedcar.drawCars(Cars);
                  }
                  else{
                    Cars.clear();
                      distributednon.drawCars(Cars);
                  }
                  Cars.clear();
            }
            }
        if(PM.on){
              if(hour == 9){
                  if(CarPoolButton.on){
                      Cars.clear();
                      car9pm.drawCars(Cars);
                  }
                  else{
                      Cars.clear();
                      non9pm.drawCars(Cars);
                  }
                  Cars.clear();
              }
              
              if(hour == 5){
                  if(CarPoolButton.on){
                    Cars.clear();
                      car5.drawCars(Cars);
                  }
                  else{
                    Cars.clear();
                      non5.drawCars(Cars);
                  }
                  Cars.clear();
              }
              
            if(hour == 11){
                  if(CarPoolButton.on){
                    Cars.clear();
                      car11pm.drawCars(Cars);
                  }
                  else{
                    Cars.clear();
                      non11pm.drawCars(Cars);
                  }
                  Cars.clear();
              }  
            if(hour == 10){
                  if(CarPoolButton.on){
                    Cars.clear();
                      car10.drawCars(Cars);
                  }
                  else{
                    Cars.clear();
                      non10.drawCars(Cars);
                  }
                  Cars.clear();
              }  
            }
      image(Cars, 0, 0);      
} 


smooth();
//  println(Congestion.on);
//println(frameRate);


}

void mouseDragged(){
    PLACES.clear();
    stuff.drawNodes(PLACES);
    
    if(Congestion.on){
            if(AM.on){
              if(hour == 9){
                  if(CarPoolButton.on){
                      Test.clear();
                      car9.drawRoads(Test);
                  }
                  else{
                      Test.clear();
                      non9.drawRoads(Test);
                  }
                  Test.clear();
              }
              
              if(hour == 7){
                  if(CarPoolButton.on){
                    Test.clear();
                      car7.drawRoads(Test);
                  }
                  else{
                    Test.clear();
                      non7.drawRoads(Test);
                  }
                  Test.clear();
              }
              
            if(hour == 11){
                  if(CarPoolButton.on){
                    Test.clear();
                      car11.drawRoads(Test);
                  }
                  else{
                    Test.clear();
                      non11.drawRoads(Test);
                  }
                  Test.clear();
              }  
            if(Distributed.on){
                 if(CarPoolButton.on){
                   Test.clear();
                      distributedcar.drawRoads(Test);
                  }
                  else{
                    Test.clear();
                      distributednon.drawRoads(Test);
                  }
                  Test.clear();
            }
            }
        if(PM.on){
              if(hour == 9){
                  if(CarPoolButton.on){
                      Test.clear();
                      car9pm.drawRoads(Test);
                  }
                  else{
                      Test.clear();
                      non9pm.drawRoads(Test);
                  }
                  Test.clear();
              }
              
              if(hour == 5){
                  if(CarPoolButton.on){
                    Test.clear();
                      car5.drawRoads(Test);
                  }
                  else{
                    Test.clear();
                      non5.drawRoads(Test);
                  }
                  Test.clear();
              }
              
            if(hour == 11){
                  if(CarPoolButton.on){
                    Test.clear();
                      car11pm.drawRoads(Test);
                  }
                  else{
                    Test.clear();
                      non11pm.drawRoads(Test);
                  }
                  Test.clear();
              }  
            if(hour == 10){
                  if(CarPoolButton.on){
                    Test.clear();
                      car10.drawRoads(Test);
                  }
                  else{
                    Test.clear();
                      non10.drawRoads(Test);
                  }
                  Test.clear();
              }  
            }    
         
    }
  
  if(CarButton.on == true){
      Cars.clear();
      non9.drawCars(Cars);
  }
  
  if(ODButton.on){
  if(AutoPlay.on == false){
     if(AM.on){
         if(hour == 7){
             if(carpool){
                for(int i = 0; i<ODMatrixCar7am.size(); i++){
                   ODMatrixCar7am.get(i).drawEdge();
                  }
             }
             else{
                 for(int i = 0; i<ODMatrixCar7am.size(); i++){
                   ODMatrixCar7am.get(i).drawEdge();
                  }
             }
         }
         if(hour == 9){
             if(carpool){
               for(int i = 0; i<ODMatrixCar9am.size(); i++){
                   ODMatrixCar9am.get(i).drawEdge();
                  }
             }
             else{
               for(int i = 0; i<ODMatrixNon9am.size(); i++){
                   ODMatrixNon9am.get(i).drawEdge();
                  }
             }
         }
         if(hour == 11){
             if(carpool){
                for(int i = 0; i<ODMatrixCar11am.size(); i++){
                   ODMatrixCar11am.get(i).drawEdge();
                  }
             }
             else{
                for(int i = 0; i<ODMatrixNon11am.size(); i++){
                   ODMatrixNon11am.get(i).drawEdge();
                  }
             }
         }
     }
   
     else{
         if(hour == 5){
             if(carpool){
              for(int i = 0; i<ODMatrixNon5pm.size(); i++){
                   ODMatrixNon5pm.get(i).drawEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon5pm.size(); i++){
                   ODMatrixNon5pm.get(i).drawEdge();
                  } 
             }
         }
         if(hour == 9){
             if(carpool){
              for(int i = 0; i<ODMatrixCar9pm.size(); i++){
                   ODMatrixCar9pm.get(i).drawEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon9pm.size(); i++){
                   ODMatrixNon9pm.get(i).drawEdge();
                  }
             }
         }
         if(hour == 10){
             if(carpool){
              for(int i = 0; i<ODMatrixCar10pm.size(); i++){
                   ODMatrixCar10pm.get(i).drawEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon10pm.size(); i++){
                   ODMatrixNon10pm.get(i).drawEdge();
                  }
             }
         }
         if(hour == 11){
             if(carpool){
              for(int i = 0; i<ODMatrixCar11pm.size(); i++){
                   ODMatrixCar11pm.get(i).drawEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon11pm.size(); i++){
                   ODMatrixNon11pm.get(i).drawEdge();
                  }
             }
         }
     }  

          rect(0, 0, width, 90);
  }
  
  if(AutoPlay.on == true){
         if(AM.on){
         if(hour == 7){
             if(carpool){
                for(int i = 0; i<ODMatrixCar7am.size(); i++){
                   ODMatrixCar7am.get(i).pauseEdge();
                  }
             }
             else{
                 for(int i = 0; i<ODMatrixCar7am.size(); i++){
                   ODMatrixCar7am.get(i).pauseEdge();
                  }
             }
         }
         if(hour == 9){
             if(carpool){
               for(int i = 0; i<ODMatrixCar9am.size(); i++){
                   ODMatrixCar9am.get(i).pauseEdge();
                  }
             }
             else{
               for(int i = 0; i<ODMatrixNon9am.size(); i++){
                   ODMatrixNon9am.get(i).pauseEdge();
                  }
             }
         }
         if(hour == 11){
             if(carpool){
                for(int i = 0; i<ODMatrixCar11am.size(); i++){
                   ODMatrixCar11am.get(i).pauseEdge();
                  }
             }
             else{
                for(int i = 0; i<ODMatrixNon11am.size(); i++){
                   ODMatrixNon11am.get(i).pauseEdge();
                  }
             }
         }
     }
   
     else{
         if(hour == 5){
             if(carpool){
              for(int i = 0; i<ODMatrixNon5pm.size(); i++){
                   ODMatrixNon5pm.get(i).pauseEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon5pm.size(); i++){
                   ODMatrixNon5pm.get(i).pauseEdge();
                  } 
             }
         }
         if(hour == 9){
             if(carpool){
              for(int i = 0; i<ODMatrixCar9pm.size(); i++){
                   ODMatrixCar9pm.get(i).pauseEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon9pm.size(); i++){
                   ODMatrixNon9pm.get(i).pauseEdge();
                  }
             }
         }
         if(hour == 10){
             if(carpool){
              for(int i = 0; i<ODMatrixCar10pm.size(); i++){
                   ODMatrixCar10pm.get(i).pauseEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon10pm.size(); i++){
                   ODMatrixNon10pm.get(i).pauseEdge();
                  }
             }
         }
         if(hour == 11){
             if(carpool){
              for(int i = 0; i<ODMatrixCar11pm.size(); i++){
                   ODMatrixCar11pm.get(i).pauseEdge();
                  }
             }
             else{
              for(int i = 0; i<ODMatrixNon11pm.size(); i++){
                   ODMatrixNon11pm.get(i).pauseEdge();
                  }
             }
         }
     }  
  rect(0, 0, width, 90);
  }
}

  
}
