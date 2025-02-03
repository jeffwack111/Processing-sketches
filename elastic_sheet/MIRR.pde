
class MIRR{
 
  int px;
  int py;
  int l;
  
  float a;
  float b;
  float c;
  
  boolean touched;
  
  MIRR(int tpx, int tpy, int hl) {
   px = tpx;
   py = tpy;
   l = 2*hl;
   
   touched = false;
  }
  
  float thx(){
   return atan((a-(b+c)/2)/l);
  }
  
  float thy(){
   return atan((c-b)/l); 
  }
  
  void feel(float[][] brane){
   a = brane[round((px + l/2)*n/1000)][round(py*n/1000)];
   b = brane[round((px - l/2)*n/1000)][round((py + l/2)*n/1000)];
   c = brane[round((px - l/2)*n/1000)][round((py - l/2)*n/1000)]; 
  }
  
  void be(){
    line(px + l/2, py, px - l/2, py + l/2); //a to b
    line(px - l/2, py + l/2, px - l/2, py - l/2); //b to c
    line(px - l/2, py - l/2, px + l/2, py); //c to a
  }
  
  boolean touch() {
    return touched;
  }
    
     
 void grab(){
    if (mouseX > px-l && mouseX < px+l && mouseY > py-l && mouseY < py+l){
    touched = true; 
    }
  }
  
  void stick() {
    if(mouseX+1< 1000 && mouseX-l > 0 && mouseY+l < 1000 && mouseY-l > 0){
      px = mouseX;
      py = mouseY;
    }
    else{
      drop();
    }

  } 
  
  void display(){
    for(int i = 0; i<100; i++){
    stroke(0,1,1-i/100);
   ellipse(1250+thx()*500/pi,750+thy()*500/pi,5,5);
    }
  }
  
  void drop(){
    touched = false;
  }
  
  
  
}
