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
