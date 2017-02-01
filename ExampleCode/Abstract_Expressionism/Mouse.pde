//adds splatters as user presses and drags cursor
void mousePressed() {
  splatters.add(new Splatter(mouseX,mouseY));
}

void mouseDragged() {
  splatters.add(new Splatter(mouseX,mouseY));
}
