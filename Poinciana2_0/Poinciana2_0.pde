import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;

FFT fft1;
FFT fft2;
FFT fft3;
FFT fft4;

float s=1;
int r=4;

float pi = 3.141592653589793238462643383279;

float[] freq = {65.41,
                69.3,
                73.42,
                77.78,
                82.41,
                87.31,
                92.5,
                98,
                103.83,
                110,
                116.54,
                123.47};           
                
                
TONE[][] flower1 = new TONE[12][r];
TONE[][] flower2 = new TONE[12][r];
TONE[][] flower3 = new TONE[12][r];
TONE[][] flower4 = new TONE[12][r];




void setup(){
  size(1000,1000);

  colorMode(HSB,12,1,r*2,1);

minim = new Minim(this);

song1 = minim.loadFile("Vulfpeck - Poinciana - 01 Part 1 88BPM.mp3");
song2 = minim.loadFile("Vulfpeck - Poinciana - 02 Part 2 88BPM.mp3");
song3 = minim.loadFile("Vulfpeck - Poinciana - 03 Part 3 88BPM.mp3");
song4 = minim.loadFile("Vulfpeck - Poinciana - 04 Part 4 88BPM.mp3");

song1.play();
song2.play();
song3.play();
song4.play();

fft1 = new FFT(song1.bufferSize(), song1.sampleRate());
fft2 = new FFT(song2.bufferSize(), song2.sampleRate());
fft3 = new FFT(song3.bufferSize(), song3.sampleRate());
fft4 = new FFT(song4.bufferSize(), song4.sampleRate());



for(int ii=0; ii<12; ii++){
  for(int jj=1; jj<r+1; jj++){
    flower1[ii][jj-1] = new TONE(freq[ii]*two(jj), round(width/4+50*jj*cos(2*pi*ii/12)), round(height/4-50*jj*sin(2*pi*ii/12)),s*jj);
    flower2[ii][jj-1] = new TONE(freq[ii]*two(jj), round(width/4+width/2+50*jj*cos(2*pi*ii/12)), round(height/4-50*jj*sin(2*pi*ii/12)),s*jj); 
    flower3[ii][jj-1] = new TONE(freq[ii]*two(jj), round(width/4+50*jj*cos(2*pi*ii/12)), round(height/4+height/2-50*jj*sin(2*pi*ii/12)),s*jj); 
    flower4[ii][jj-1] = new TONE(freq[ii]*two(jj), round(width/4+width/2+50*jj*cos(2*pi*ii/12)), round(height/4+height/2-50*jj*sin(2*pi*ii/12)),s*jj); 
  }
}


}

void draw(){
 background(0,0,2*r);
 fft1.forward(song1.mix);
 fft2.forward(song2.mix);
 fft3.forward(song3.mix);
 fft4.forward(song4.mix);
 //text(fft.specSize(),100,100);
 
//for(int i=0; i<fft.specSize(); i++){
  //line(i, height/2 - fft.getBand(i)*5, i, height/2 + fft.getBand(i)*5);
//}
float[] col = {0,0,0,0,0,0,0,0,0,0,0,0};
float total = 0;
 
for(int ii=0; ii<12; ii++){
  for(int jj=0; jj<r; jj++){
    flower1[ii][jj].listen(fft1);
     col[ii] += flower1[ii][jj].en();
     total += flower1[ii][jj].en();
     
     flower2[ii][jj].listen(fft2);
     col[ii] += flower2[ii][jj].en();
     total += flower2[ii][jj].en();
     
     flower3[ii][jj].listen(fft3);
     col[ii] += flower3[ii][jj].en();
     total += flower3[ii][jj].en();
     
     flower4[ii][jj].listen(fft4);
     col[ii] += flower4[ii][jj].en();
     total += flower4[ii][jj].en();
     
   
  }
}

for(int ii=0; ii<12; ii++){
  if(col[ii] - total/12 > 0){
  col[ii] = 3*(col[ii] - total/12);
  }
  else{
  col[ii] = 0;
  }
  rectMode(CORNER);
  fill(ii,1,2*r,col[ii]);
 // rect(ii*width/12,0,width/12,height);
}

for(int ii=0; ii<12; ii++){
  for(int jj=0; jj<r; jj++){
    fill(ii,1,2*r,0.25);
    rectMode(CENTER);
    flower1[ii][jj].dbox(); 
    flower2[ii][jj].dbox(); 
    flower3[ii][jj].dbox(); 
    flower4[ii][jj].dbox(); 
  }
}

//saveFrame("####.tga");

}

void stop()
{
// always close Minim audio classes
song1.close();
song2.close();
song3.close();
song4.close();
// always stop Minim before exiting
minim.stop();
// The super.stop() makes sure that all the normal cleanup routines are done
super.stop();
}

int two(int n){
 if(n==0){
   return 1;
 }
 else{
   int p = 1;
  for(int i=0; i<n; i++){
    p = p*2;
  }
  return p;
 }
}
