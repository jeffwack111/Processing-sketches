class BOP{
  
  int x;
  int y;
  
  int w;
  int h;
  
  int z;
  
  BOP(int tx, int ty, int tw, int th) {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    z = 0;
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
  
  void transZ(int dz){
    z+=dz;
  }
  
  
  
}
