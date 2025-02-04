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
int r=3;

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
                
                
TONE[][] grid1 = new TONE[12][r];
TONE[][] grid2 = new TONE[12][r];
TONE[][] grid3 = new TONE[12][r];
TONE[][] grid4 = new TONE[12][r];




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
    grid1[ii][jj-1] = new TONE(freq[ii]*two(jj), (2*ii+1)*width/48, height-(2*jj-1)*height/(4*r),s*jj); 
    grid2[ii][jj-1] = new TONE(freq[ii]*two(jj), (2*ii+1)*width/48+width/2, height-(2*jj-1)*height/(4*r),s*jj);
    grid3[ii][jj-1] = new TONE(freq[ii]*two(jj), (2*ii+1)*width/48, height-(2*jj-1)*height/(4*r)-height/2,s*jj); 
    grid4[ii][jj-1] = new TONE(freq[ii]*two(jj), (2*ii+1)*width/48+width/2, height-(2*jj-1)*height/(4*r)-height/2,s*jj); 
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
     grid1[ii][jj].listen(fft1);
     col[ii] += grid1[ii][jj].en();
     total += grid1[ii][jj].en();
     
     grid2[ii][jj].listen(fft2);
     col[ii] += grid2[ii][jj].en();
     total += grid2[ii][jj].en();
     
     grid3[ii][jj].listen(fft3);
     col[ii] += grid3[ii][jj].en();
     total += grid3[ii][jj].en();
     
     grid4[ii][jj].listen(fft4);
     col[ii] += grid4[ii][jj].en();
     total += grid4[ii][jj].en();
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
    grid1[ii][jj].del(); 
    grid2[ii][jj].del(); 
    grid3[ii][jj].del(); 
    grid4[ii][jj].del(); 
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
