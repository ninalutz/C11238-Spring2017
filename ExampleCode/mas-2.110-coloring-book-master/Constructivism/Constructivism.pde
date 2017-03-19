PFont Helvetica; 

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

