import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;

float s=1;
int r=6;

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
                
                
TONE[][] grid = new TONE[12][r];




void setup(){
  size(1000,1000);

  colorMode(HSB,12,1,r*2);

minim = new Minim(this);
song = minim.loadFile("Legend.mp3");
song.play();

fft = new FFT(song.bufferSize(), song.sampleRate());

for(int ii=0; ii<12; ii++){
  for(int jj=1; jj<r+1; jj++){
    grid[ii][jj-1] = new TONE(freq[ii]*two(jj), (2*ii+1)*width/24, height-(2*jj-1)*height/(2*r),s*jj); 
  }
}


}

void draw(){
 background(0,0,2*r);
 fft.forward(song.mix);
 //text(fft.specSize(),100,100);
 
//for(int i=0; i<fft.specSize(); i++){
  //line(i, height/2 - fft.getBand(i)*5, i, height/2 + fft.getBand(i)*5);
//}
float[] col = {0,0,0,0,0,0,0,0,0,0,0,0};
float total = 0;
 
for(int ii=0; ii<12; ii++){
  for(int jj=0; jj<r; jj++){
     grid[ii][jj].listen();
     col[ii] += grid[ii][jj].en();
     total += grid[ii][jj].en();
  }
}

for(int ii=0; ii<12; ii++){
  col[ii] = 6*(col[ii] - total/12); //columns here
  rectMode(CORNER);
  fill(ii,1,2*r,col[ii]);
  rect(ii*width/12,0,width/12,height);
}

for(int ii=0; ii<12; ii++){
  for(int jj=0; jj<r; jj++){
    fill(ii,1,2*r);
    rectMode(CENTER);
    grid[ii][jj].del(); 
  }
}



}

void stop()
{
// always close Minim audio classes
song.close();
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
