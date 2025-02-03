float pi = 3.141592653589793238462643383;
int maxit = 50;
CXN C = new CXN(0,0);
int ms = 1000;

void setup(){
  size(2000,1000);
  background(255);
  noStroke();
  colorMode(HSB);  
   for(int j=0; j<ms; j++){
     for(int k=0; k<ms; k++){
       CXN S = new CXN(float(j)*4/ms - 2, float(k)*4/ms - 2);
       CXN Z = new CXN(0,0);
      for(int h=0; h<maxit; h++){
         Z = inv(ad(mul(Z,Z),S));
      
         stroke(255/(2*pi)*(Z.pha()+pi),255*Z.ma(),255);
         point(j,k+(height-ms)/2);
       }
     }
   }        
         
}
    
void draw(){
   for(int j=0; j<1000; j++){
      for(int k=0; k<1000; k++){
        CXN Z = new CXN(float(j)/250 - 2, float(k)/250 - 2);
        for(int h=0; h<maxit; h++){
          Z = inv(ad(mul(Z,Z),C));
        }
         
          
       
          stroke(255/(2*pi)*(Z.pha()+pi),255*Z.ma(),255);
          point(j+ms,k);
          }
        }
     
}

void mousePressed(){
  if(mouseX < ms && mouseY > (height-ms)/2 && mouseY < (height+ms)/2){
    C = new CXN(float(mouseX)*4/ms - 2, float((height-ms)/2-mouseY)*4/ms + 2);
  }
}
