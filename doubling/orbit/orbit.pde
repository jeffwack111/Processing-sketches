float phi = 2/(1+sqrt(5));
float R = 250;
float r = 30;

int frame = 0;
int frames_per_trip = 25;
int trip = 13;

PGraphics img;

void setup(){
  size(1000,1000);
  img = createGraphics(width, height);
  img.beginDraw();
  img.clear();
  img.translate(500,500);
  img.scale(1,-1);
  img.noFill();
  img.strokeWeight(3);
  img.circle(0,0,2*R);
  img.save("A_CIRCLE.png");
  //noStroke();
  
}

void draw(){
 img.beginDraw();
 img.clear();
 img.translate(500,500);
 img.scale(1,-1);
 img.strokeWeight(3);
 
 float trip_progress = smoothstep(float(frame%frames_per_trip)/float(frames_per_trip));
 
 float origin_angle = phi;
 float destination_angle = (phi*2)%1;
 
 float origin_x = R*cos(2*PI*origin_angle);
 float origin_y = R*sin(2*PI*origin_angle);
 
 float destination_x = R*cos(2*PI*destination_angle);
 float destination_y = R*sin(2*PI*destination_angle);
 
 float x = trip_progress*destination_x + (1-trip_progress)*origin_x;
 float y = trip_progress*destination_y + (1-trip_progress)*origin_y;
 
 if(y>0){
   img.fill(95, 21, 148);
 }
 else{
   img.fill(36, 122, 17);
 }
 img.circle(x,y,r); 
 
 frame+=1;
 
 if(frame==frames_per_trip){
   frame = 0;
   phi = (phi*2)%1;
   trip += 1;
 }
 
 img.endDraw();
 if(trip<12){
   int F = frame+trip*frames_per_trip;
   img.save("frame"+F+".png"); 
 }
 
}

float smoothstep(float t){
  if (t<0){
    return 0;
  }
  else if (t<1){
    return 3*t*t - 2*t*t*t;
  }
  else{
    return 1;
  }
}
