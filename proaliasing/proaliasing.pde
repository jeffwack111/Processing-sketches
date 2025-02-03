FloatList points = new FloatList();
int t = 0;
float pi = 3.141592653589793238462643383;
int n=4;

void setup(){
  size(1000,1000);
  background(255);
  stroke(0);
  strokeWeight(4);
}

void draw(){
  background(255);
  for(int r=0;r<n;r++){
   t++;
   float y = sin(t*t*pi/100000*cos(t*pi/100000));  
     points.append(y);
  }
  
  for(int j=0; j<points.size(); j++){
    point(j,round(points.get(j)*50+500));
  }
  
  while(points.size()>1000){
    points.remove(0);
  }
 
}

void keyPressed(){
  
    
    
   if(key=='w'){
     n+=4;
     println(n);
   }
   else if(key=='q'&&n>5){
     n-=4;
  
  }
} 
    
