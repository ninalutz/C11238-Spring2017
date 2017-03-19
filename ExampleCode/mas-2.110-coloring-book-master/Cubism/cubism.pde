PImage cubist, outline;
PFont Helvetica; 

void setup()
{
  size (1400,850);
  frameRate (50);
  Helvetica = createFont("Helvetica", 16, true);
  smooth ();
  stroke (50);
  cubist = loadImage("cubist cow.png");  
  outline = loadImage("outline.png");
  myPrism = new Prism();
  myPrism2 = new Prism2();
  myPrism3 = new Prism3();
}

void draw(){
  background(255);
  image(cubist, 450, 250);  
    
//global speed is dependent on y coordinate of cursor 
  if (mouseY <= 20) {                                   
    s = 0.4;
    s2 = 0.2;
    s3 = .5;
  }
  else {
    s = mouseY*0.002; 
    s2 = mouseY*0.002;    
    s3 = mouseY*.002;
  }
// speed of each x and y (0 unused) 
  float[] xspeed = {
    0,s*1,s*2,s*3,s*4,s*5,s*6,s*7,s*8        };          
  float[] yspeed = {
    0,s*8,s*7,s*6,s*5,s*4,s*3,s*2,s*1        };
    
  float[] x2speed = {
  0,s2*1,s2*2,s2*3,s2*4,s2*5,s2*6,s2*7,s2*8  };             
  float[] y2speed = {
  0,s2*8,s2*7,s2*6,s2*5,s2*4,s2*3,s2*2,s2*1  };
  
  float[] x3speed = {
  0,s3*1,s3*2,s3*3,s3*4,s3*5,s3*6,s3*7,s3*8  };             
  float[] y3speed = {
  0,s3*8,s3*7,s3*6,s3*5,s3*4,s3*3,s3*2,s3*1  };


//motion
  for (int i = 1; i < 9; i++)                
  {
    x[i] = x[i] + (xspeed[i] * xdirection[ i]); 
    y[i] = y[i] + (yspeed[i] * ydirection[ i]); 
    
    x2[i] = x2[i] + (x2speed[i] * x2direction[ i]); 
    y2[i] = y2[i] + (y2speed[i] * y2direction[ i]); 
    
    x3[i] = x3[i] + (x3speed[i] * x3direction[ i]); 
    y3[i] = y3[i] + (y3speed[i] * y3direction[ i]); 
    
    if (x[i] > size || x[i] < 0) {               
      xdirection[ i] *= -1;
    }
    
    if (x2[i] > size || x2[i] < 0) {               
      x2direction[ i] *= -1;
    }
    
     if (x3[i] > size || x3[i] < 0) {               
      x3direction[ i] *= -1;
    }
    
    if (y[ i] > size || y[ i] < 0) {              
      ydirection[ i] *= -1;
    }
    
    if (y2[ i] > size || y2[ i] < 0) {              
      y2direction[ i] *= -1;
    }
    
    if (y3[ i] > size || y3[ i] < 0) {              
      y3direction[ i] *= -1;
    }
  }
//draws cubism if needed
    if (key == 'c') {
       background(255);
       myPrism2.panel2();;
       myPrism3.panel3();;
       myPrism.panel();;
       image(outline, 300, 20);
    } 
textFont(Helvetica);       
  fill(0);
  textAlign(CENTER);
  text("Press c to animate the cubism and move the mouse around to explore different speeds. Space to reset.", width/2, 100);

}
