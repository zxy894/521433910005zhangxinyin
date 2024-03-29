class Square{
  float sX,sY,sW,sH;
  float b;
  Square(float sX_,float sY_,float sW_,float sH_){
    sX=sX_;
    sY=sY_;
    sW=sW_;
    sH=sH_;
  }
  void possible(){
    fill(floor(random(5))*63);
  }  
  void display1(){
    possible();
    strokeWeight(7);
    rect(sX,sY,sW,sH);
  }  
  void display2(){
    float yy;
    yy=random(sY,sY+sH);
    strokeWeight(7);
    possible();
    rect(sX,sY,sW,yy-sY);
    possible();
    rect(sX,yy,sW,sH+sY-yy);
  }  
  void display2_(){
    float xx;
    xx=random(sX,sX+sW);
    strokeWeight(7);
    possible();
    rect(sX,sY,xx-sX,sH);
    possible();
    rect(xx,sY,sX+sW-xx,sH);
  }  
  void display3(){
    float yYy;
    float xXx;
    float c=random(1);
    yYy=random(sY,sY+sH);
    xXx=random(sX,sX+sW);
    if (c<0.5){
      possible();
      rect(sX,sY,sW,yYy-sY);
      possible();
      rect(sX,yYy,xXx-sX,sY+sH-yYy);
      possible();
      rect(xXx,yYy,sX+sW-xXx,sY+sH-yYy);
    } else {
      possible();
      rect(sX,sY,xXx-sX,yYy-sY);
      possible();
      rect(xXx,sY,sX+sW-xXx,yYy-sY);
      possible();
      rect(sX,yYy,sW,sY+sH-yYy);
    }
  }  
  void display3_(){
    float XxX;
    float YyY;
    float C=random(1);
    XxX=random(sX,sX+sW);
    YyY=random(sY,sY+sH);
    if (C<0.5){
      possible();
      rect(sX,sY,XxX-sW,sH);
      possible();
      rect(XxX,sY,sX+sW-XxX,YyY-sY);
      possible();
      rect(XxX,YyY,sX+sW-XxX,sY+sH-YyY);
    } else {
      possible();
      rect(sX,sY,XxX-sW,YyY-sY);
      possible();
      rect(sX,YyY,XxX-sW,sY+sH-YyY);
      possible();
      rect(XxX,sY,sX+sW-XxX,sH);
    }
  }  
  void display4(){
    float[] xX=new float[6];
    float[] yY=new float[3];
    xX[0]=sX;
    yY[0]=sY;
    yY[1]=random(sY,sY+sH);
    xX[2]=sX+sW;
    xX[3]=xX[0];
    xX[5]=xX[2];
    yY[2]=sY+sH;
    strokeWeight(7);
    for(int j=0;j< 2;j ++){
      xX[j*3+1]=random(sX,sX+sW);
      for(int i=0;i< 2;i ++){ 
        possible();
        rect(xX[j*3+i],yY[j],xX[j*3+i+1]-xX[j*3+i],yY[j+1]-yY[j]);
      }
    }
  }        
  void display4_(){
    float[] Xx=new float[3];
    float[] Yy=new float[6];
    Xx[0]=sX;
    Yy[0]=sY;
    Xx[1]=random(sX,sX+sW);
    Xx[2]=sX+sW;
    Yy[2]=sY+sH;
    Yy[3]=Yy[0];
    Yy[5]=Yy[2];
    strokeWeight(7);
    for(int j=0;j< 2;j ++){
      Yy[j*3+1]=random(sY,sY+sH);
      for(int i=0;i< 2;i ++){ 
        possible();
        rect(Xx[j],Yy[j*3+i],Xx[j+1]-Xx[j],Yy[j*3+i+1]-Yy[j*3+i]);
      }
    }
  }  
}
