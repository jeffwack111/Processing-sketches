class EMIT{
  int x;
  int y;
  float w;
  float a;
  
  EMIT(int tx, int ty, float tw, float ta){
    x = tx;
    y = ty;
    w = tw;
    a = ta;
  }
  
  float go(int t){
    return(a*sin(w*t));
  }
  
}
