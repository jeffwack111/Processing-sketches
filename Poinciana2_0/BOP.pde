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
  
  void listen(FFT ffta){
    int power = 0;
    for(int i=l; i<h; i++){
      power += ffta.getBand(i)*s;
    }
    j = power;
  }
  
  
  
  
}
