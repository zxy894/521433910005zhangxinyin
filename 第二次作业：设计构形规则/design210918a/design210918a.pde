int diaW,diaH;
int x,y;
float dd;

void setup(){
  size(720,640);
  background(0);
  x=width/2;
  y=height/2;
};

void draw(){
  //background(0,120,140,5);
  fill(0,120,140,5);
  rect(0,0,width,height);
  noStroke();
  fill(random(255),random(255),random(255));
  x+=random(-20,20);
  y+=random(-20,20);
  if(x<0){
    x+=random(10,30);
  };
  if(y<0){
    y+=random(10,30);
  };
  dd=random(30,60);
  ellipse(x,y,dd,dd);
}
