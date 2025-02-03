float x = 100;
float y = 300;


float[] X = {200, 500, 800};
float[] Y = {716.5063509, 283.4936491,716.5063509};

void setup(){
  size(1000,1000);
  background(255);
  fill(0);
  for(int i=0; i<X.length; i++){
    circle(X[i],Y[i],6);
  }
}

void draw(){
  for(int i=0; i<100; i++){
    int v = floor(random(X.length)); //pick a vertex
    x = (x+X[v])/2;
    y = (y+Y[v])/2;
    point(x,y);
  }
}
