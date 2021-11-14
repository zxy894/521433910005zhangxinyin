class Arrow{
  float xx,yy;
  
  Arrow(float x,float y){
    xx=x;
    yy=y;
  }
  
  void run(){
    drawTheArrow();
    judge();
  }
  
  void drawTheArrow(){
    beginShape();
    vertex(xx,yy);
    vertex(xx+60,yy);
    vertex(xx+60,yy-40);
    vertex(xx+100,yy+10);
    vertex(xx+60,yy+60);
    vertex(xx+60,yy+20);
    vertex(xx,yy+20);
    endShape();
  }
  
  void judge(){
    if(mouseX>xx && mouseX<xx+100 && mouseY>yy-40 && mouseY<yy+60){
      fill(102);
    }else{
      fill(255);
    }
  }
}
