import peasy.*;
PeasyCam camera;

int t = 0;
float pi = 3.141592653589793238462643383;

int N = 8;

float range = 1;

float lam = 8;
float f = 0.0325;

float scale = 1;//fiddle with this to get the lengths in atan sweet spot
float len = 60;//max length is len*pi/2 

QUA[][][] domain = new QUA[N][N][N];
QUA[][][] image = new QUA[N][N][N];

QUA I = new QUA(0,1,0,0);
QUA K = new QUA(0,0,0,1);

void setup(){
  size(1000,1000,P3D);
  camera = new PeasyCam(this, 500, 500, 0, 1000);
  colorMode(RGB,len*pi/2,1,1,len*pi/2);
  stroke(0);
  strokeWeight(2);
}

void draw(){
  
  background(len*pi/2,1,1);
  
  for(int j = 0; j < N; j++) {
    for(int k = 0; k < N; k++) {
      for(int l = 0; l < N; l++) {
        float n = j*2*range/N - range;
        float m = k*2*range/N - range;
        float p = l*2*range/N - range;
        float r = sqrt(n*n+m*m+p*p);
        domain[j][k][l] = new QUA(0,n,m,p);//Initializes all of the domain points
        QUA C = inv(domain[j][k][l]);
        
        QUA J = new QUA(0,cos(2*pi*r/lam-float(t)*f/(2*pi)),0,0);
        QUA D = mul(J,C);
        QUA E = mul(K,C);
        QUA S = mul(D,E);
        image[j][k][l] = mul(C,mul(J,domain[j][k][l]));
      } 
    }
  }

 for(int j = 0; j < N; j++) {
    for(int k = 0; k < N; k++) {
      for(int l = 0; l < N; l++) {
       image[j][k][l].vplot(domain[j][k][l]);
      }
    }
 }
 t++;
}
