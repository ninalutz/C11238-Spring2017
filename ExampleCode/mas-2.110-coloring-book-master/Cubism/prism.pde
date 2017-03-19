class Prism{
// draws panels of the prism constructing parallelograms   
  void panel() { 
    stroke(50,50,50,100);
    fill( #ff0000,seethrough);
    quad(x[ 1] + 550,y[ 1] + 250,x[ 4] + 550,y[ 4] + 250,x[ 8] + 550,y[ 8] + 250,x[ 5] + 550,y[ 5] + 250);                      
    fill(250,seethrough);
    quad(x[ 3] + 550,y[ 3] + 250,x[ 7] + 550,y[ 7] + 250,x[ 8] + 550,y[ 8] + 250,x[ 4] + 550,y[ 4] + 250); 
    fill(#ff3300,seethrough);
    quad(x[ 1] + 550,y[ 1] + 250,x[ 2] + 550,y[ 2] + 250,x[ 3] + 550,y[ 3] + 250,x[ 4] + 550,y[ 4] + 250); 
    fill(0,seethrough);
    quad(x[ 5] + 550,y[ 5] + 250,x[ 6] + 550,y[ 6] + 250,x[ 7] + 550,y[ 7] + 250,x[ 8] + 550,y[ 8] + 250); 
    fill(250,seethrough);
    quad(x[ 2] + 550,y[ 2] + 250,x[ 3] + 550,y[ 3] + 250,x[ 7] + 550,y[ 7] + 250,x[ 6] + 550,y[ 6] + 250); 
    fill(0,seethrough);
    quad(x[ 1] + 550,y[ 1] + 250,x[ 2] + 550,y[ 2] + 250,x[ 6] + 550,y[ 6] + 250 ,x[ 5] + 550,y[ 5] + 250); 
  } 
}

// Prism object
Prism myPrism;                                        
 
// global speed of xy 
float s = 0.5;                                      
 
// speed of each x and y (0 unused) 
float[] xspeed = {
  0,s*1,s*2,s*3,s*4,s*5,s*6,s*7,s*8  };             
float[] yspeed = {
  0,s*8,s*7,s*6,s*5,s*4,s*3,s*2,s*1  };
 
// position of each x and y 
float[] x = {0,150,50,50,150,350,250,250,350}; 
float[] y = {0,150,50,50,150,350,250,250,350}; 

//direction of xs and ys 
int[] xdirection = {
  0,2,2,2,2,2,2,2,2};                               
int[] ydirection = {
  0,2,2,2,2,2,2,2,2};
 
//size and opacity  
int size = 350;
int seethrough = 150;                             
 
