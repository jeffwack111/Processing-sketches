//make da shit rotate

float pi = 3.1415926535897932384626433832794;

float x = 0;
float y = 0;

float r = 480;
int n = 6;
 
float b = 0.3333333;
FloatList X = new FloatList();
FloatList Y = new FloatList();

void setup(){
  size(1000,1000);
  background(255);
  translate(500,500);
  scale(1,-1);
  fill(0);
  noStroke();

    for(int j=0; j<n; j++){
      X.append(r*sin(2*PI/n*j));
      Y.append(r*cos(2*PI/n*j));
    }
 
  X.append(0);
  Y.append(0);
  for(int i=0; i<X.size(); i++){
    fill(255,0,0);
    circle(X.get(i),Y.get(i),6);
  }
  stroke(1);
}

void draw(){
 translate(500,500);
  scale(1,-1);
  for(int i=0; i<1000; i++){
    int v = floor(random(X.size())); //pick a vertex
    x = b*(x-X.get(v))+X.get(v);
    y = b*(y-Y.get(v))+Y.get(v);
    point(x,y);
  }
}
