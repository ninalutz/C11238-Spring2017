//stand alone voronoi applet by Nina Lutz

/*
Generate random nodes and their appropriate voronoi polygons
Colors the data points in the csv file appropriately 
Click to redraw, can be a bit buggy, still always in progress 
*/

int i = 0;
int ncolors = 9;
float[] towers_x = new float[ncolors];
float[] towers_y = new float[ncolors];
color[] tower_colors = new color[ncolors];
ArrayList<PVector> tower_1 = new ArrayList<PVector>();

Table values;
 
float minDistance = 0;
int minIndex = 0;
 
 // this is run once.
void setup()
{
    size(500, 500);
    background(250);

    smooth();
    
    noLoop();
 
    // Set towers position, random
    for(i=0; i < ncolors; i++)
    {
        towers_x[i] = random(width);
        towers_y[i] = random(height);
        tower_colors[i] = color(random(0, 255), random(0, 255), random(0, 255));
    }
    
}

void draw()
{  
    for(float px = 0; px < width; px++)
    {
         for(float py = 0; py < height; py++)
         {
             // Check distances to colors
             //check ONE distance
             minDistance = pow((px  - towers_x[0]), 2)  +  pow((py  - towers_y[0]), 2);
             minIndex = 0;
             //and iterate through for the rest
                       for (int i = 1; i < ncolors; i++)
                       {
                           float dist = ((px  - towers_x[i]) * (px - towers_x[i])) +  ((py  - towers_y[i]) * (py  - towers_y[i]));
                            
                           if (dist <= minDistance)
                           {
                               minDistance = dist;
                               minIndex = i;
                          }
                      }
            stroke(tower_colors[minIndex]);
            point(px, py);
        }
        
    }
    
    for(int i = 0; i<50; i++){
            float x = random(0, width);
            float y = random(0, height);
            
            //base case; away from the first tower 
            minDistance = pow((x  - towers_x[0]), 2)  +  pow((y  - towers_y[0]), 2);
            minIndex = 0;
            fill(tower_colors[minIndex]);
            stroke(0);
            ellipse(x, y, 5, 5); 
            fill(0);
            //iterate for other towers and replace with appropriate fill 
                   for (int nc = 1; nc < ncolors; nc++)
                         {
                             float dist = ((x  - towers_x[nc]) * (x - towers_x[nc])) +  ((y  - towers_y[nc]) * (y  - towers_y[nc]));
                              
                             if (dist <= minDistance)
                             {
                                 minDistance = dist;
                                 minIndex = nc;
                            }
                        }
            fill(tower_colors[minIndex]);
            stroke(0);
            ellipse(x, y, 5, 5); 
            fill(0);
                  
         }
                
            for(i=0; i < ncolors; i++)
                {
                    ellipse(towers_x[i], towers_y[i], 10, 10); 
                }
}

void mouseClicked(){
//  clear();
  setup();
  redraw();
}

