class CXN {
  float x;
  float y;
  
  CXN(float tempx, float tempy) {
    x = tempx;
    y = tempy;
  
   }
   
  void sc(float s){
     x = x*s;
     y = y*s;
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
      
    }


CXN neg(CXN A){
 return new CXN(-A.re(),-A.im()); 
}

CXN mul(CXN A, CXN B){
  float tempx = A.re()*B.re()-A.im()*B.im();
  float tempy = A.re()*B.im()+A.im()*B.re();
  return new CXN(tempx,tempy);
}

CXN inv(CXN A){
  float tempx = A.re()/(A.re()*A.re()+A.im()*A.im());
  float tempy = -A.im()/(A.re()*A.re()+A.im()*A.im());
  return new CXN(tempx,tempy);
}

CXN sum(CXN A, CXN B){
 float tempx = A.re()+B.re();
 float tempy = A.im()+B.im();
 return new CXN(tempx,tempy);
}

CXN nbar(CXN A){
  return new CXN(A.re(),-A.im());
}
