 SLID test = new SLID (500,500,300,20,60);

void setup(){
 rectMode(CENTER);
 fill(255,0,0);
 size (1000,1000);
}

void draw(){
  background(255);
  if(test.touch() == true){
    test.stick();
  }
  test.display();
}



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
  
  boolean touch() {
    return touched;
  }
  
  void grab(){
    if (mouseX > start && mouseX < start+len && mouseY > y-10 && mouseY < y+10){
    touched = true; 
    }
  }
  
  void drop(){
    touched = false;
  }
  
  void display() {
    line(start,y,start+len,y);
    rect(value*s + c, y, 10, 20);
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

void mousePressed() {
  test.grab();
}

void mouseReleased() {
  test.drop();
}
