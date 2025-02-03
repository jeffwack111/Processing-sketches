float pi = 3.141592653589793238462643383;

int n = 250;
float pos[][] = new float[n][n];
float vel[][] = new float[n][n];
float mass[][] = new float[n][n]; //make it happen!!

float colormax = 1500;

boolean bound = false;

//WALL center = new WALL(125,50,'v',100);
//WALL top = new WALL(30,50,'h',60);
//WALL other = new WALL(140,150,'h',90);

int t = 0;

void setup() { 
 colorMode(HSB, colormax, 1, 1);
 size(1000,1000); 
frameRate(120);

for(int i = 0; i<n; i++) {
      for(int j = 0; j<n; j++){
        if(i>n/2){
          mass[i][j] = 0.75;
        }
        else{
          mass[i][j] = 0.5;
        }
      }
}

}


void draw() {
 noStroke();
 rectMode(CORNER);
 background(0,0,0.2);
 
 for(int i = 1; i<n-1; i++) {
   for(int j = 1; j<n-1; j++) {
     fill(pos[i][j]+colormax/2,1,1);
     rect(1000/n*i,1000/n*j,1000/n,1000/n); //be
     vel[i][j] += mass[i][j]*
                  (((pos[i-1][j]+pos[i+1][j])/2 - pos[i][j]) + //2nd partial x
                  ((pos[i][j-1]+pos[i][j+1])/2 - pos[i][j]) - //2nd partial y
                   0.01*vel[i][j]);                             //damping
   }
 }
 
   for(int i = 0; i<n; i++) {
      for(int j = 0; j<n; j++){
        pos[i][j] += vel[i][j]; //move
      }
    }
 
 for(int i = 1; i<n-1; i++){ //boundry conditions
   pos[0][i] = 0;//pos[1][i];   //top
   pos[n-1][i] = 0;//pos[n-2][i]; //bottom
   pos[i][0] = 0;//pos[i][1];   //left
   pos[i][n-1] = 0;//pos[i][n-2]; //right
   
   vel[0][i] =  0;//vel[1][i];   //top
   vel[n-1][i] = 0;//vel[n-2][i]; //bottom
   vel[i][0] = 0;//vel[i][1];   //left
   vel[i][n-1] = 0;//vel[i][n-2]; //right
 }
 
//pos[200][110] = 700*sin(float(t)/15);

//center.be();
//top.be();
//other.be();

t++;
}


  



  
void mouseClicked() {
  int i = int(mouseX*n/1000);
  int j = int(mouseY*n/1000);
  for (int u = -2; u < 2; u++){
    for(int v = -2; v < 2; v++){
      //if(i+u > 0 && i+u < n && j+v > 0 && j+v < n){
        vel[u+i][v+j] += 500;
     // }
    }
  }
}
       
      
      
      
  
