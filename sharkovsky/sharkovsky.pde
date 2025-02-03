float[][] points = new float[1000][1000];

void setup(){
  size(1000,1000);
  stroke(0);
  fill(0);
  
  for(int i=0;i<1000;i++){
    for(int j=0;j<1000;j++){
      points[i][j] = j;
    }
  }
  
}

void draw(){
  background(255);
  translate(0,1000);
  scale(1,-1);
  for(int i=0;i<1000;i++){
    for(int j=0;j<1000;j++){
      point(i,points[i][j]);
      float z = points[i][j]/1000;
      float r = float(i)*0.0005+3.5;
      points[i][j] = 1000*r*z*(1-z);      
    }
  }
  //saveFrame("###.tif");
  
}
