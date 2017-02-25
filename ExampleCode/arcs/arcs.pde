arq[] arcs;
float ray;int maxi;
 
void setup(){
  size(880,660); maxi=(int)sqrt(440*330+440*330)*2;
  background(255);
  arcs= new arq[4];
  ray = 0;
  for(int a=0;a<4;a++){
    arcs[a]=new arq(440,330,50+a*45);
  }
  arcs=(arq[]) reverse(arcs);
  noFill();
  strokeWeight(10);
  smooth();
  strokeCap(SQUARE);
}
 
void draw(){
  ray+=0.9;
  if(ray>25){
    ray=0;
    for(int a=0;a<arcs.length;a++){
      if(arcs[a].r+25 <= 200){
      arcs[a].r+=25;
      }
      else{
        arcs[a].r-=25;
      }
    }
     arcs = (arq[]) append (arcs, new arq(440,330,50));
      if(arcs[0].r>maxi){
       arcs = (arq[]) subset (arcs, 1);
      }
  }
  background(255);
  for(int a=0;a<arcs.length;a++){
    arcs[a].dessine();
  }
  ellipse(440,330,45,45);
}
 
class arq{
  int x,y;
  mouvement m;
  float r,a,l,v;
  arq(int _x, int _y, int _r){
    m = new mouvement();
    x=_x;
    y=_y;
    r=_r;
    a=random(TWO_PI);
    l=random(0.3,0.7);
    v=random(-0.04,0.04);
  }
  void dessine(){
    arc(x, y, r+ray, r+ray, a, a+l*PI);
    arc(x, y, r+ray, r+ray, a+PI, a+PI+l*PI);
    l=l+(1-l)*0.002;
    a+=m.bouge();
  }
}
 
class mouvement{
  float n,v,v2;
  mouvement(){
    n=0;v=PI/100;v2=random(0.01,0.05);
  }
  float bouge(){
    n+=v;
    return cos(n)*v2;
  }
}
