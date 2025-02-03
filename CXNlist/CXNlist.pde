float pi = 3.14159253589793238462643383;

ArrayList<CXN> list = new ArrayList<CXN>();
ArrayList<CXN> spec = new ArrayList<CXN>();
ArrayList<CXN> path = new ArrayList<CXN>();

int t = 0;

PGraphics lines;

int n = 1500;

void setup(){
  size(1000,1000);
  fill(255,0,0);
  colorMode(HSB,2);
  lines = createGraphics(1000,1000);
}

void draw(){ 
  background(0,0,2);
  CXN P = new CXN(0,0);
  lines = createGraphics(1000,1000);
  for(int j=0; j<list.size(); j++){
    
    list.get(j).plot();
    CXN H = new CXN(0,0);
    
    int k = (j+1)/2;
    int r = j%2;
    
    if(k==0){
      H = spec.get(k);
    }
    
    if(r==1){
      H = mul(SO2(k, t),spec.get(k));
    }
    
    if(r==0 && k!=0){
      H = mul(bar(SO2(k,t)), spec.get(spec.size()-k));
    }

   if(j != 0){
    lines.beginDraw();
    lines.strokeWeight(3);
    lines.line(P.re(), P.im(), P.re()+H.re(), P.im()+H.im());
    lines.endDraw();
    }
    
    P.plusequals(H); 
    
   }
   
  if(t>n){
     path.remove(0);
   }
   
   path.add(P);
   
   
  
   for(int j=0; j<path.size(); j++){
     fill(sin(j*2*pi/path.size())+1,2,2);
     path.get(j).poi();
   }
   

    image(lines,0,0);
  
   
   
  t++;
}

void mousePressed(){
 list.add(new CXN(mouseX, mouseY));
 spec = Ftrans(list);
 path.clear();
 lines = createGraphics(1000,1000);
 t = 0;
}

void keyPressed(){
  if(key==32){
    list.clear();
    path.clear();
    lines = createGraphics(1000,1000);
    t = 0;
  }
}
