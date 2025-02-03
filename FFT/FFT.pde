float pi = 3.141592653589793238462643383;
int N = 32;
CXN[] sin = new CXN[N];

void setup(){
  size(1000,1000);
  for(int j=0; j<N;j++){
    sin[j] = new CXN(sin(pi*j*2/N),0);
  }
  
  CXN[] trans = forward(sin);
  
  for(int j=0; j<N; j++){
    line(100+10*j,500,100+10*j,500-300*sin[j].ma());
    line(500+10*j,500,500+10*j,500-300*trans[j].ma());
  }
}

CXN[] forward(CXN[] input){
  CXN[] out = new CXN[input.length];
  int l = logtwo(input.length);
  for(int j=0; j<input.length; j++){
    println(bitrev(j,l));
    out[bitrev(j,l)] = input[j];
  }
  
  for(int s=0; s<l+1; s++){
    int m = twop(s);
    CXN wm = new CXN(cos(2*pi/m),-sin(2*pi/m));
    CXN t;
    CXN u;
    for(int k=0; k<input.length; k = k+m){
      CXN w = new CXN(1,0);
      for(int j=0; j<m/2; j++){
        t = mul(w,out[k+j+m/2]);
        u = out[k+j];
        out[k+j] = sum(u,t);
        out[k+j+m/2] = dif(u,t);
        w = mul(w,wm);
      }
    }
  }
  return out;
}
  


int logtwo(int N){
  int m = 0;
  while(N>1){
    N /= 2;
    m++;
  }
  return m;
}

int bitrev(int num, int n){
  int rev = 0;
  int d = 1 & num;
  rev |= d;
  for(int j=0;j<n-1;j++){
    rev = rev << 1;
    num = num >> 1;
    d = 1 & num;
    rev |= d;
  }
  return(rev);
}

int twop(int s){
  int n = 1;
  for(int j=0;j<s;j++){
    n *= 2;
  }
  return n;
}
    
