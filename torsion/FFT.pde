CXN[] forward(FloatList amp){
  int p = amp.size();
  
  CXN[] out = new CXN[p];
  int l = logtwo(p);
  for(int j=0; j<p; j++){
    out[bitrev(j,l)] = new CXN(amp.get(j),0);
  }
  
  for(int s=0; s<l+1; s++){
    int m = twop(s);
    CXN wm = new CXN(cos(2*pi/m),-sin(2*pi/m));
    CXN t;
    CXN u;
    for(int k=0; k<p; k = k+m){
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
  int q = 1;
  for(int j=0;j<s;j++){
    q *= 2;
  }
  return q;
}
    
