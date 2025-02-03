float pi = 3.141592653589793238462643383;
float range = 2;

void setup(){
  size(1000,1000);
  background(255);
  colorMode(HSB,255,255,255);
  
  long[] w = {1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L};
  
  ArrayList<Long> G = gleason(2);
  ArrayList<Long> dG = deri(G);
  prin(G);
  println("break");
  CXN v = eval(G,new CXN(-3,3));
  v.prin();
  
  CXN[][] root = new CXN[1000][1000];
  for(int j=0; j<1000; j++){
    for(int k=0; k<1000; k++){
      CXN P = new CXN(float(j)*range/500 - range, float(k)*range/500 - range);
      for(int l=0; l<10000; l++){
        CXN nP = newton(G, dG, P);
        if(distsq(P,nP)<0.0001){
          break;
        }
        P = nP;
      }
      root[j][k] = P;
      stroke(255/(2*pi)*(root[j][k].pha()+pi),255*root[j][k].ma(),255);
      point(j,k);
    }
  }
 // saveFrame("gleasonseven.png");
}

ArrayList<Long> squa(ArrayList<Long> coef){
    ArrayList<Long> out = new ArrayList<Long>(2*coef.size());
    for(int j=0; j<2*coef.size()-1; j++){
      long p = 0L;
      for(int k=0; k<j+1; k++){
        if(k<coef.size()&&j-k<coef.size()){
        p += coef.get(k)*coef.get(j-k);
        }
      }
      out.add(p);
    }
    return out;
}

ArrayList<Long> deri(ArrayList<Long> coef){
   ArrayList<Long> out = new ArrayList<Long>(coef.size()-1);
   for(int j=0; j<coef.size()-1; j++){
     out.add((j+1)*coef.get(j+1));
   }
   return out;
}

CXN eval(ArrayList<Long> coef, CXN Z){
  CXN out = new CXN(0,0);
  for(int j=0; j<coef.size(); j++){
    out.plusequals(sca(coef.get(j),power(Z,j)));
  }
  return out;
}

CXN newton(ArrayList<Long> f, ArrayList<Long> df, CXN Z){
  CXN out = Z.copy();
  out.plusequals(minus(mul(eval(f,Z),inv(eval(df,Z)))));
  return out;
}

ArrayList<Long> tolist(long[] nums){
  ArrayList<Long> out = new ArrayList<Long>();
  for(int j=0; j<nums.length; j++){
    out.add(nums[j]);
  }
  return out;
}

ArrayList<Long> rawgleason(int n){ 
  ArrayList<Long> out = new ArrayList<Long>();
  out.add(0L);
  out.add(1L);
  for(int j=0; j<n-1; j++){
    out = squa(out);
    out.set(1,out.get(1)+1);
  }
  while(out.get(0)==0){
    out.remove(0);
  }
  return out;
}

void prin(ArrayList<Long> A){
  for(int j=0; j<A.size(); j++){
    println(A.get(j));
  }
}

ArrayList<Long> ad(ArrayList<Long> A, ArrayList<Long> B){
  ArrayList<Long> sum = new ArrayList<Long>();
  for(int j=0; j<min(A.size(),B.size()); j++){
    sum.add(A.get(j)+B.get(j));
  }
  if(A.size()>B.size()){
    for(int j=B.size(); j<A.size(); j++){
      sum.add(A.get(j));
    }
  }
  if(B.size()>A.size()){
    for(int j=A.size(); j<B.size(); j++){
      sum.add(B.get(j));
    }
  }
  return sum;
}

ArrayList<Integer> bfactor(int num){
  ArrayList<Integer> list = new ArrayList<Integer>();
  for(int j=2; j<num/2+1; j++){
    if(num%j == 0){
      list.add(j);
    }
    for(int k=0; k<list.size()-1; k++){
      if(list.get(list.size()-1)%list.get(k)==0){
        list.remove(k);
      }
    }
  }
  return list;
}

ArrayList<Long> mul(long s, ArrayList<Long> A){
  ArrayList<Long> out = new ArrayList<Long>();
  for(int j=0; j<A.size(); j++){
    out.add(A.get(j)*s);
  } 
  return out;
}
    

ArrayList<Long> divi(ArrayList<Long> big, ArrayList<Long> small){ //NO remainder!
  ArrayList<Long> quotient = new ArrayList<Long>();              
  for(int i=0; i<big.size()-small.size()+1; i++){
      long m = big.get(big.size()-i-1)/small.get(small.size()-1);
      quotient.add(0,m);
      ArrayList<Long> sub = mul(-m,small);
      for(int j=0; j<order(big)-small.size()+1; j++){
        sub.add(0,0L);
      }
      big = ad(sub,big);
  }
  return quotient;
}

ArrayList<Long> gleason(int k){
  ArrayList<Integer> divisors = bfactor(k);
  ArrayList<Long> out = rawgleason(k);
  for(int j=0; j<divisors.size(); j++){
   /* println("glea");
    prin(out);
    println("divi");
    prin(rawgleason(divisors.get(j)));
    println("enddivi");*/
    out = divi(out,rawgleason(divisors.get(j)));
  }
  return out;
}
    
boolean iszero(ArrayList<Long> A){
  for(int j=0; j<A.size(); j++){
    if(A.get(j) != 0){
      return false;
    }
  }
  return true;
}

float leading(ArrayList<Long> A){
  for(int j=A.size()-1; j>-1; j--){
    if(A.get(j) != 0){
      return A.get(j);
    }
  }
  return 0;
}

int order(ArrayList<Long> A){
  for(int j=A.size()-1; j>-1; j--){
    if(A.get(j) != 0){
      return j;
    }
  }
  return -1;
}
