float pi = 3.141592653589793238462643383;
int t=0;

float Gdivro = 1;

SLID drivepower = new SLID(100, 300, 200, 0, 0.001);
SLID driveangle = new SLID(400, 300, 200, 0, pi);

FloatList graph = new FloatList(); 
FloatList full = new FloatList();

int[] hist = new int[100];
int count = 0;
int F = 2048;

float phi = pi/64;//phase differenc after each plate is 

int n = 33;
SLICE[] CYLIN = new SLICE[n];

ArrayList<BEAM> probe = new ArrayList<BEAM>();

void setup(){
  
 size(1600,1000);
 ellipseMode(CENTER);
 rectMode(CENTER);
 frameRate(60);
 textSize(30);
 fill(0,0,0);
 
 for(int j=0; j<n; j++){
   CYLIN[j] = new SLICE(pi/2);//+sin(2*pi*j/64));
 }
 
}

void draw(){

  background(255);
  
  drivepower.display();
  text("drive power",100,350);
  text(drivepower.val(),100,400);
  
  driveangle.display();
  text("drive angle", 400, 350);
  line(500-100*cos(driveangle.val()),450-100*sin(driveangle.val()),500+100*cos(driveangle.val()),450+100*sin(driveangle.val()));
  
  for(int j=0; j<n; j++){
    CYLIN[j].disp(round((1000*(2*j+1))/(2*n)),150); //BE
  }
  
  for(int k=1; k<n-1; k++){
    float shear = ((CYLIN[k-1].pos()+CYLIN[k+1].pos())/2 - CYLIN[k].pos())*Gdivro; //FEEL
    float drive = drivepower.val()*sin(2*(CYLIN[k].pos()-driveangle.val()));
    float diss = -0.001*CYLIN[k].vel();
    float kick = random(-0.001,0.001);
    CYLIN[k].feel(shear+kick+drive+diss);
  }
  
  for(int j=0; j<n; j++){ //MOVE
    CYLIN[j].move();
  }
  
  //if(mousePressed == true){
  //CYLIN[0].stick();
  //}
  
   BEAM in = new BEAM(0);
   in.show(1350,100);
   text("probe in",1000,100);
   
  for(int j=0; j<n; j++){
     in = pass(in, phi, CYLIN[j].pos());
  }
  in.show(1350,250);
  text("fiber", 1000,250);
  
  in = pass(in,pi,pi/8);
  in.show(1350,500);
  text("lambda/2", 1000,500);

  line(1350,500,1350+200*in.X.ma(),500);
  line(1350+200*in.X.ma(),500,1350+200*in.X.ma(),500-200*in.Y.ma());

  
 full.append(in.X.ma()-in.Y.ma());
 graph.append(in.X.ma()-in.Y.ma());
  
  if(graph.size() > 1000){
    graph.remove(0);
  }
  
  if(full.size() > F){
    full.remove(0);
  }

  strokeWeight(1);
  for(int j=0; j<graph.size(); j++){
    point(j,600-graph.get(j)*100);
  }
  text("balance detector", 350, 700);
  
  CXN[] spec = new CXN[F];
  if(full.size() == F){
    spec = forward(full);
    //tseries.append(spec[7]);
    int index = floor(spec[23].ma());
    if(index>99){
      index = 99;
    }
    hist[index]++;
    count++;
    
    if(count!=0){
    strokeWeight(3);
  for(int j=0;j<hist.length;j++){
    line(1100+j*3,900,1100+j*3,900-5000*hist[j]/count);
  }
  }
  text("histogram of time series", 1100,950);
    
    for(int j=0; j<F; j++){
      if(j==23){
        stroke(0,255,0);
      }
      else{
        stroke(255,0,0);
      }
      line(j*3,height-10,j*3,height-10-spec[j].ma()*spec[j].ma()/4);
    }
  
  }
  
  
  
  
  if(driveangle.touch() == true){
    driveangle.stick();
  }
  if(drivepower.touch() == true){
    drivepower.stick();
  }
  
  t++;
}


void mousePressed() {
  driveangle.grab();
  drivepower.grab();
}

void mouseReleased(){
  driveangle.drop();
  drivepower.drop();
}

void keyPressed(){
  for(int j=0; j<n; j++){
    CYLIN[j].freeze();
  }
}
