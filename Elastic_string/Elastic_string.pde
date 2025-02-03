float pi = 3.141592653589793238462643383;
float pos[] = new float[1000];
float vel[] = new float[1000];
float t = 0;

void setup() { 
 size(1000,1000); 
 ellipseMode(CENTER);
frameRate(60);

for(int i=0; i<200; i++) {
  pos[i] = 200*sin(i*pi/200);
}

}


void draw() {
 translate(0,500);
 scale(1,-1);
 background(255);
 fill(0);
 
  for(int i = 1; i<999; i++) {
    ellipse(i,pos[i],2,2); //be
    vel[i] += ((pos[i-1]+pos[i+1])/2 - pos[i]) - 0.0001*vel[i]; //feel
  }
  
  for(int i = 1; i<999; i++) {
     pos[i] += vel[i]; //move
  }
  
  t++;  
  
 pos[0] = 0 ;//boundry conditions
 vel[0] = 0;
 pos[999] = 0;
 vel[999] = 0;

  
}

//trapezoid
  
//for(int i = 1; i<200; i++) {//initial conditions
 // pos[i] = i/2;
// } 
 //for(int i = 200; i<800; i++) {
 // pos[i] = 100;
// }
 //for(int i = 800; i<999; i++) {
 // pos[i] = 500-i/2;
// }

//lil wave

//for(int i=0; i<200; i++) {
 // pos[i] = 200*sin(i*pi/200);
//}
