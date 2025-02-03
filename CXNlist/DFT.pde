CXN[][] FMatrix(int n) {

CXN w = new CXN(cos(2*pi/n),sin(2*pi/n));
CXN u = new CXN(1,0);
CXN F[][] = new CXN[n][n];

for(int j=0; j<n; j++){
  CXN v = new CXN(1,0);
  for(int k=0; k<n; k++){
    F[j][k] = sca(v,1/sqrt(n));  
    v = mul(u,v);
  }
  u = mul(u,w);
}
return F;
}

CXN[] MatMul(CXN[][] F, CXN[] S, int n){
  CXN[] T = new CXN[n]; 
  CXN H = new CXN(0,0);
  
 for(int j=0; j<n; j++){
  H.zero();
   for(int k=0; k<n; k++){
     H.plusequals(mul(F[j][k],S[k]));
   }
   T[j] = H.copy();
 }
  return T;
}

ArrayList<CXN> Ftrans(ArrayList<CXN> Sig){
  
  CXN[] S = new CXN[Sig.size()];
  for(int j=0; j<Sig.size(); j++){
    S[j] = Sig.get(j);
  }
  
  CXN[][] F = FMatrix(Sig.size());
  CXN[] T = MatMul(F,S,Sig.size());
  
  ArrayList<CXN> spec = new ArrayList<CXN>();
  for(int j=0; j<Sig.size(); j++){
     spec.add(sca(T[j],1/sqrt(Sig.size())));
  }
  return spec;
  
}
