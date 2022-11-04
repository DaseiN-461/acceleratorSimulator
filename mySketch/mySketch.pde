import processing.sound.*;

SoundFile file;

int vel = 0;
int ace = 0;
int step = 1;


int framerate = 5;
int counterLoop = 0;
int time = 0;
int timeWarning = 5;

int x_ace = 150;
int y_ace = 350;

int x_fre = 350;
int y_fre = 350;

int w_ace = 50;
int h_ace = 100;


void setup(){
  size(500,500);
  file = new SoundFile(this, "sample.mp3");
  frameRate(framerate);
}

void show_vel(){
   textSize(20);
   text("velocity",100,50);
   textSize(30);
   text(vel, 100, 80);
}

void aceleradorHandler(int time){
   //draw acelerator
   fill(0,100,0);
   rect(x_ace-(w_ace/2),y_ace-(h_ace/2),w_ace,h_ace);
   //draw brake
   fill(0,100,0);
   rect(x_fre-(w_ace/2),y_fre-(h_ace/2),w_ace,h_ace);
   
   if(mouseX>x_ace-(w_ace/2) && 
      mouseX<x_ace+(w_ace/2) &&
      mouseY>y_ace-(h_ace/2) &&
      mouseY<y_ace+(h_ace/2)){
     ace += step;
     vel += ace;
     
     //warning
     if(time>=timeWarning){
       fill(255,0,0);
       rect(x_ace-(w_ace/2),y_ace-(h_ace/2),w_ace,h_ace);
     }  
   }
   if(mouseX>x_fre-(w_ace/2) && 
      mouseX<x_fre+(w_ace/2) &&
      mouseY>y_fre-(h_ace/2) &&
      mouseY<y_fre+(h_ace/2)){
     fill(255,0,0);
     rect(x_fre-(w_ace/2),y_fre-(h_ace/2),w_ace,h_ace);
     
   }
   
     
}

void draw(){
   time = counterLoop/framerate;
   
   background(0);
   show_vel();
   
   
   aceleradorHandler(time);
   
   counterLoop += 1;
}
