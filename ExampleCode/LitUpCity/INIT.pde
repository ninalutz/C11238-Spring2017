boolean corners;
boolean lit;
ArrayList city = new ArrayList();
ArrayList lights = new ArrayList();
float num = 0;

float lightx1, lightx2, lightx3, lightz1, lightz2, lightz3;

void initCity(){
  lightx1 = random(-175, 175);
  lightx2 = random(-175, 175);
  lightx3 = random(-175, 175);
  
  lightz1 = random(-175, 175);
  lightz2 = random(-175, 175);
  lightz3 = random(-175, 175);
  //initializes buildings on all parts of the 10x10 grid 
  for (int x = -5; x <= 5; x++) {
    for (int z = -5; z <= 5; z++) {
      float r = random(0, 1);
      if (r > 0.5) {
        float d = abs(10-dist(x, 0, z, 0, 0, 0));
        city.add(new Building(new PVector(random(-175, 175), 0, random(-175, 175)), random(d-d/2, d+(d*d)/5), random(10, 30), random(10, 30)));
        //city.add(new Building(new PVector(x*35, 0, z*35), random(d-d/2, d+(d*d)/5), random(10, 30), random(10, 30)));
      }

      //grid cells
      city.add(new Building(new PVector(x*35, 0, z*35), 0, 35, 35));
                 
    }
  }
  

  
 //some coordinate workings
 if(corners){
   city.add(new Building(new PVector(0, 0, 0), 10, 35, 35)); //center
   city.add(new Building(new PVector(35*5, 0, 35*5), 10, 35, 35)); //right front at start 
   city.add(new Building(new PVector(35*-5, 0, 35*-5), 10, 35, 35)); //left back at start
   city.add(new Building(new PVector(35*5, 0, 35*-5), 10, 35, 35)); //right back at start   
   city.add(new Building(new PVector(35*-5, 0, 35*5), 10, 35, 35)); //left front at start
 }
 
}
