SLID Lamb = new SLID(50, 600, 400, -100, 100);

void setup(){
  ellipseMode(CENTER);
  rectMode(CENTER);
  size(500,700);
}

void draw(){
  background(255);
  line(0,250,500,250);
  ellipse(250,250,4,4);
  Lamb.display();
   
 for(int i=0; i<500; i++){
   float x = float(i)/10 - 25;
   float y = Lamb.val()*x-x*x*x;
   point(i, round(250-y));
 }
 
 if(Lamb.touch() == true){
   Lamb.stick();
 }

}

void mousePressed(){
  Lamb.grab();
}

void mouseReleased(){
  Lamb.drop();
}
