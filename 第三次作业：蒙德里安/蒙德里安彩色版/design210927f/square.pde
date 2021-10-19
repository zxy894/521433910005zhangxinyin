class Square{
  float bX,bY,bW,bH;
  float a;
  
  Square(float bX_,float bY_,float bW_,float bH_){
    bX=bX_;
    bY=bY_;
    bW=bW_;
    bH=bH_;
  }
  
  void display(){
    strokeWeight(7);
    a=random(1);
    if (a<0.5){
      line(bX,bY,bX,0);
      line(bX+bW,bY,width,bY);
      line(bX+bW,bY+bH,bX+bW,height);
      line(bX,bY+bH,0,bY+bH);
    } else {
      line(bX,bY,0,bY);
      line(bX+bW,bY,bX+bW,0);
      line(bX+bW,bY+bH,width,bY+bH);
      line(bX,bY+bH,bX,height);
    }
    if (a<0.28){
      fill(255,0,0);
    } else if(a<0.56){
      fill(0,0,255);
    } else if(a<0.84){
      fill(255,255,0);
    } else {
      fill(0,0,0);
    }
    rect(bX,bY,bW,bH); 
  }
}
  
