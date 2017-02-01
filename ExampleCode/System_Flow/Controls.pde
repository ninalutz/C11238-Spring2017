boolean drawFrench = true;
boolean drawSpanish = true; 
boolean drawOther = true;
boolean showTowers = true;
boolean drawpeople = true;
boolean pause;

void keyPressed(){
  switch(key){
  case 'n':
      //generates new random network
      key_n();
      break; 
  case 'r':
      key_r();
      break;
  case 'f':
      drawFrench = !drawFrench;
      break;
  case 's':
      drawSpanish = !drawSpanish;
      break;
  case 'o':
      drawOther = !drawOther;
      break;
  case 'a':
      //toggles drawing of people the lines
      drawpeople = !drawpeople;
      if(drawpeople){
      drawFrench = true;
      drawSpanish = true;
      drawOther = true;
      }
      if(!drawpeople){
      drawFrench = false;
      drawSpanish = false;
      drawOther = false;
      }
      break;
  case 't':
      //toggles the display of the origin and destinations
      showTowers = !showTowers;
      break;
  case 'p':
      //toggles if lines are moving or not
      pause = !pause;
      break;       
  }
}

void key_n(){
      people.clear();
      Nodes.clear();
      Network.clear();
      generate_nodes();
      generate();
      analyzer();
}

void key_r(){
      people.clear();
      Network.clear();
      generate();
      analyzer();
}