float r = 200;
float thetap = 0;
float thetae = 0;
float pyth = 1.5;
float equal = 1.05946309436;
int countp = 0;
int counte = 0;
String[] notes = {"C","C#/Db","D","D#/Eb","E","F","F#/Gb","G","G#/Ab","A","A#/Bb","B"};



void setup(){
size(1200,700);
ellipse(width/4,height/2,r,r);
ellipse(3*width/4,height/2,r,r);
textAlign(CENTER);
textSize(60);
fill(0,0,0);
text("Pythagorean tuning",width/4,75);
text("Equal temperment",3*width/4,75);
textSize(30);
fill(255,0,0);
}

void draw(){
 line(width/4,height/2,width/4+r*cos(thetap),height/2-r*sin(thetap));
 text(notes[countp%12],width/4+(r+5)*cos(thetap),height/2-(r+5)*sin(thetap));
 thetap+=(log(pyth)*2*PI)/log(2);
 countp+=7;
 
 line(3*width/4,height/2,3*width/4+r*cos(thetae),height/2-r*sin(thetae));
 text(notes[counte%12],3*width/4+(r+5)*cos(thetae),height/2-(r+5)*sin(thetae));
 thetae+=(log(equal)*2*PI)/log(2);
 counte+=1;
 saveFrame("tuningwheels_####.png");
 delay(100);
}

void mousePressed() {
 

}
