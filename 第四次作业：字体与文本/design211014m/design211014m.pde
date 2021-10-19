PFont font;
String s="Processing is an significant tool for artists.It is charming and intresting.Everyone will be immersed in it.";
float speed;
int i=0;
char et;

void setup(){
  size(600,600);
  background(255);
  font=loadFont("AgencyFB-Reg-48.vlw");
}

void draw(){
  fill(255,255,255,10);
  noStroke();
  rect(0,0,width,height);
  speed=dist(mouseX,mouseY,pmouseX,pmouseY);
  textFont(font);
  textSize(speed+1);
  fill(map(mouseX,0,width,0,255),map(mouseY,0,height,0,255),120);
  et=s.charAt(i);
  text(et,mouseX,mouseY);
  i=(i+1)%108;
}
