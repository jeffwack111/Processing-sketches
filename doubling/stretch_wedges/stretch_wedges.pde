float t = -0.5;
int n = 0;
PGraphics img;

void setup(){
  size(1000,1000);
  img = createGraphics(width, height);
}

void draw(){
  background(255);
  img.beginDraw();
  img.noStroke();
  t+=0.01;
  Wedges(8,smoothstep(t));
  image(img,0,0);
  img.save("wedges"+n+".png");
  n++;
  img.endDraw();
}

void Wedges(int N_layers, float t){
  int i = 0;
  color[] colors = {color(95, 21, 148),color(36, 122, 17)};
  for(int layer=N_layers;layer>0;layer--){
    int N_wedges = int(pow(2,layer-1));
    for(int wedge=0; wedge<N_wedges; wedge++){
      float stop = -(1+t)*wedge*PI/N_wedges;
      float start = -(1+t)*(wedge+1)*PI/N_wedges;
      img.fill(colors[i]);
      img.arc(500, 500, 80*layer, 80*layer, start, stop,PIE);
      i++;
      i = i%2;
    }
  }
}

float smoothstep(float t){
  if (t<0){
    return 0;
  }
  else if (t<1){
    return 3*t*t - 2*t*t*t;
  }
  else{
    return 1;
  }
}
    
