color l1 = color(255, 255, 255);
color l2 = color(255, 255, 255);
color l3 = color(255, 255, 255);

color c1 = color(255, 255, 255);
color c2 = color(255, 255, 255);
color c3 = color(255, 255, 255);

color r1 = color(255, 255, 255);
color r2 = color(255, 255, 255);
color r3 = color(255, 255, 255);

boolean analyzing = false;

color[] colarray = new color[8];

void init_colors(){
color anger = color(255, 0, 0);
color disgust = color(230, 0, 250);
color sadness = color(0, 18, 234);
color trust = color(0, 255, 154);
color fear = color(0, 117, 63);
color surprise = color(0, 247, 255);
color anticipation = color(255, 178, 21);
color joy = color(255, 255, 0);

colarray[0] = anger;
colarray[1] = disgust;
colarray[2] = sadness; 
colarray[3] = trust;
colarray[4] = fear;
colarray[5] = surprise;
colarray[6] = anticipation;
colarray[7] = joy;
}

void moodcolors(){
  if(millis() % 5 == 0 && analyzing){
    c1 = colarray[int(random(0, 8))];
    c2 = colarray[int(random(0, 8))];
    c3 = colarray[int(random(0, 8))];
    l1 = colarray[int(random(0, 8))];
    l2 = colarray[int(random(0, 8))];
    l3 = colarray[int(random(0, 8))];
    r1 = colarray[int(random(0, 8))];
    r2 = colarray[int(random(0, 8))];
    r3 = colarray[int(random(0, 8))];
  }
  
  if(millis() % 40 == 0 && analyzing){
    emotion_joy = 0;
    emotion_anger = 0;
    emotion_anticipation = 0;
    emotion_fear = 0;
    emotion_trust = 0;
    emotion_surprise = 0;
    emotion_sadness = 0; 
    emotion_disgust = 0;
    analyze_Network();
    //Network.clear();
    analyzing = false;
  }

}