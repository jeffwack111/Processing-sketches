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
  
  void sc(float s){
    a = a*s;
    b = b*s;
    c = c*s;
    d = d*s;
  }
  
  QUA bar(){
   return new QUA(a,-b,-c,-d);
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

QUA vsum(QUA one, QUA two){
  return new QUA(0, one.b()+two.b(), one.c()+two.c(), one.d()+two.d());
}
