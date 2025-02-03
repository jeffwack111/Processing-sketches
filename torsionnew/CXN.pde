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
   
   void plusequals(CXN A) {
     x += A.re(); 
     y += A.im();
   }
   
   void zero() { // this does not work. why?
     x = 0;
     y = 0;
   }
   
   CXN copy(){
     return new CXN(x,y);
   }
   
}

CXN mul(CXN A, CXN B){
  float tempx = A.re()*B.re()-A.im()*B.im();
  float tempy = A.re()*B.im()+A.im()*B.re();
  return new CXN(tempx,tempy);
}

CXN sca(CXN A, float c){
 float tempx = A.re()*c;
 float tempy = A.im()*c;
 return new CXN(tempx, tempy);
}

CXN sum(CXN A, CXN B){
  return new CXN(A.re()+B.re(),A.im()+B.im());
}

CXN dif(CXN A, CXN B){
  return new CXN(A.re()-B.re(),A.im()-B.im());
}
