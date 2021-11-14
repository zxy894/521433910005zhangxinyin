class SingleKeyboard{
  float xX,yY;
  SingleKeyboard(float x,float y){
    xX=x;
    yY=y;
  }
  
  void drawSingleKeyboardLeft(){
    beginShape();
    vertex(xX,yY);
    vertex(xX,yY+someKeyboards.hhWhite);   
    vertex(xX+someKeyboards.wwWhite,yY+someKeyboards.hhWhite);
    vertex(xX+someKeyboards.wwWhite,yY+someKeyboards.hhBlack);
    vertex(xX+someKeyboards.wwWhite-someKeyboards.wwBlack/2,yY+someKeyboards.hhBlack);
    vertex(xX+someKeyboards.wwWhite-someKeyboards.wwBlack/2,yY);
    endShape(CLOSE);
  }
  
  void drawSingleKeyboardRight(){
    beginShape();
    vertex(xX+someKeyboards.wwBlack/2,yY);
    vertex(xX+someKeyboards.wwBlack/2,yY+someKeyboards.hhBlack);   
    vertex(xX,yY+someKeyboards.hhBlack);
    vertex(xX,yY+someKeyboards.hhWhite);
    vertex(xX+someKeyboards.wwWhite,yY+someKeyboards.hhWhite);
    vertex(xX+someKeyboards.wwWhite,yY);
    endShape(CLOSE);
  }
  
  void drawSingleKeyboardMiddle(){
    beginShape();
    vertex(xX+someKeyboards.wwBlack/2,yY);
    vertex(xX+someKeyboards.wwBlack/2,yY+someKeyboards.hhBlack);   
    vertex(xX,yY+someKeyboards.hhBlack);
    vertex(xX,yY+someKeyboards.hhWhite);
    vertex(xX+someKeyboards.wwWhite,yY+someKeyboards.hhWhite);
    vertex(xX+someKeyboards.wwWhite,yY+someKeyboards.hhBlack);
    vertex(xX+someKeyboards.wwWhite-someKeyboards.wwBlack/2,yY+someKeyboards.hhBlack);
    vertex(xX+someKeyboards.wwWhite-someKeyboards.wwBlack/2,yY);
    endShape(CLOSE);
  }
}
