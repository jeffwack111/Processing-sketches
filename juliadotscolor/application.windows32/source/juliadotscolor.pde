float pi = 3.14159265358979323846264;
ArrayList<NODE> path = new ArrayList<NODE>(); 
int n = 12;
int t =0;

void setup(){
  size(1000,1000); 
  colorMode(HSB,255,255,255);
  strokeCap(ROUND);
}

void draw(){
background(255);
translate(500,500);
scale(-1,-1);
for(int b = 0; b<path.size(); b++){
  int g = floor(log(b+1)/log(2));
  stroke(255-255/n*g,255,255); 
  strokeWeight(20/float(g));
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

int twop(int s){
  int q = 1;
  for(int j=0;j<s;j++){
    q *= 2;
  }
  return q;
}
