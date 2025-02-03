import peasy.*;
PeasyCam camera; 

int t = 0;
float pi = 3.141592653589793238462643383;

int N = 17; //total # of particle groups is N^3

float range = 1; //the particles span -range/2 -> range/2 centered at 0

ArrayList<DUST> dust = new ArrayList<DUST>();
ArrayList<QUA> func = new ArrayList<QUA>();

QUA I = new QUA(0,1,0,0);
QUA J = new QUA(0,0,1,0);
QUA K = new QUA(0,0,0,1);

void setup(){
  size(1000,1000,P3D);
  camera = new PeasyCam(this, 0, 0, 0, 1000); //this bad boy does so much work for free
  stroke(0);
  strokeWeight(2);
}

void draw(){
  
  background(255);
  
  if(t<8){ //I like making these lines of particles because you can see the speed of the flow by how much they stretch
  
  for(int j = 0; j < N; j++) {
    for(int k = 0; k < N; k++) {
      for(int l = 0; l < N; l++) {
        
        float n = (2*j+1)*range/(2*N) - range/2;
        float m = (2*k+1)*range/(2*N) - range/2;
        float p = (2*l+1)*range/(2*N) - range/2;
        
        dust.add(new DUST(new QUA(0,n,m,p)));
      } 
    }
  }
  }

 for(int q = 0; q < dust.size(); q++) {
   dust.get(q).show();
   
   QUA C = inv(dust.get(q).pos());
   QUA S = new QUA(1,0,0,0);
   
   func.clear(); //this is the function. I still don't fully understand how these work but you get good results adding more terms which alternate between C and unit quaternions I J and K. The exciting thing is that lots of these fuctions look like (are?) spherical harmonics
   
   func.add(C);
   func.add(K);
   func.add(C);
   
   

  
   
   for(int r=0; r<func.size(); r++){
     S = mul(S,func.get(r));
   }
   
   dust.get(q).flow(S); 
 
 }
   
 t++;
}
