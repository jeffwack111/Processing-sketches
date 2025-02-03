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
  
  void vplot(){
    
    float dx = b*300;
    float dy = c*300;
    float dz = d*300;
    
    stroke(0);
    strokeWeight(2);
    line(0, 0, 0,dy, -dz, dx);
    strokeWeight(6);
    stroke(255,0,0);
    point(dy, -dz, dx);
           
  }
  
  void pplot(){
    float dx = b*300;
    float dy = c*300;
    float dz = d*300;
    strokeWeight(6);
    stroke(255,0,0);
    point(dy, -dz, dx);
  }
}

QUA mul(QUA one, QUA two){
  
  float s = one.a()*two.a() - one.b()*two.b() - one.c()*two.c() - one.d()*two.d();
  float i = one.a()*two.b() + one.b()*two.a() + one.c()*two.d() - one.d()*two.c();
  float j = one.a()*two.c() - one.b()*two.d() + one.c()*two.a() + one.d()*two.b();
  float k = one.a()*two.d() + one.b()*two.c() - one.c()*two.b() + one.d()*two.a();
  
  return new QUA(s,i,j,k);
  
}
