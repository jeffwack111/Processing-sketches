//some constants
float pi = 3.141592653589793238462643383;
CXN i = new CXN(0,1);
int t = 0;


float range = 1; //the edges of the graph will be range, irange, -range, -irange
int N = 100; //there will be N points distributed evenly through range; should be even for symmetry
float scale = 0.33;//fiddle with this to get the lengths in atan sweet spot

ArrayList<DUST> dust = new ArrayList<DUST>();

void setup() {
  ellipseMode(CENTER);
  size(1000,1000);
  background(255);
  fill(0);
  
  for (int j = 0; j < N; j++) {
    for (int k = 0; k < N; k++) {
     float n = j*4*range/(N)-2*range;
     float m = k*4*range/(N)-2*range;
     dust.add(new DUST(new CXN(n,m))); //Initializes all of the domain points
    } 
  }
}  


void draw(){
  background(255);
  line(0,0,1000,1000);
  line(0,1000,1000,0);
  
 
  
 for (int q = 0; q < dust.size(); q++) {
    dust.get(q).show();
    CXN P = dust.get(q).pos();
    CXN D = new CXN(0,1.1*cos(2*pi*t/400));
    dust.get(q).flow(mul(D,nbar(P)));
 }
 t++;
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
