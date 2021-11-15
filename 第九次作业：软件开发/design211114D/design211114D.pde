import processing.sound.*;

SoundFile song;

Keyboard someKeyboards;
SingleKeyboard someSingleKeyboards;
Arrow myCuteArrow;
Play abaPlay;
PFont font;
boolean themouse=false;
boolean display=false;
String s="Create Your Own Songs";

void setup(){
  size(1800,600);
  background(0); 
  abaPlay=new Play();
  song=new SoundFile(this,"begin.wav");
  song.play();
  font=loadFont("BerlinSansFBDemi-Bold-48.vlw");
  textFont(font);
  textSize(80);
  text(s,500,220);
}

void draw(){
  if(themouse){ 
    background(255);
    pushMatrix();
    startPlay();
    popMatrix();
    abaPlay.determine();
    abaPlay.PlayNotes();
  }else{
    face();
    aboutMousePressed();
  }
}

void startPlay(){
  someKeyboards=new Keyboard();
  someKeyboards.drawSingleKeyboardLeft();
  someKeyboards.drawSingleKeyboardRight();
  someKeyboards.drawKeyboardAll();
}

void face(){
  myCuteArrow=new Arrow(800,410);
  myCuteArrow.run();
}

void aboutMousePressed(){
  if(mousePressed 
     && mouseX>myCuteArrow.xx && mouseX<myCuteArrow.xx+100 
     && mouseY>myCuteArrow.yy-40 && mouseY<myCuteArrow.yy+60){
     song.stop();
     themouse=true;
  }
}
