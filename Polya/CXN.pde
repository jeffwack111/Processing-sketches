class CXN {
  float x;
  float y;
  
  CXN(float tempx, float tempy) {
    x = tempx;
    y = tempy;
  
   }
   
    float re() {
      return x;
    }
   
   float im() {
     return y;
   }
   
   float ma() {
     return sqrt(x*x+y*y);
   }
   
    CXN squared() {  
      float tempx = x*x - y*y;
      float tempy = 2*x*y;
      return new CXN(tempx,tempy);
    }
    
    CXN bar() {
      float tempx = x;
      float tempy = -y;
      return new CXN(tempx,tempy);
    }
    
    void plot(CXN L) { //plots this CXN at location given by the argument, CXN L
      fill(0,0,0);
      float px = 500 + L.re()*500/range;
      float py = 500 - L.im()*500/range;
     
      float dx = x/sqrt(x*x+y*y);
      float dy = -y/sqrt(x*x+y*y); //THIS THE SPOT for the Polya minus sign, maybe? perhaphs the negative should go earlier in the calculation 
      float m = len*atan(scale*sqrt(x*x+y*y));
      
      //float dx = x;
     // float dy = y;
      //float m = 1;
      
      if (x==0 && y==0){
         fill(255,0,0);
         noStroke();
         ellipse(px,py,10,10);
      }
      else{
        strokeWeight(1);
        stroke(0);
         line(px, py, px+m*dx,py-m*dy);
         noStroke();
      ellipse(px+m*dx,py-m*dy,2,2);
      }
      
    }

}
