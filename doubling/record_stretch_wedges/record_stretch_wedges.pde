float t = -0.25;
int n = 0;
PGraphics img;

void setup(){
  size(1000,1000);
  img = createGraphics(width, height);
}

void draw(){
  if(n<250){
    img.beginDraw();
    img.clear();
    img.noStroke();
    t+=0.005;
    Wedges(10,smoothstep(t));
    img.endDraw();
    img.save("wedges"+n+".png");
    n++;
  }
}

void Wedges(int N_layers, float t){
  color[] colors = {color(36, 122, 17),color(95, 21, 148)};
  for(int layer=N_layers;layer>0;layer--){
    int N_wedges = int(pow(2,layer));
    int i = 0;
    //BOTTOM HALF
    /*if (layer==1){
      i=1;
    }*/
    float q = 0.7;
    //TOP HALF
    for(int wedge=N_wedges-1; wedge>-1; wedge--){
      float start = -(1+t)*(wedge+1)*2*PI/N_wedges;
      float stop = -(1+t)*(wedge)*2*PI/N_wedges;
      float r = 500*(1/q-pow(q,layer-t-1));
      img.fill(colors[i]);
      if(wedge < N_wedges/2){
        r = r+1;
      }
      img.arc(500, 500, r, r, start, stop,PIE);
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
    
