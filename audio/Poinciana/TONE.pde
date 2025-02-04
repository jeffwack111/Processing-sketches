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
  
  void listen(FFT ffta){
    int band = 0;
    float power = 0;
    for(int i=1; i<10; i++){
      band = ffta.freqToIndex(i*f);
      power += ffta.getBand(band)*s/i;
    }
    
    j = power;
    
  }
  
  void dbox(){
    rect(x,y,j,j);
  }
  
   void del(){
    ellipse(x,y,j/3,j*j/100);
  }
 
  
  float en(){
    return j;
  }
  
}
