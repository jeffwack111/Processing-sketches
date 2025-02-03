class TONE{
  
  float f;
  
  int x;
  int y;
  
  float s;
  
  float j;
  
  TONE(float tf, int tx, int ty, float ts){
   f = tf;
   x = tx;
   y = ty;
   s = ts;
  }
  
  void listen(){
    int band = 0;
    float power = 0;
    for(int i=1; i<10; i++){
      band = fft.freqToIndex(i*f);
      power += fft.getBand(band)*s/i;
    }
    
    j = power/2 +j/2;
    
  }
  
  void dbox(){
    rect(x,y,j,j);
  }
  
   void del(){
    ellipse(x,y,j,j);
  }
  
  float en(){
    return j;
  }
  
}
