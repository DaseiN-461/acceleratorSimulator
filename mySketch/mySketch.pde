import processing.sound.*;

SoundFile file;

void setup(){
  size(500,500);
  file = new SoundFile(this, "sample.mp3");
}
