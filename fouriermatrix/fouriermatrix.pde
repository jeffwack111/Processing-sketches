import processing.pdf.*;

float pi = 3.141592653589793238462643383279;
int b = 1;
int bottom = 32;
int top = 200;
int step = 6;
int n = bottom; //initializes n at bottom

void setup() {
  size(1000,1000);
  colorMode(HSB,2*pi);
  noStroke();
 
}

void draw(){
CXN w = new CXN(cos(2*pi/n),sin(2*pi/n));
CXN u = new CXN(1,0);
CXN F[][] = new CXN[n][n];

for(int j=0; j<n; j++){
  CXN v = new CXN(1,0);
for(int k=0; k<n; k++){
  F[j][k] = v;
  float p = F[j][k].pha();
  if (p<0){
    fill(p+2*pi,2*pi+p,2*pi);
  }
  else {
    fill(p,2*pi-p,2*pi);
  }
  
  rect(j*1000/(n),k*1000/(n),1000/(n)+1,1000/(n)+1);
    v = mul(u,v);
}
u = mul(u,w);
}

  float v = 20.01+20*cos(pi*(n-bottom)/(2*(top-bottom)));
  delay(round(v)); //better
  
  if (b == 1){
  n += step;
  }
  if (b == 0){
   n += -step; 
  }
  
  if (n-step<bottom){
   b++; 
  }
  
  if (n+step>top){
   b--; 
  }
  
  
}

CXN mul(CXN A, CXN B){
  float tempx = A.re()*B.re()-A.im()*B.im();
  float tempy = A.re()*B.im()+A.im()*B.re();
  return new CXN(tempx,tempy);
}

class CXN {
  float vx;
  float vy;
  
  CXN(float tempvx, float tempvy) {
    vx = tempvx;
    vy = tempvy;
  
   }
   
    float re() {
      return vx;
    }
   
   float im() {
     return vy;
   }
   
   float pha() {
     return atan2(vy,vx);
   }
   
    CXN squared() {  
      float tempvx = vx*vx - vy*vy;
      float tempvy = 2*vx*vy;
      return new CXN(tempvx,tempvy);
    }
    
    CXN bar() {
      float tempvx = vx;
      float tempvy = -vy;
      return new CXN(tempvx,tempvy);
    }
    
    void plot(float px,float py,float s) {
      fill(0,0,0);
      line(px, py, s*vx+px,-s*vy+py);
      fill(0,255,0);
      ellipse(s*vx+px,-s*vy+py,5,5);
    }
    
    void root(float px,float py) {
     fill(255,0,0);
     ellipse(500+px,500+py,10,10); 
    }

}
