class Part3{
  float xx,yy;
  color cc;
  float pp;
  
  Part3(float x,float y,color z){
    xx=x;
    yy=y;
    cc=z;
  }
  
  void drawPart(){
    pp=random(1);
    noFill();
    stroke(cc);
    strokeWeight(5);
    if(pp<0.25){
      arc(xx,yy,random(20,70),random(20,70), PI,HALF_PI+PI,OPEN);
    } else if(pp<0.5){
      arc(xx,yy,random(70,120),random(70,120),PI, QUARTER_PI+PI,OPEN);
    } else if(pp<0.75){
      arc(xx,yy,random(70,120),random(70,120),PI+HALF_PI+QUARTER_PI, TWO_PI,OPEN);
    } else {
      arc(xx,yy,random(20,70),random(20,70),PI+HALF_PI,TWO_PI,OPEN);
    }
  }
}
