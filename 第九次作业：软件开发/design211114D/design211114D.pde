import processing.sound.*;

SoundFile song;

Keyboard someKeyboards;
Arrow myCuteArrow;
PFont font;
boolean themouse=false;

void setup(){
  size(1800,600);
  background(0); 
  song=new SoundFile(this,"C6.MP3");
  font=loadFont("BerlinSansFBDemi-Bold-48.vlw");
  textSize(80);
  text("Create Your Own Songs",500,200);
}

void draw(){
  if(themouse){ 
    background(255);
    startPlay();
  }else{
    aboutMousePressed();
    face();
  }
}

void startPlay(){
  someKeyboards=new Keyboard();
  someKeyboards.drawSingleKeyboardLeft();
  someKeyboards.drawSingleKeyboardRight();
  someKeyboards.drawKeyboardAll();
}

void face(){
  myCuteArrow=new Arrow(800,400);
  myCuteArrow.run();
}

void aboutMousePressed(){
  if(mousePressed 
     && mouseX>myCuteArrow.xx && mouseX<myCuteArrow.xx+100 
     && mouseY>myCuteArrow.yy-40 && mouseY<myCuteArrow.yy+60){
    themouse=true;
    song.play();
  }
}
