float t = -0.25;
int n = 0;

void setup(){
  size(1000,1000);
}

void draw(){
  background(255);
  noStroke();
  t+=0.01;
  Wedges(8,smoothstep(t));
  n++;
}

void Wedges(int N_layers, float t){
  color[] colors = {color(95, 21, 148),color(36, 122, 17)};
  for(int layer=N_layers;layer>0;layer--){
    int N_wedges = int(pow(2,layer-1));
    int i = 0;
    //BOTTOM HALF
    if (layer==1){
      i=1;
    }
    float q = 0.7;
    for(int wedge=0; wedge<N_wedges; wedge++){
      float start = (1+t)*(PI - (wedge+1)*PI/N_wedges);
      float stop = (1+t)*(PI - wedge*PI/N_wedges);
      float r = 500*(1/q-pow(q,layer-t-1));
      fill(colors[i]);
      arc(500, 500, r, r, start, stop,PIE);
      i++;
      i = i%2;
    }
    
    //TOP HALF
    for(int wedge=0; wedge<N_wedges; wedge++){
      float start = -(1+t)*(wedge+1)*PI/N_wedges;
      float stop = -(1+t)*wedge*PI/N_wedges;
      float r = 500*(1/q-pow(q,layer-t-1))+1;
      fill(colors[i]);
      arc(500, 500, r, r, start, stop,PIE);
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
    
