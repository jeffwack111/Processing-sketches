import processing.pdf.*;

// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int dim = 25;


void setup() {
  noStroke();
  rectMode(CORNERS);
  size(1000,1000);
  grid = new Cell[dim][dim];
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
     
    long gcm = gcm(i+1,j+1);
    long a = (i+1) / gcm;
    long b = (j+1) / gcm;
    float pp = 255 - (a+b)*255/(i+j+2); //invert shading here
      
    grid[i][j] = new Cell((i)*1000/dim,(j)*1000/dim,1000/dim,1000/dim,pp);
    }
  }}
  
  void draw() {
  background(0);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid. 
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      grid[i][j].display();   
    }}

  }
  
    class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
  float x,y;   // x,y location
  float w,h;   // width and height
  float p; //brightness, 0-255

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempp) {
       
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    p = tempp;
  } 
      
  void display() {
   fill(p);
   rect(x,1000-y,x+w,1000-y-h); 
  }
}
  
long gcm(long a,long b){
 return b == 0 ? a : gcm(b, a % b);
}



    
