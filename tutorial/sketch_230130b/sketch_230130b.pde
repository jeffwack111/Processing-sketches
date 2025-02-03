int frame = 0;

void setup(){
  size(1000,1000);
}

void draw(){
  background(255,0,0);
  rect(mouseX,mouseY,100,100);
  frame++;
}
