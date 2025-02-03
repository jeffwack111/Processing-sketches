ArrayList<PART> thelist = new ArrayList<PART>();
ArrayList<int[]> collisions = new ArrayList<int[]>();
ArrayList<Float> times = new ArrayList<Float>();

void setup(){
  size(1000,1000);
  ellipseMode(CENTER);
  for(int j=0; j<20; j++){
    for(int k=0; k<20; k++){
      thelist.add(new PART(100+40*j,100+40*k,1,5));
    }
  }
}

void draw(){
  background(255);
  collisions.clear();
  times.clear();
  
  for(int k=0; k<thelist.size(); k++){ //display & move
    PART a = thelist.get(k);
    a.show();
  }
  
  for(int j=0; j<thelist.size(); j++){ //find collisions
    for(int k=j+1; k<thelist.size(); k++){
      PART a = thelist.get(j);
      PART b = thelist.get(k);
      
      float dx = a.getx() - b.getx();
      float dy = a.gety() - b.gety();
      float dr = sqrt(dx*dx+dy*dy);
      float R = a.getr()+b.getr();
      
      if(dr<R){
        int[] c = {j,k};
        
        float nx = dx/dr;
        float ny = dy/dr;
        float xnv = (-a.getvx()+b.getvx())*nx;//+-?
        float ynv = (-a.getvy()+b.getvy())*ny;
        float nv = xnv+ynv;
        float ct = (R-dr)/nv;
        times.add(copy(ct));//this is calculating numbers which are much too large sometimes. definitely something wrong here
        collisions.add(copy(c));
        
      }
    }
  }
  
  if(times.size()!=0){
    int maxindex = 0;  
    for(int j=1; j<times.size(); j++){ //select one collision to perform based on precedence
      if(times.get(maxindex)<times.get(j)){
        maxindex = j;
      }
    }
    println(times.get(maxindex));
    for(int k=0; k<thelist.size(); k++){//rewind to time of collision
      thelist.get(k).moveback(times.get(maxindex));
    }
    
    PART a = thelist.get(collisions.get(maxindex)[0]);
    PART b = thelist.get(collisions.get(maxindex)[1]);
    
    float ma = a.getm();
    float mb = b.getm();
    float rm = ma*mb/(ma+mb);
    
    float vx = a.getvx()-b.getvx();
    float vy = a.getvy()-b.getvy();
    
    float cmpx = rm*vx;
    float cmpy = rm*vy;
    float magcmp = sqrt(cmpx*cmpx+cmpy*cmpy);
    float ncmpx = cmpx/magcmp;
    float ncmpy = cmpy/magcmp;
      
    float dx = a.getx() - b.getx();
    float dy = a.gety() - b.gety();
    float magr = sqrt(dx*dx+dy*dy);
    float ndx = dx/magr;
    float ndy = dy/magr;
    
    float theta = acos(ndx*ncmpx+ndy*ncmpy);
    
    float newpx = cmpx*cos(theta) - cmpy*sin(theta);
    float newpy = cmpx*sin(theta) + cmpy*cos(theta);
    
    float avx = newpx/ma + (ma*a.getvx()+mb*b.getvx())/(ma+mb);
    float avy = newpy/ma + (ma*a.getvy()+mb*b.getvy())/(ma+mb);
    float bvx = -newpx/mb + (ma*a.getvx()+mb*b.getvx())/(ma+mb);
    float bvy = -newpy/mb + (ma*a.getvy()+mb*b.getvy())/(ma+mb);
    
    a.setvel(avx,avy);
    b.setvel(bvx,bvy);  
  }

for(int k=0; k<thelist.size(); k++){
  PART a = thelist.get(k);
  float r = a.getr();
  float x = a.getx();
  float y = a.gety();
  if(x>1000-r){
    float dt = (x+r-1000)/a.getvx();
    a.moveback(dt);
    a.vwall();
  }
  if(x<r){
    float dt = (x-r)/a.getvx();
    a.moveback(dt);
    a.vwall();
  }
  if(y>1000-r){
    float dt = (y+r-1000)/a.getvy();
    a.moveback(dt);
    a.hwall();
  }
  if(y<r){
    float dt = (y-r)/a.getvy();
    a.moveback(dt);
    a.hwall();
  }
  a.move(0.5);
}
    
    
  
  
  
}

float copy(float in){
  float out = in;
  return out;
}
 
int[] copy(int[] in){
  int[] out = new int[in.length];
  for(int i=0; i<in.length;i++){
    out[i] = in[i];
  }
  return out;
}
  
    
