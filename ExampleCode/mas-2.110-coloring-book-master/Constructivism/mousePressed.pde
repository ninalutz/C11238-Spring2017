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
