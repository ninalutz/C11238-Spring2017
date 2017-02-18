boolean drawFrench = true;
boolean drawSpanish = true; 
boolean drawOther = true;
boolean showTowers = true;
boolean drawAll = true;
boolean pause;

void keyPressed(){
  switch(key){
  case 'n':
      //generates new random network
      key_n();
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
      //toggles drawing of all the lines
      drawAll = !drawAll;
      if(drawAll){
      drawFrench = true;
      drawSpanish = true;
      drawOther = true;
      }
      if(!drawAll){
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
      all.clear();
      french.clear();
      spanish.clear();
      other.clear();
      Nodes.clear();
      Network.clear();
      generate();
      analyzer();

}