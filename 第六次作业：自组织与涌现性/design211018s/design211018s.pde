Ball[] myBalls;
int totalNum=300;
//int n;

void setup(){
  size(800,800);
  background(0);
  initiate();
}

void draw(){
  fill(0);
  noStroke();
  rect(0,0,width,height);
  for(int i=0;i<myBalls.length;i++){
    myBalls[i].run();
  }
  fill(255);
  ellipse(mouseX,mouseY,15,15);
  //saveFrame("frames/new"+str(n)+".png");
  //n++;
}

void initiate(){
  myBalls=new Ball[totalNum];
  for(int i=0;i<myBalls.length;i++){
    PVector p=new  PVector(random(width),random(height));
    myBalls[i]=new Ball(p,5);
  }
}
