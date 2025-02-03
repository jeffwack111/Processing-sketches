class DUST{
  CXN pos;
  
  DUST(CXN tpos){
    pos = tpos;
  }
  
  void flow(CXN dp){
    dp.sc(0.01);
    pos = sum(pos,dp);
  }
  
  CXN pos(){
    return pos;
  }
  
  void show(){
    float px = 500 + pos.re()*500/range;
    float py = 500 - pos.im()*500/range;
    ellipse(px,py,4,4);
  }
}
