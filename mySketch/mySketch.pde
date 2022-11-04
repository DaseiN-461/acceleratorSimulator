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
   fill(0,0,255);
   textSize(20);
   text("velocity",100,50);
   textSize(30);
   text(vel, 100, 80);
   textSize(20);
   text("acceleration",100,100);
   textSize(30);
   text(ace, 100,130);
}

void draw_pedals(){
  //draw acelerator
   fill(0,100,0);
   rect(x_ace-(w_ace/2),y_ace-(h_ace/2),w_ace,h_ace);
   //draw brake
   fill(0,100,0);
   rect(x_fre-(w_ace/2),y_fre-(h_ace/2),w_ace,h_ace);
}

int aceleradorHandler(int time){
   draw_pedals();
   
   if(mouseX>x_ace-(w_ace/2) && 
      mouseX<x_ace+(w_ace/2) &&
      mouseY>y_ace-(h_ace/2) &&
      mouseY<y_ace+(h_ace/2)){
     ace += step;
     //warning
     if(time>=timeWarning){
       fill(255,0,0);
       rect(x_ace-(w_ace/2),y_ace-(h_ace/2),w_ace,h_ace);
     
     }
   }else if(mouseX>x_fre-(w_ace/2) && 
            mouseX<x_fre+(w_ace/2) &&
            mouseY>y_fre-(h_ace/2) &&
            mouseY<y_fre+(h_ace/2)){
       fill(255,0,0);
       rect(x_fre-(w_ace/2),y_fre-(h_ace/2),w_ace,h_ace);
       ace -= step;
   }
   return ace;
     
}

void draw(){
   time = counterLoop/framerate;
   
   background(255);
   show_vel();
   
   
   ace = aceleradorHandler(time);
   vel += ace;
   
   if(vel <= 0){
     ace = 0;
     counterLoop = 0;
   }
   counterLoop += 1;
}
