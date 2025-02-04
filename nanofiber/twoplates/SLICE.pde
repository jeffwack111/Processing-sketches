class SLICE{

float r;

FloatList theta = new FloatList();
float vel; //in rad/step

SLICE(float ttheta){
  r = 125;
  theta.append(ttheta);
  vel = 0;
}

void disp(int x, int y){
  strokeWeight(1);
  stroke(0,0,0);
  circle(x,y,2*r);
  stroke(255,0,0);
  strokeWeight(1);
  float thetan = theta.get(theta.size()-1);
  line(x-r*cos(thetan), y+r*sin(thetan), x+r*cos(thetan), y-r*sin(thetan));
  stroke(0,0,255);
  line(x-r*sin(thetan), y-r*cos(thetan), x+r*sin(thetan), y+r*cos(thetan));
 
}

void move(){
  theta.append(theta.get(theta.size()-1) + vel);
}

void feel(float twist){
  vel += twist;
}

float pos(){
  return theta.get(theta.size()-1);
}

float past(int t){
  if(t<=theta.size()){
  return theta.get(theta.size()-t);
  }
  else{
  return 0;
  }
}

float vel(){
  return vel;
}

void stick(int x, int y){
  theta.append(atan2(-y+mouseY,x-mouseX));
}

}

  
