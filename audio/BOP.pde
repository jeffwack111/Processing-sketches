class BOP{
  
  float j;
  
  int x;
  int y;
  
  int l;
  int h;
  
  float s;
  
  BOP(int tx, int ty, int tl, int th, float ts) {
    x = tx;
    y = ty;
    l = tl;
    h = th;
    s = ts;
  }
    
  void dbox(){
    rect(x,y,j,j);
  }
  
  void listen(){
    int power = 0;
    for(int i=l; i<h; i++){
      power += fft.getBand(i)*s;
    }
    j = power;
  }
  
  
  
  
}
