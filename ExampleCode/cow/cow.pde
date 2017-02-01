PFont Helvetica; 
/*
A SUPER Messy code from my freshman fall at MIT; it's an abtract cow that you can drag around. Good for mouse interactions probably. 
*/
void setup() {
  Helvetica = createFont("Helvetica", 16, true);
  size(1200, 1000);
  //rectangle body 
  bx = width/2.0;
  by = height/2.0;
  
  //oval for head
  cx = width/3.0;
  cy = height/2.5;
  
  //movable spots
  sx = width/2.55; 
  sy = height/1.95;
  
  s1x = width/1.75; 
  s1y = height/2.0; 
  
  //legs
  lx = width/2.0;
  ly = height/1.6;
  
  l1x = width/1.7;
  l1y = height/1.6;
  
  l2x = width/2.3;
  l2y = height/1.7;
  
  l3x = width/2.6;
  l3y = height/1.6;
  rectMode(RADIUS);  
}

void draw() { 
  background(250);
  textFont(Helvetica);       
  fill(0);
  textAlign(CENTER);
  text("Drag around elements to make different constructivist cows. \n You can group objects together and take them apart by dragging the lower element.", width/2, 100);
//-----BODY AND BOX CODE----
// Test if the cursor is over the box 
  if (mouseX > bx-boxSize-100 && mouseX < bx+boxSize+100 && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
    overBox = true;  
    if(!lockedbox) { 
    } 
  } else {
    overBox = false;
  }
// Draw the box
  if (bx > width/2.0) { 
    fill(0); 
  } 
  else { 
    fill(255);
  }
  rect(bx, by, boxSize + 100, boxSize);
//--Draw circles for body
  if (bx > width/2.0) { 
    fill(255); 
  } 
  else { 
    fill(0);
  }
  ellipse(bx, by, 75, 75);
  ellipse(bx-55, by-55, 50, 50);
  ellipse(bx+55, by+55, 25, 25);

//-----OVAL FOR HEAD----
  if (cy > width/2.5) { 
    fill(255);
  } 
  else { 
    fill(#ff0000); 
  }
  ellipse(cx, cy, circleSize+25, circleSize);
// Test if cursor is over the oval 
if (mouseX > cx-circleSize && mouseX < cx+circleSize && 
      mouseY > cy-circleSize && mouseY < cy+circleSize) {
    overCircle = true;  
    if(!lockedcircle) { 
    } 
  } else {
    overCircle = false;
  }
  
//-----SPOTS----
//### spot
  if (sx > width/2.0) { 
    fill(0);
    spotSize = 50;
  } 
  else { 
    fill(0); 
    spotSize = 80;
  }  
  ellipse(sx, sy, spotSize, spotSize);
// Test if cursor is over the spot
if (mouseX > sx-spotSize && mouseX < sx+spotSize && 
      mouseY > sy-spotSize && mouseY < sy+spotSize) {
    overSpot = true;  
    if(!lockedspot) { 
    } 
  } else {
    overSpot = false;
  }  

//#### spot 1 
  if (s1x > width/2.0) { 
    fill(0);
    spot1Size = 50;
  } 
  else { 
    fill(0); 
    spot1Size = 80;
  }  
  ellipse(s1x, s1y, spot1Size, spot1Size);
// Test if cursor is over the spot
if (mouseX > s1x-spot1Size && mouseX < s1x+spot1Size && 
      mouseY > s1y-spot1Size && mouseY < s1y+spot1Size) {
    overSpot1 = true;  
    if(!lockedspot1) { 
    } 
  } else {
    overSpot1 = false;
  }  
  
//---LEGS-----
//###leg 0 
// Test if the cursor is over the leg
  if (mouseX > lx-legSize && mouseX < lx+legSize && 
      mouseY > ly-legSize-30 && mouseY < ly+legSize +30) {
    overLeg = true;  
    if(!lockedleg) { 
    } 
  } else {
    overLeg = false;
  }
// Draw the box
  if (lx > width/2.0) { 
    fill(255); 
  } 
  else { 
    fill(0);
  }
  rect(lx, ly, legSize, legSize + 30);
  
//###leg 1
 if (mouseX > l1x-leg1Size && mouseX < l1x+leg1Size && 
      mouseY > l1y-leg1Size-40 && mouseY < l1y+leg1Size +40) {
    overLeg1 = true;  
    if(!lockedleg1) { 
    } 
  } else {
    overLeg1 = false;
  }
// Draw the box
  if (l1x > width/2.0) { 
    fill(#ff0000); 
  } 
  else { 
    fill(0);
  }
  rect(l1x, l1y, leg1Size, leg1Size + 40);
  
//###leg 2 
 if (mouseX > l2x-leg2Size - 15 && mouseX < l2x+leg2Size + 15 && 
      mouseY > l2y-leg2Size && mouseY < l2y+leg2Size ) {
    overLeg2 = true;  
    if(!lockedleg2) { 
    } 
  } else {
    overLeg2 = false;
  }
// Draw the box
  if (l2x > width/2.0) { 
    leg2Size = 45;
    fill(255);
  } 
  else { 
    fill(0);
    leg2Size = 15;
  }
  rect(l2x, l2y, leg2Size + 15, leg2Size);
  
//###leg 3 
// Test if the cursor is over the leg
  if (mouseX > l3x-leg3Size && mouseX < l3x +leg3Size && 
      mouseY > l3y-leg3Size-30 && mouseY < l3y+leg3Size +30) {
    overLeg3 = true;  
    if(!lockedleg3) { 
    } 
  } else {
    overLeg3 = false;
  }  
// Draw the box
  if (l3x > width/2.0) { 
    fill(#ff0000); 
  } 
  else { 
    fill(255);
  }
  rect(l3x, l3y, leg3Size, leg3Size + 30);
}

//oval that changes from red to black
float cx;
float cy;
int circleSize = 75;
//initialize logic for overshape function check for moving objects 
boolean overCircle = false;
boolean lockedcircle = false;
float cxOffset = 0.0;
float cyOffset = 0.0;
//leg
float lx;
float ly;
int legSize = 25;
boolean overLeg = false;
boolean lockedleg = false;
float lxOffset = 0.0; 
float lyOffset = 0.0; 

//leg 1
float l1x;
float l1y;
int leg1Size = 5;
boolean overLeg1 = false;
boolean lockedleg1 = false;
float l1xOffset = 0.0; 
float l1yOffset = 0.0; 

//leg 2
float l2x;
float l2y;
int leg2Size = 15;
boolean overLeg2 = false;
boolean lockedleg2 = false;
float l2xOffset = 0.0; 
float l2yOffset = 0.0; 

//leg 3
float l3x;
float l3y;
int leg3Size = 25;
boolean overLeg3 = false;
boolean lockedleg3 = false;
float l3xOffset = 0.0; 
float l3yOffset = 0.0; 
//body of cow 
float bx;
float by;
int boxSize = 75;
boolean overBox = false;
boolean lockedbox = false;
float bxOffset = 0.0; 
float byOffset = 0.0; 
//spots that move and grow

//spot
float sx;
float sy;
int spotSize = 50;
boolean overSpot = false;
boolean lockedspot = false;
float sxOffset = 0.0;
float syOffset = 0.0;

//spot 1
float s1x;
float s1y;
int spot1Size = 75;
boolean overSpot1 = false;
boolean lockedspot1 = false;
float s1xOffset = 0.0;
float s1yOffset = 0.0;
void mouseDragged() {
//series of loops that shift position of respective objects when dragged
//nested if loops allow for the objects to "stick" together because movement is dependent on the location of the cursor 
  if(lockedbox) {
    bx = mouseX-bxOffset; 
    by = mouseY-byOffset; 
}
  if(lockedcircle) { 
    cx = mouseX - cxOffset;
    cy = mouseY - cyOffset;
  }
  
  if(lockedleg) { 
    lx = mouseX - lxOffset;
    ly = mouseY - lyOffset;
  }
  
  if(lockedleg1) { 
    l1x = mouseX - l1xOffset;
    l1y = mouseY - l1yOffset;
  }
  
  if(lockedleg2) { 
    l2x = mouseX - l2xOffset;
    l2y = mouseY - l2yOffset;
  }
  
  if(lockedleg3) { 
    l3x = mouseX - l3xOffset;
    l3y = mouseY - l3yOffset;
  }
  
  if(lockedspot) { 
    sx = mouseX - sxOffset;
    sy = mouseY - syOffset;
  }
  
  if(lockedspot1) { 
    s1x = mouseX - s1xOffset;
    s1y = mouseY - s1yOffset;
  }
}
void mousePressed() {
//mouse pressing overShape unlocks and also results in sticking factors
  
//body and rectangle
  if(overBox) { 
    lockedbox = true; 
  } else {
    lockedbox = false;
  }
  bxOffset = mouseX-bx; 
  byOffset = mouseY-by; 
//oval for head  
    if(overCircle) { 
    lockedcircle = true; 
  } else { 
    lockedcircle = false; 
  }
  cxOffset = mouseX - cx; 
  cyOffset = mouseY - cy; 
  
//spots 
if(overSpot) { 
    lockedspot = true; 
  } else { 
    lockedspot = false; 
  }
  sxOffset = mouseX - sx; 
  syOffset = mouseY - sy; 
  
if(overSpot1) { 
    lockedspot1 = true; 
  } else { 
    lockedspot1 = false; 
  }
  s1xOffset = mouseX - s1x; 
  s1yOffset = mouseY - s1y; 
  

//legs
  if(overLeg) { 
    lockedleg = true; 
  } else { 
    lockedleg = false; 
  }
  lxOffset = mouseX - lx; 
  lyOffset = mouseY - ly; 
  
    if(overLeg1) { 
    lockedleg1 = true; 
  } else { 
    lockedleg1 = false; 
  }
  l1xOffset = mouseX - l1x; 
  l1yOffset = mouseY - l1y; 
  
  if(overLeg2) { 
    lockedleg2 = true; 
  } else { 
    lockedleg2 = false; 
  }
  l2xOffset = mouseX - l2x; 
  l2yOffset = mouseY - l2y; 
  
  if(overLeg3) { 
    lockedleg3 = true; 
  } else { 
    lockedleg3 = false; 
  }
  l3xOffset = mouseX - l3x; 
  l3yOffset = mouseY - l3y; 
}
void mouseReleased() {
  lockedbox = false;
  lockedcircle = false;
  lockedleg = false;
  lockedleg1 = false;
  lockedleg2 = false;
  lockedleg3 = false;
  lockedspot = false;
  lockedspot1 = false;
}

