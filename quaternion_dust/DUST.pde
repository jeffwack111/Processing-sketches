class DUST{
  QUA pos;
  
  DUST(QUA tpos){
    pos = tpos;
  }
  
  void flow(QUA dp){
    dp.sc(0.001);
    pos = vsum(pos,dp); 
  }
  
  QUA pos(){
    return pos;
  }
  
  void show(){
    point(pos.b()*500,pos.c()*500,pos.d()*500);
  }
}
