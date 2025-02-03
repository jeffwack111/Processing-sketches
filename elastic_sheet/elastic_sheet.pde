float pi = 3.141592653589793238462643383;

int n = 200;
float pos[][] = new float[n][n];
float vel[][] = new float[n][n];

SLID Tx = new SLID(1200, 75, 200, 0.5, 1.2);
SLID Ty = new SLID(1200, 150, 200, 0.5, 1.2);

SLID Fa = new SLID(1200, 225, 200, 0, 0.5);
SLID Fb = new SLID(1200, 300, 200, 0, 0.5);

MIRR test = new MIRR(50,50,5);

float colormax = 500;

ArrayList<PVector> list = new ArrayList<PVector>();
int l = 500;

float t = 0;

boolean freeze = false;

void setup() { 
 colorMode(HSB, colormax, 1, 1, 1);
 size(1500,1000); 
frameRate(60);
textAlign(CENTER);
ellipseMode(CENTER);

for(int i=0; i<l; i++){
  list.add(new PVector(0,0));
}
  

}


void draw() {
  if(freeze == false){
     noStroke();
 fill(0,0,0.2);
 rect(500,500,1000,1000);
 rect(1250,250,500,500);
 rect(1250,750,500,500);
 rectMode(CORNER);
 for(int b=0; b<4; b++){
  for(int i = 1; i<n-1; i++) {
    for(int j = 1; j<n-1; j++) {
      float d = sqrt(float(i-n/2)*float(i-n/2)+float(j-n/2)*float(j-n/2)); //circular boundry
      if (d<n/2){ 
        fill(pos[i][j]+colormax/2,1,1);
        rect(1000/n*i,1000/n*j,1000/n,1000/n); //be
        vel[i][j] += Tx.val()*((pos[i-1][j]+pos[i+1][j])/2 - pos[i][j]) + //2nd partial x
                     Ty.val()*((pos[i][j-1]+pos[i][j+1])/2 - pos[i][j]) +  //2nd partial y
                     0.05*sin(t*pi*Fa.val()/10) +
                     0.05*sin(t*pi*Fb.val()/10) -                              //forcing
                     0.005*vel[i][j];                                     //damping
      }
    }           
  }
  
  for(int i = 0; i<n; i++) {
    for(int j = 0; j<n; j++){
      float d = sqrt(float(i-n/2)*float(i-n/2)+float(j-n/2)*float(j-n/2)); //circular boundry
      if (d<n/2){ 
      pos[i][j] += vel[i][j]; //move
      }
      else {
        pos[i][j] = 0;
        vel[i][j] = 0;
      }
    }
  }
  
  t++;
  
  test.feel(pos);
  
  list.add(new PVector(test.thx(),test.thy()));
  list.remove(0);
 } 
    

   if (Tx.touch() == true){
    Tx.stick();
  }
  
  if (Ty.touch() == true){
    Ty.stick();
  }
  
  if (Fa.touch() == true){
    Fa.stick();
  }
  
  if (Fb.touch() == true){
    Fb.stick();
  }
  
  if (test.touch() == true){
    test.stick();
  }
  
  rectMode(CENTER);
  stroke(0,0,1);
    
  Tx.display();
  Ty.display();
  Fa.display();
  Fb.display();
  
  fill(0,0,1); 
  textSize(25);
  
  text("x tension",1100,60);
  text(float(int(Tx.val()*1000))/1000, 1100, 90);
  
  text("y tension",1100,135);
  text(float(int(Ty.val()*1000))/1000, 1100, 165);
  
  text("frequency a",1100,210);
  text(float(int(Fa.val()*1000))/1000, 1100, 240);
  
  text("frequency b",1100,285);
  text(float(int(Fb.val()*1000))/1000, 1100, 315);
  
  fill(0,1,1);
  rect(1156, 380, 160, 40);
  rect(1342, 380, 160, 40);
  
  fill(0,0,1);
  text("reset sheet", 1156,390);
  text("scale color", 1342,390);
  
  noFill();
  strokeWeight(11);
  ellipse(500,500,1000,1000);
  
  stroke(0,0,0);
  strokeWeight(4);
  
  test.be();

  strokeWeight(6);
  for(int i = 0; i<l; i++){
   stroke(0,1,1,float(i)/float(l));
   ellipse(1250+list.get(i).x*500/pi,700+list.get(i).y*500/pi,5,5);
  }
  }
  
//if(t%10==0){
  //saveFrame("output####.png");
 //}
 
  
}
  
void mousePressed() {
  
  if(mouseX > 1076 && mouseX < 1236 && mouseY > 360 && mouseY < 400){
    for(int i = 0; i<n; i++) {
      for(int j = 0; j<n; j++){
        pos[i][j] = 0;
        vel[i][j] = 0;
      } 
    }
  }
    
  if(mouseX > 1262 && mouseX < 1422 && mouseY > 360 && mouseY < 400){
    float max = 0;
    for(int i = 0; i<n; i++) {
      for(int j = 0; j<n; j++){
        if(abs(pos[i][j]) > max){
        max = abs(pos[i][j]);
        }
      } 
    }
    colormax = 2*max;
 }
  
  Tx.grab();
  Ty.grab();
  Fa.grab();
  Fb.grab();
  test.grab();
}

void mouseReleased(){
  Tx.drop();
  Ty.drop();
  Fa.drop();
  Fb.drop();
  test.drop();
}

void keyPressed(){
  freeze = !freeze;
}
