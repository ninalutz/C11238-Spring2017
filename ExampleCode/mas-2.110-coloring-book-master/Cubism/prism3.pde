class Prism3{
// draws panels of the prism constructing parallelograms   
  void panel3() { 
    stroke(50,50,50,100);
    fill( #ff0000,seethrough);
    quad(x3[ 1] + 700 ,y3[ 1] + 200,x3[ 4] + 700,y3[ 4] + 200,x3[ 8]+700,y3[ 8] + 200,x3[ 5] +700 ,y3[ 5] + 200);                      
    fill(250,seethrough);
    quad(x3[ 3] + 700, y3[ 3] + 200, x3[ 7] + 700, y3[ 7]+ 200, x3[ 8]+700, y3[ 8]+ 200, x3[ 4] + 700, y3[ 4]+ 200); 
    fill(#ff3700,seethrough);
    quad(x3[ 1] + 700,y3[ 1]+ 200,x3[ 2] + 700, y3[ 2]+ 200, x3[ 3] + 700, y3[ 3]+ 200, x3[ 4] + 700, y3[ 4]+ 200); 
    fill(0,seethrough);
    quad(x3[ 5] + 700, y3[ 5]+ 200, x3[ 6] + 700, y3[ 6]+ 200, x3[ 7]+700, y3[ 7]+ 200, x3[ 8] + 700, y3[ 8]+ 200); 
    fill(250,seethrough);
    quad(x3[ 2] + 700, y3[ 2]+ 200, x3[ 3] + 700, y3[ 3]+ 200, x3[ 7] + 700, y3[ 7]+ 200, x3[ 6] + 700, y3[ 6]+ 200); 
    fill(0,seethrough);
    quad(x3[ 1] + 700, y3[ 1]+ 200,x3[ 2] + 700,y3[ 2]+ 200,x3[ 6]+700 ,y3[ 6] + 200,x3[ 5] + 350,y3[ 5]+ 200); 
  } 
}

// Prism object
Prism3 myPrism3;                                        
 
// global speed of xy 
float s3 = 0.1;                                      
 
// speed of each x and y (0 unused) 
float[] x3speed = {
  0,s3*1,s3*2,s3*3,s3*4,s3*5,s3*6,s3*7,s3*8  };             
float[] y3speed = {
  0,s3*8,s3*7,s3*6,s3*5,s3*4,s3*3,s3*2,s3*1  };
 
// position of each x and y 
float[] x3 = {0,150,50,50,150,350,250,250,350}; 
float[] y3 = {0,150,50,50,150,350,250,250,350}; 

//direction of xs and ys 
int[] x3direction = {
  0,2,2,2,2,2,2,2,2};                               
int[] y3direction = {
  0,2,2,2,2,2,2,2,2};
                          
 
