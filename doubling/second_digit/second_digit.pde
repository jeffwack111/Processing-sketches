float t = 1;
int n = 0;
float R = 500;
float q = 0.7;


void setup(){
  size(1000,1000);
}

void draw(){
  background(255);
  translate(500,500);
  scale(1,-1);
  noStroke();
  if(t>0.005){
    t-=0.005;
  }
  
  Wedges(2,t);
  
 
  n++;
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
    //TOP HALF
    for(int wedge=N_wedges-1; wedge>-1; wedge--){
      float stop = (1+t)*(wedge+1)*2*PI/N_wedges;
      float start = (1+t)*(wedge)*2*PI/N_wedges;
      float r =R*(1/q-pow(q,layer-t-1));
      fill(colors[i]);
      if(wedge < N_wedges/2){
        r = r+1;
      }
      arc(0,0, 2*r, 2*r, start, stop,PIE);
      i++;
      i = i%2;
    }
    
  }
  float r =R*(1/q-pow(q,N_layers-t-1));
  strokeWeight(3);
  stroke(0);
  for(int i=0;i<=5;i++){
    float n = pow(2,i);
    for(int j=0; j<n;j++){
      float k = (2*j+1)*(1+t);
      float len = r/sqrt(n);
      line(r*cos(PI*k/n),r*sin(PI*k/n),(r-len)*cos(PI*k/n),(r-len)*sin(PI*k/n));
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
    
