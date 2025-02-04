class BEAM{
  CXN X;
  CXN Y;
  
  BEAM(float theta){ //makes LINEAR beam only
    X = new CXN(cos(theta),0);
    Y = new CXN(sin(theta),0);
  }
  
  BEAM(CXN tX, CXN tY){
    X = tX;
    Y = tY;
  }
  
  CXN X(){
    return X;
  }
  
  CXN Y(){
    return Y;
  }
  
  float theta(){
    return atan2(Y.ma(),X.ma());
  }
  
  void show(int x, int y){
    strokeWeight(3);
    for(int n=0;n<120;n++){
      CXN pha = new CXN(cos(n*pi/60),sin(n*pi/60));
      CXN eks = mul(X,pha);
      CXN why = mul(Y,pha);
      point(x+eks.re()*200,y-why.re()*200);
    }
  }
}

BEAM pass(BEAM beam, float phi, float theta){
  CXN oneone = new CXN(cos(phi/2), sin(phi/2)*cos(2*theta));
  CXN onetwo = new CXN(0, sin(phi/2)*sin(2*theta));
  CXN twoone = new CXN(0, sin(phi/2)*sin(2*theta));
  CXN twotwo = new CXN(cos(phi/2), -sin(phi/2)*cos(2*theta));
  
  CXN OUTX = sum(mul(oneone,beam.X()),mul(onetwo,beam.Y()));
  CXN OUTY = sum(mul(twoone,beam.X()),mul(twotwo,beam.Y()));
 
  return new BEAM(OUTX, OUTY);
}
