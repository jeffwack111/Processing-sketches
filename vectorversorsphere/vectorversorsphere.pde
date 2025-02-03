import peasy.*;
PeasyCam camera;

int t = 0;
float pi = 3.141592653589793238462643383;

float T = 100;

float theta = pi/2;
float phi = pi/2;

QUA I = new QUA(0,1,0,0);
QUA J = new QUA(0,0,1,0);
QUA K = new QUA(0,0,0,1);

ArrayList<QUA> path = new ArrayList<QUA>();

void setup(){
  size(1000,1000,P3D);
  camera = new PeasyCam(this, 0, 0, 0, 1000);
  noFill();
  sphereDetail(20);
  textSize(100);
}

void draw(){  
  background(255);
  stroke(0);
  strokeWeight(0.5);
  sphere(300);
  line(-1000,0,0,1000,0,0);
  line(0,-1000,0,0,1000,0);
  line(0,0,-1000,0,0,1000);
  fill(0);
  text('i',0,0,300);
  text('j',300,0,0);
  text('k',0,-300,0);
  noFill();
  
  QUA A = new QUA(cos(t*pi/T),sin(t*pi/T)*sin(phi)*cos(theta),sin(t*pi/T)*sin(phi)*sin(theta),sin(t*pi/T)*cos(phi));
  QUA B = mul(J,A); 
  QUA C = mul(B,J);
  
  A.vplot();
  C.vplot();
  
  
  if(t<2*T){
  path.add(C);
  }
  
  for(int n=0;n<path.size();n++){
   // path.get(n).pplot();
  }
  t++;
}
  
