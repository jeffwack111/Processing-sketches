class NODE{
  float r;
  float theta;
  
  NODE(float tr,float ttheta){
    r = tr;
    theta = ttheta;
  }
  
  float getr(){
    return r;
  }
  
  float gettheta(){
    return theta;
  }
  
  void squareroot(){
    r = sqrt(r);
    theta = theta/2;
  }
  
  void transl(float x, float y){
    float xp = r*cos(theta)+x;
    float yp = r*sin(theta)+y;
    r = sqrt((xp*xp)+(yp*yp));
    theta = atan2(yp,xp);
  }
  
  void show(){
    point(r*250*cos(theta),r*250*sin(theta));
  }
  
  boolean top(){
    float angle = theta;
    while(angle>2*pi){
      angle = angle-2*pi;
    }
    if(angle<0 || angle>pi){
      return false;
    }
    
    else{
      return true;
    }
  }
 
}

NODE[] invsquare(NODE A){
  NODE[] B = new NODE[2];
  float newr = sqrt(A.getr());
  float newth = A.gettheta()/2;
  B[0] = new NODE(newr,newth);
  B[1] = new NODE(newr,newth+pi);
  return B;
}

NODE cop(NODE A){
  float nr = A.getr();
  float ntheta = A.gettheta();
  return new NODE(nr, ntheta);
}
