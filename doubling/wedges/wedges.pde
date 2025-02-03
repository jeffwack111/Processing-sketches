void setup(){
  color[] colors = {color(95, 21, 148),color(36, 122, 17)};
  int i = 0;
  size(1000,1000);
  background(255);
  noStroke();
  for(int layer=8;layer>0;layer--){
    int N_wedges = int(pow(2 ,layer));
    for(int wedge=0; wedge<N_wedges; wedge++){
      float start = wedge*2*PI/N_wedges;
      float stop = (wedge+1)*2*PI/N_wedges;
      fill(colors[i]);
      arc(500, 500, 80*layer, 80*layer, start, stop,PIE);
      i++;
      i = i%2;
    }
  }
  save("wedges.png");
}

void draw(){
}
