/*
MIT Media Lab, Changing Places Group, Summer 2016

Drawing Lines Script by Nina Lutz, nlutz@mit.edu
Made for CDR Network Visualization for the Andorra CityScope Project, MIT Media Lab, Changing Places

Supervisor: Ira Winder, jiw@mit.edu 
Joint Supervisor (on this script): Arnaud Grignard

This script generates a random network of nodes and edges and displays a looping animation of the edges traveling from their orgins to destination
This is an abstract component, but in the real visualization the nodes are cell phone towers and the edges are amounts of different nationalities going between them

Obviously you can change these colors to not match nationalities

The programmer can define the number of nodes generated, number of edges, the increment (speed), delay between loops and add more types/colors/langauges of the edges

Users can hover over a particular node for information on it 

Users can click on a node to see the animation of this node's network 

Different key commands also toggle display options

This script uses two classes; Node and Edge 

*/

//delay between loops (in milliseconds)
int delay = 1000;
//speed for the edges, you could also set this individupeopley
float increment = .0005;

//numbers for generating network
int numnodes = 5;
int numedges = 16;
int numClicks;

//duration of animation
int duration, sel, mini;
//initialTime, loops per animation
long initialTime;
//booleans for controling the animation and showing displays, set at false for setup
boolean miniNetwork, needLoop, showInfo;
  
void setup(){
 size(1400, 800, P3D);
 initialTime = millis();
 
 //generates the network
 generate_nodes();
 generate();
 analyzer();
 smooth();
}

void draw(){
  background(10);
  drawLegend();
  
  //resets initial time apporpriately after one iteration and delay
  if(needLoop){
    initialTime += duration;
    initialTime += delay;
    needLoop = !needLoop;
  }
  
  
  if(!pause){  
  if(drawOther){
    drawNetwork(people);
  }
  }
  
  if(showInfo){
    drawInfo(sel);
  }
  
   if(miniNetwork){
    miniNetwork(mini);
  }
  
  if(pause){
    if(drawOther){
      drawPaused(people);
    }
  }
  
   for(int i = 0; i<Network.size(); i++){
        if(abs(mouseX-Network.get(i).location.x) <= 15 && abs(mouseY-Network.get(i).location.y) <= 15){
             showInfo = true;
             sel = i;
        }
      }
    
  if(showTowers){
    drawNodes();
  }
  
  textSize(14);
  fill(255);
  text("Nina Lutz, MIT Media Lab", 20, 20);

}


void mouseClicked(){
  int x = mouseX;
  int y = mouseY;
      for(int i = 0; i<Network.size(); i++){
        if(abs(x-Network.get(i).location.x) <= 15 && abs(y-Network.get(i).location.y) <= 15){
            mini = i;
            miniNetwork = true;
        }
        else if(x>width-200 || y > height-200){
          miniNetwork = false;
        }
      }
}