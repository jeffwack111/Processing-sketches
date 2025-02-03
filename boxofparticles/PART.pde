class PART{
  float x;
  float y;
  float vx;
  float vy;
  float m;
  float r;
  
  PART(float tx, float ty,float tm, float tr){
    m = tm;
    r = tr;
    x = tx;
    y = ty;
    vx = random(-1,1);
    vy = random(-1,1);
  }
  
  float getx(){
    return x;
  }
  
  float gety(){
    return y;
  }
  
  float getvx(){
    return vx;
  }
  
  float getvy(){
    return vy;
  }
  
  float getr(){
    return r;
  }
  
  float getm(){
    return m;
  }
  
  void show(){
    circle(x,y,2*r);
  }
  
  void move(float t){
    x += vx*t;
    y += vy*t;
  }
  
  void moveback(float t){
    x -= vx*t;
    y -= vy*t;
  }
  
  void setvel(float tvx, float tvy){
    vx = tvx;
    vy = tvy;
  }
  
  void vwall(){
    vx = -vx;
  }
  
  void hwall(){
    vy = -vy;
  }
  
}
