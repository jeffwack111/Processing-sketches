import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class juliadotscolor extends PApplet {

float pi = 3.14159265358979323846264f;
ArrayList<NODE> path = new ArrayList<NODE>(); 
int n = 12;
int t =0;

public void setup(){
   
  colorMode(HSB,255,255,255);
  strokeCap(ROUND);
}

public void draw(){
background(255);
translate(500,500);
scale(-1,-1);
for(int b = 0; b<path.size(); b++){
  int g = floor(log(b+1)/log(2));
  stroke(255-255/n*g,255,255); 
  strokeWeight(20/PApplet.parseFloat(g));
  path.get(b).show();
}
//float x = 300*sin(float(t)/51);
//float y = 300*sin(float(t)/50);
float x = 500-mouseX;
float y = 500-mouseY;
float ar = sqrt((x*x)+(y*y))/250;
float th = atan2(y,x);
path.clear();
path.add(new NODE(ar,th));
  for(int u=0; u<n; u++){
   int start = twop(u)-1;
   int end = twop(u+1)-1;
   for(int k=start; k<end; k++){
     NODE next = cop(path.get(k));
     next.transl(x/250,y/250);// <----------------Julia seed goes here (minus)
     NODE[] daughters = invsquare(next);
     path.add(daughters[0]);
     path.add(daughters[1]);
   }
  }


t++;
  

}

public int twop(int s){
  int q = 1;
  for(int j=0;j<s;j++){
    q *= 2;
  }
  return q;
}
class NODE{
  float r;
  float theta;
  
  NODE(float tr,float ttheta){
    r = tr;
    theta = ttheta;
  }
  
  public float getr(){
    return r;
  }
  
  public float gettheta(){
    return theta;
  }
  
  public void squareroot(){
    r = sqrt(r);
    theta = theta/2;
  }
  
  public void transl(float x, float y){
    float xp = r*cos(theta)+x;
    float yp = r*sin(theta)+y;
    r = sqrt((xp*xp)+(yp*yp));
    theta = atan2(yp,xp);
  }
  
  public void show(){
    point(r*250*cos(theta),r*250*sin(theta));
  }
  
  public boolean top(){
    float angle = theta;
    while(angle>2*pi){
      angle = angle-2*pi;
    }
    if(angle<0 || angle>pi){
      return false;
    }
    
    else{
      return true;
    }
  }
 
}

public NODE[] invsquare(NODE A){
  NODE[] B = new NODE[2];
  float newr = sqrt(A.getr());
  float newth = A.gettheta()/2;
  B[0] = new NODE(newr,newth);
  B[1] = new NODE(newr,newth+pi);
  return B;
}

public NODE cop(NODE A){
  float nr = A.getr();
  float ntheta = A.gettheta();
  return new NODE(nr, ntheta);
}
  public void settings() {  size(1000,1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "juliadotscolor" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
