CXN SO2(int j, int t){
 if(j==0){
   return new CXN(1,0);
 }
 else{
   return new CXN(cos(2*pi*j*t/n),-sin(2*pi*j*t/n));
 }
}
