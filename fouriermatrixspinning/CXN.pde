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

CXN mul(CXN A, CXN B){
  float tempx = A.re()*B.re()-A.im()*B.im();
  float tempy = A.re()*B.im()+A.im()*B.re();
  return new CXN(tempx,tempy);
}
