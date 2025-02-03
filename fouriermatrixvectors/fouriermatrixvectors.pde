float pi = 3.141592653589793238462643383279;
int n = 32;

void setup(){
  size(1000,1000);
  
CXN w = new CXN(cos(2*pi/n),sin(2*pi/n));
CXN u = new CXN(1,0);
CXN F[][] = new CXN[n][n];

for(int j=0; j<n; j++){
  CXN v = new CXN(1,0);
for(int k=0; k<n; k++){
  F[j][k] = v;
  F[j][k].plot(j*1000/n,k*1000/n,1000/(2*n+3));
    v = mul(u,v);
}
u = mul(u,w);
}
}
