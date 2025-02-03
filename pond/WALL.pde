class WALL{
  boolean orient; //true=horizontal false=vertical
  int x;
  int y;
  int len;
  
  WALL(int tx, int ty, char o, int tlen){
    x = tx;
    y = ty;
    if(o=='h'){
      orient = true;
    }
    if(o=='v'){
      orient = false;
    }
    len = tlen;
  }
  
  void be(){
    fill(0);
    if(orient==true){
      for(int j=0; j<len; j++){
        pos[x+j][y] = 0;
        vel[x+j][y] = 0;
        rect(1000/n*(x+j),1000/n*y,1000/n,1000/n);
      }
    }
    if(orient==false){
      for(int j=0; j<len; j++){
        pos[x][y+j] = 0;
        vel[x][y+j] = 0;
        rect(1000/n*x,1000/n*(y+j),1000/n,1000/n);
      }
    }
      
  }
}
