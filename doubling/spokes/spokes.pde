int depth = 7;
float t = -0.1;
float R = 400;
int frame = 0;

PGraphics img;

void setup(){
 size(1000,1000); 
 img = createGraphics(width, height);
}

void draw(){
  img.beginDraw();
  img.clear();
  img.translate(500,500);
  img.scale(1,-1);
  img.noFill();
  img.strokeWeight(5);
  img.circle(0,0,2*R);
  img.strokeWeight(2);
  img.line(R,0,0,0);
  for(int i=0;i<=depth;i++){
    float n = pow(2,i);
    for(int j=0; j<n;j++){
      float k = (2*j+1)*(1+smoothstep(t));
      float len = R/sqrt(n);
      img.line(R*cos(PI*k/n),R*sin(PI*k/n),(R-len)*cos(PI*k/n),(R-len)*sin(PI*k/n));
    }
  }
  t+=0.0025;
  frame++;
  img.endDraw();
  if(t<1.1){
    img.save("frame"+frame+".png"); 
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
