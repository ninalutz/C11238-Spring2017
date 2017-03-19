class Prism2{
// draws panels of the prism constructing parallelograms   
  void panel2() { 
    stroke(50,50,50,100);
    fill( #ff0000,seethrough);
    quad(x2[ 1] + 400 ,y2[ 1] + 300,x2[ 4] + 400,y2[ 4] + 300,x2[ 8]+400,y2[ 8] + 300,x2[ 5] +400 ,y2[ 5] + 300);                      
    fill(250,seethrough);
    quad(x2[ 3] + 400, y2[ 3] + 300, x2[ 7] + 400, y2[ 7]+ 300, x2[ 8]+400, y2[ 8]+ 300, x2[ 4] + 400, y2[ 4]+ 300); 
    fill(#ff3400,seethrough);
    quad(x2[ 1] + 400,y2[ 1]+ 300,x2[ 2] + 400, y2[ 2]+ 300, x2[ 3] + 400, y2[ 3]+ 300, x2[ 4] + 400, y2[ 4]+ 300); 
    fill(0,seethrough);
    quad(x2[ 5] + 400, y2[ 5]+ 300, x2[ 6] + 400, y2[ 6]+ 300, x2[ 7]+400, y2[ 7]+ 300, x2[ 8] + 400, y2[ 8]+ 300); 
    fill(250,seethrough);
    quad(x2[ 2] + 400, y2[ 2]+ 300, x2[ 3] + 400, y2[ 3]+ 300, x2[ 7] + 400, y2[ 7]+ 300, x2[ 6] + 400, y2[ 6]+ 300); 
    fill(0,seethrough);
    quad(x2[ 1] + 400, y2[ 1]+ 300,x2[ 2] + 400,y2[ 2]+ 300,x2[ 6]+400 ,y2[ 6] + 300,x2[ 5] + 350,y2[ 5]+ 300); 
  } 
}

// Prism object
Prism2 myPrism2;                                        
 
// global speed of xy 
float s2 = 0.1;                                      
 
// speed of each x and y (0 unused) 
float[] x2speed = {
  0,s2*1,s2*2,s2*3,s2*4,s2*5,s2*6,s2*7,s2*8  };             
float[] y2speed = {
  0,s2*8,s2*7,s2*6,s2*5,s2*4,s2*3,s2*2,s2*1  };
 
// position of each x and y 
float[] x2 = {0,150,50,50,150,350,250,250,350}; 
float[] y2 = {0,150,50,50,150,350,250,250,350}; 

//direction of xs and ys 
int[] x2direction = {
  0,2,2,2,2,2,2,2,2};                               
int[] y2direction = {
  0,2,2,2,2,2,2,2,2};
                          
 
