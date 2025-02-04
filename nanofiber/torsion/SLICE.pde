class SLICE{

float r;

float theta;
float vel; //in rad/step

SLICE(float ttheta){
  r = 50;
  theta = ttheta;
  vel = 0;
}

void disp(int x, int y){
  stroke(255,0,0);
  strokeWeight(1);
  line(x-r*cos(theta), y+r*sin(theta), x+r*cos(theta), y-r*sin(theta));
}

void move(){
  theta += vel;
}

void feel(float twist){
  vel += twist;
}

float pos(){
  return theta;
}

float vel(){
  return vel;
}

void stick(){
  theta = atan2(500-mouseY,mouseX)/2+pi/2;
}

void freeze(){
  theta = pi/2;
  vel = 0;
}

}

  
