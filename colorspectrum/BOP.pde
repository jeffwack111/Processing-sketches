class BOP{
  
  int x;
  int y;
  
  int w;
  int h;
  
  float z;
  
  float col;
  
  BOP(int tx, int ty, int tw, int th,float tcol) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    z = 0;
    col = tcol;
  }
    
  void dbox(){
    rectMode(CORNER); 
    rect(x,y,w,-h);
  }
  
  void trans(int dx, int dy){
    x += dx;
    y += dy;
  }
  
  void sca(float ds){
    x = round(x*ds);
  }
  
  void lin(){
    line(x,y,z,x,y+h,z);
  }
  
  void transZ(float dz){
    z+=dz;
  }
  
  float col(){
    return col;
  }
  
  
}
