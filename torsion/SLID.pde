class SLID{
  
  int y;
  int start;
  int len;
  
  float value;
  float max;
  float min;
  float c;
  float s;
  
  boolean touched;
  
  SLID (int tstart, int ty, int tlen, float tmin, float tmax) {
    y = ty;
    start = tstart;
    len = tlen;
    min = tmin;
    max = tmax;
  
    value = tmin;
    touched = false;
    
    c = tstart - tmin*tlen/(tmax - tmin);
    s = tlen/(tmax-tmin);
  }
  
  float val(){
    return value;
  }
  
  boolean touch() {
    return touched;
  }
  
  void grab(){
    if (mouseX > start-10 && mouseX < start+len+10 && mouseY > y-20 && mouseY < y+20){
    touched = true; 
    }
  }
  
  void drop(){
    touched = false;
  }
  
  void display() {
    strokeWeight(8);
    fill(0,1,1);
    line(start,y,start+len,y);
    strokeWeight(2);
    rect(value*s + c, y, 10, 30);
  }
  
  void stick() {
    if(mouseX > start && mouseX < start+len){
      value = (mouseX-start)/s +min;
    }
    if(mouseX < start){
      value = min;
    }
    if(mouseX > start + len){
      value = max; 
    }
  } 
  
}
