//some constants
float pi = 3.141592653589793238462643383;
CXN i = new CXN(0,1);


float range = 1; //the edges of the graph will be range, irange, -range, -irange
int N = 50; //there will be N points distributed evenly through range; should be even for symmetry
float scale = 0.33;//fiddle with this to get the lengths in atan sweet spot
float len = 12;//max length is len*pi/2 

CXN[][] polya = new CXN[N][N];  
CXN V; //will hold the output during each plot step

//rotation stuff
float theta = 0.01;
CXN e = new CXN(0,0.1);
CXN w = new CXN(cos(theta),sin(theta));

void setup() {
  ellipseMode(CENTER);
  size(1000,1000);
  background(255);
  for (int j = 0; j < N; j++) {
    for (int k = 0; k < N; k++) {
     float n = j*2*range/N - range;
     float m = k*2*range/N - range;
     polya[j][k] = new CXN(n,m); //Initializes all of the domain points
    } 
  }
}  


void draw(){
  background(255);
 for (int j = 0; j < N; j++) {
  for (int k = 0; k < N; k++) {
   V = npole(polya[j][k],2);
   V.plot(polya[j][k]);
  }
 }
}
  
CXN npole(CXN A,int n){
  CXN V = new CXN(1,0);
  if(A.re()==0 && A.im()==0){
    return new CXN(0,0);
  }
  else{
    for(int k=0; k<n; k++){
      V = mul(V,A);
    }
  }
  return inv(V);
}

CXN neg(CXN A){
 return new CXN(-A.re(),-A.im()); 
}

CXN mul(CXN A, CXN B){
  float tempx = A.re()*B.re()-A.im()*B.im();
  float tempy = A.re()*B.im()+A.im()*B.re();
  return new CXN(tempx,tempy);
}

CXN inv(CXN A){
  float tempx = A.re()/(A.re()*A.re()+A.im()*A.im());
  float tempy = -A.im()/(A.re()*A.re()+A.im()*A.im());
  return new CXN(tempx,tempy);
}

CXN sum(CXN A, CXN B){
 float tempx = A.re()+B.re();
 float tempy = A.im()+B.im();
 return new CXN(tempx,tempy);
}
