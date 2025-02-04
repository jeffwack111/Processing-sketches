import peasy.*;
PeasyCam camera;

float pi = 3.1415926535897932386;
int t = 0;

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;

ArrayList<BOP> history = new ArrayList();

int N = 80;

void setup(){
  size(1000,1000,P3D);
  camera = new PeasyCam(this, 500, 1000, 300, 200);
  camera.rotateZ(pi);
  strokeWeight(10);
  rectMode(CENTER);
  colorMode(HSB,1,1,1,1);
minim = new Minim(this);
song = minim.loadFile("Nate Smith - POCKET CHANGE.mp3");
song.play();
fft = new FFT(song.bufferSize(), song.sampleRate());

}

void draw(){
  
   fft.forward(song.mix);
   background(0,0,1);
   
   for(int i=0; i<history.size(); i++){
     history.get(i).transZ(-8);
   }
   
   
   for(int i=0; i<fft.specSize(); i++){
      history.add(new BOP(i*3,900,2,round(fft.getBand(i))));
   }
   
   for(int i=0; i<history.size(); i++){
     float k = i/fft.specSize();
   
       stroke(1,1,0,(k-N)/N+1);
     
     
     history.get(i).lin();
   }
   
   while(history.size()>N*fft.specSize()){
     history.remove(0);
   }

  t++;

}
