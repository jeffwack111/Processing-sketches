float pi = 3.141592653589793238462643383;
float t = 0;
float k = 0.01;
float g = 0.01;

SLICE A = new SLICE(0);
SLICE B = new SLICE(0);

BEAM D = new BEAM(0);

void setup(){
  size(1250,1000);
  ellipseMode(CENTER);
  noFill();
}

void draw(){
  background(255);
  A.disp(375,500);
  B.disp(875,500);
  D.show(125,500);
  
  BEAM M = pass(D, pi/4, A.pos());
  M.show(625,500);
  BEAM E = pass(M, pi/4, B.pos());
  E.show(1125,500);
  A.feel(k*(B.pos()-A.pos())-g*A.vel());
  B.feel(k*(A.pos()-B.pos())-g*B.vel());
  
  if(mousePressed==false){
    A.move();
    B.move();
  }
  if(mousePressed==true){
    A.stick(375,500);
    B.move();
  }
}
