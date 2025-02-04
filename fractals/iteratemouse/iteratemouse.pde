float range = 2;
CXN C = new CXN(0,0);
int count = 1;
ArrayList<CXN> iterates = new ArrayList<CXN>();

void setup(){
  size(1000,1000);
  fill(0);
}

void draw(){
  background(255);
  iterates.clear();
  iterates.add(new CXN(mouseX*range/500 - range, -mouseY*range/500 + range));
  for(int n=0; n<500; n++){
   CXN Z = iterates.get(n);
   iterates.add(ad(mul(Z,Z),C));
   iterates.get(n).plot();
  }
}
