int maxit = 100;
CXN C = new CXN(-0.1226,-0.744);
int ms = 1000;

void setup(){
  size(2000,1000);
  background(255);
  noStroke();
  colorMode(HSB,1,1,1);  
   for(int j=0; j<ms; j++){
     for(int k=0; k<ms; k++){
       CXN S = new CXN(float(j)*4/ms - 2, float(k)*4/ms - 2);
       CXN Z = new CXN(0,0);
       int h = 0;
       while(Z.ma()<2){
         Z = ad(mul(Z,Z),S);
         h++;
         if(h==maxit){
           fill(0,1,0);
            rect(j,k+(height-ms)/2,1,1); 
            break;
         }
       }
       if(h!=maxit){
         fill(float(h)/maxit,1,1);
         rect(j,k+(height-ms)/2,1,1);
       }
     }
   }        
         
}
    
void draw(){
   for(int j=0; j<1000; j++){
      for(int k=0; k<1000; k++){
        CXN Z = new CXN(float(j)/250 - 2, float(k)/250 - 2);
        int h = 0;
        while(Z.ma()<2){
          Z = ad(mul(Z,Z),C);
          h++;
          if(h==maxit){
            fill(0,1,0);
            rect(j+ms,k,1,1); 
            break;
          }
        }
        if(h!=maxit){
          fill(float(h)/maxit,1,1);
          rect(j+ms,k,1,1);
          }
        }
      }
}

void mousePressed(){
  if(mouseX < ms && mouseY > (height-ms)/2 && mouseY < (height+ms)/2){
    C = new CXN(float(mouseX)*4/ms - 2, float((height-ms)/2-mouseY)*4/ms + 2);
  }
}
