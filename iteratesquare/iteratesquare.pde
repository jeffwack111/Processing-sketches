float range = 2;
CXN C = new CXN(-0.1,0.8);
int count = 1;
ArrayList<CXN>[][] iterates = new ArrayList[5][5];

void setup(){
  size(1000,1000);
  fill(0);
  
  for(int j=0; j<5;j++){
    for(int k=0; k<5; k++){
      iterates[j][k] = new ArrayList<CXN>();
    }
  }

  for(int j=0; j<5; j++){
    for(int k=0; k<5; k++){
    iterates[j][k].add(new CXN(0.17+j*0.015,0.15+k*0.015));
    }
  }
}

void draw(){
  background(255);
 for(int j=0; j<5; j++){
    for(int k=0; k<5; k++){
      for(int l=0; l<count; l++){
        iterates[j][k].get(l).plot();
      }
    }
 }
}

void keyPressed(){
  for(int j=0; j<5; j++){
    for(int k=0; k<5; k++){
      CXN Z = iterates[j][k].get(count-1);
      iterates[j][k].add(ad(mul(Z,Z),C));
    }
  }
  count++;
}
