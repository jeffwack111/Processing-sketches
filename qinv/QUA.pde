class QUA{
  
  float a;
  float b;
  float c;
  float d;
  
  QUA(float ta, float tb, float tc, float td){
    a = ta;
    b = tb;
    c = tc;
    d = td;
  }
  
  float a(){
    return a;
  }
  
  float b(){
    return b;
  }
  
  float c(){
    return c;
  }
  
  float d(){
    return d;
  }
  
  float ma(){
    return sqrt(a*a+b*b+c*c+d*d);
  }
  
  void vplot(QUA L){
       
    float px = L.b()*width/(2*range)+width/2;
    float py = L.c()*height/(2*range)+height/2;
    float pz = L.d()*500/range;
    
    float dx = b/this.ma();
    float dy = c/this.ma();
    float dz = d/this.ma();
    
    float m = len*atan(scale*this.ma());
    
    stroke(m,0,0,m);
    
    strokeWeight(2);
    line(px, py, pz, px + m*dx, py + m*dy, pz + m*dz);
    strokeWeight(6);
    point(px + m*dx, py + m*dy, pz + m*dz);
           
  }
  
    void nozplot(QUA L){
       
    float px = L.b()*width/(2*range)+width/2;
    float py = L.c()*height/(2*range)+height/2;
    float pz = L.a()*500/range;
    
    float dx = -b/this.ma();
    float dy = -c/this.ma();
    float dz =  a/this.ma();
    
    float m = len*atan(scale*this.ma());
    
    stroke(m,0,0,m);
    
    line(px, py, pz, px + m*dx, py + m*dy, pz + m*dz);
           
  }
  
}

QUA mul(QUA one, QUA two){
  
  float s = one.a()*two.a() - one.b()*two.b() - one.c()*two.c() - one.d()*two.d();
  float i = one.a()*two.b() + one.b()*two.a() + one.c()*two.d() - one.d()*two.c();
  float j = one.a()*two.c() - one.b()*two.d() + one.c()*two.a() + one.d()*two.b();
  float k = one.a()*two.d() + one.b()*two.c() - one.c()*two.b() + one.d()*two.a();
  
  return new QUA(s,i,j,k);
  
}

QUA inv(QUA one){
  float s = one.a()*one.a() + one.b()*one.b() + one.c()*one.c() + one.d()*one.d();
  return new QUA(one.a()/s,-one.b()/s, -one.c()/s, -one.d/s);
}
