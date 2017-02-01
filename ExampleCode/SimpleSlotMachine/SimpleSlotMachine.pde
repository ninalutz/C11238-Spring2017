void setup(){
size(900, 800);
init_colors();
query_twitter();
}

void draw(){
  
background(255);
//lever 
if(!analyzing){
fill(255);
rect(800, 200, 20, 250);
fill(#ff0000);
ellipse(810, 210, 50, 50);
}

if(analyzing){
fill(255);
rect(800, 450, 20, 250);
fill(#ff0000);
ellipse(810, 700, 50, 50);
}

//slots
//left slot
fill(l1);
rect(50, 50, 200, 400);
fill(l2);
rect(50, 50, 200, 100);
fill(l3);
rect(50, 350, 200, 100);

//center slot 
fill(c1);
rect(300, 50, 200, 400);
fill(c2);
rect(300, 50, 200, 100);
fill(c3);
rect(300, 350, 200, 100);

//right slot
fill(r1);
rect(550, 50, 200, 400);
fill(r2);
rect(550, 50, 200, 100);
fill(r3);
rect(550, 350, 200, 100);

fill(255);
//read out 
rect(175, 500, 450, 250);
fill(0);
textSize(20);
text(thing, 190, 520, 410, 400);
//println(thing);
fill(255);

moodcolors();

fill(0);
text("Press space to pull lever", 10, 30);

fill(255);

}

void keyPressed(){
if (key == ' '){
  Network.clear();
  query_twitter();
  analyzing = !analyzing;
  thing = "";
}
}