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
   
   float pha() {
     return atan2(y,x);
   }
   
   
   void prin(){
     println(this.re() + " + " + this.im() +"i");
   }
   
   CXN copy(){
     return new CXN(x,y);
   }
   
   void plot(){
     noStroke();
     ellipse(x,y,10,10); 
   }  
   
  
}
  
  
CXN mul(CXN A, CXN B){
  float tempx = A.re()*B.re()-A.im()*B.im();
  float tempy = A.re()*B.im()+A.im()*B.re();
  return new CXN(tempx,tempy);
}

CXN sca(float c, CXN A){
 float tempx = A.re()*c;
 float tempy = A.im()*c;
 return new CXN(tempx, tempy);
}

CXN ad(CXN A, CXN B){
  return new CXN(A.re()+B.re(), A.im()+B.im());
}

CXN bar(CXN A){
  return new CXN(A.re(), -A.im());
}

CXN power(CXN A, float n){
  CXN out = new CXN(1,0);
  for(int j=0; j<n; j++){
    out = mul(out,A);
  }
  return out;
}

CXN inv(CXN A){
  float tempx = A.re()/(A.re()*A.re()+A.im()*A.im());
  float tempy = -A.im()/(A.re()*A.re()+A.im()*A.im());
  return new CXN(tempx,tempy);
}

CXN minus(CXN A){
  return new CXN(-A.re(),-A.im());
}

float distsq(CXN A, CXN B){
  float d = (A.re()-B.re())*(A.re()-B.re())+(A.im()-B.im())*(A.im()-B.im());
  return d;
}
