PImage img;
PFont font;
color c;
int flag=1;
int num=ceil(random(3));
float x,y,pX,pY;
boolean mouseD;
Part3[] myPenthree;

void setup(){
  img=loadImage("2.png");
  img.loadPixels();
  font = loadFont("Bauhaus93-48.vlw");
  size(1500,900);
  initiate();
}

void getcolor(){
  if(mousePressed & mouseX<100 & mouseX>0 & mouseY<900 & mouseY>300){
    c= img.get(mouseX,mouseY-300);
  }
}

void getPen(){
  if(mousePressed){
    if(mouseX<100 & mouseX>0 & mouseY<100 & mouseY>0){
      flag=1;
    }  else if(mouseX<100 & mouseX>0 & mouseY<200 & mouseY>100){
      flag=2;
    }  else if(mouseX<100 & mouseX>0 & mouseY<300 & mouseY>200){
      flag=3;
    }  else if(mouseX<width & mouseX>(width-40) & mouseY<40 & mouseY>0){
      flag=4;
    } 
  }
}

void initiate(){
  background(255);
  image(img,0,300); 
  fill(0);
  noStroke();
  rect(width-40,0,40,40);
  textFont(font);
  textSize(19);
  fill(255);
  text("eraser",width-35,5,40,40);
  for(int i=0;i<3;i++){
    fill(0);
    noStroke();
    rect(0,100*i,100,100);
    textFont(font);
    textSize(50);
    fill(255);
    text(str(i+1),35,35+100*i,50,50);
  }
}

void keyPressed(){
  if(key=='d'){
    if(mouseD){
      mouseD=false;
    }else if(mouseD==false){
      mouseD=true;
      x=mouseX;
      y=mouseY;
      pX=mouseX;
      pY=mouseY;
    }
  } else if(key=='r'){
    initiate();
  } else if(key=='b'){
    c=color(0);
  }
}

void draw(){
  getPen();
  getcolor();
  if(mouseD){
    if (flag==1 & mouseX>100){
      Penone();
    } else if (flag==2 & mouseX>100){
      Pentwo();
    } else if (flag==3 & mouseX>100){
      Penthree();
    }else if (flag==4 & mouseX>100){
      eraser();
    }
  }
}

void Penone(){
  float speed=dist(mouseX,mouseY,pmouseX,pmouseY);
  noStroke();
  fill(c);
  ellipse(mouseX,mouseY,speed,speed);
}

void Pentwo(){
  x+=(mouseX-x)*0.15;
  y+=(mouseY-y)*0.15;  
  float speed=dist(x,y,pX,pY);
  strokeWeight(speed);
  stroke(c);
  line(x,y,pX,pY);
  pX=x;
  pY=y;
}

void Penthree(){
  myPenthree=new Part3[num];
  for(int j=0;j<myPenthree.length;j++){
    myPenthree[j]=new Part3(mouseX,mouseY,c);
    myPenthree[j].drawPart();
  }  
}

void eraser(){
  strokeWeight(30);
  stroke(255);
  line(mouseX,mouseY,pmouseX,pmouseY);
}
