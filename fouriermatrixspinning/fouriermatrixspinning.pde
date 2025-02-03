//replace fourier matrix approach with smoother spinning, keep frequency relationships

float pi = 3.141592653589793238462643383279;
int n = 1024;
int t = 1;

CXN w = new CXN(cos(2*pi/n),sin(2*pi/n));
CXN u = new CXN(1,0);
CXN F[][] = new CXN[n][n];

void setup(){
  
size(1000,1000);

for(int j=0; j<n; j++){
  CXN v = new CXN(1,0);
  for(int k=0; k<n; k++){
    F[j][k] = v;
    v = mul(u,v);
  }
  u = mul(u,w);
}

}

void draw(){
  
background(255);

int c = t%n;

for(int k=0; k<n; k++){
  F[c][k].plot(width/4+(2*k+1)*width/(4*n), height/2, 200);
}

delay(500);

t++;
  
}
