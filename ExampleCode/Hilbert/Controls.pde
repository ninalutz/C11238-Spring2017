void keyReleased(){
  if( key == '+'){
    levels++;
    if( levels > 4) levels = 4;
    if( levels < 0) levels = 0;
  }
  
  if(key == '-'){
    levels--;
    if( levels > 4) levels = 4;
    if( levels < 0) levels = 0;
  }
}
