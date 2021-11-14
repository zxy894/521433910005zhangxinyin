class Keyboard{
  float xx,yy;   
  float wwWhite=34;
  float hhWhite=260;
  float wwBlack=26;
  float hhBlack=120;
  int start=16;
  float head=100;
  boolean aa=true;
  
  void drawSingleKeyboardLeft(){
    stroke(0);
    fill(255);
    someSingleKeyboards=new SingleKeyboard(start,head);
    someSingleKeyboards.drawSingleKeyboardLeft();
    someSingleKeyboards=new SingleKeyboard(wwWhite+start,head);
    someSingleKeyboards.drawSingleKeyboardRight();
    fill(0);
    rect(wwWhite-wwBlack/2+start,head,wwBlack,hhBlack);
  }
  
  void drawSingleKeyboardRight(){
    stroke(0);
    fill(255);
    rect(wwWhite*51+start,head,wwWhite,hhWhite);
  }  
  
  void drawSingleKeyboardPartOne(){
    fill(255);
    someSingleKeyboards=new SingleKeyboard(start,0.0);
    someSingleKeyboards.drawSingleKeyboardLeft();
    fill(0);
    rect(wwWhite-wwBlack/2+start,0.0,wwBlack,hhBlack);
    fill(255);
    someSingleKeyboards=new SingleKeyboard(wwWhite+start,0.0);
    someSingleKeyboards.drawSingleKeyboardMiddle();
    fill(0);
    rect(wwWhite*2-wwBlack/2+start,0.0,wwBlack,hhBlack);
    fill(255);
    someSingleKeyboards=new SingleKeyboard(wwWhite*2+start,0);
    someSingleKeyboards.drawSingleKeyboardRight();
  }
  void drawSingleKeyboardPartTwo(){
    fill(255);
    someSingleKeyboards=new SingleKeyboard(start,0.0);
    someSingleKeyboards.drawSingleKeyboardLeft();
    fill(0);
    rect(wwWhite-wwBlack/2+start,0.0,wwBlack,hhBlack);
    fill(255);
    someSingleKeyboards=new SingleKeyboard(wwWhite+start,0.0);
    someSingleKeyboards.drawSingleKeyboardMiddle();
    fill(0);
    rect(wwWhite*2-wwBlack/2+start,0.0,wwBlack,hhBlack);
    fill(255);
    someSingleKeyboards=new SingleKeyboard(wwWhite*2+start,0.0);
    someSingleKeyboards.drawSingleKeyboardMiddle();
    fill(0);
    rect(wwWhite*3-wwBlack/2+start,0.0,wwBlack,hhBlack);
    fill(255);
    someSingleKeyboards=new SingleKeyboard(wwWhite*3+start,0);
    someSingleKeyboards.drawSingleKeyboardRight();
  }
  
  void drawKeyboardAll(){
    for(int i=0;i<7;i++){
      if (aa){
        translate(wwWhite*2,head);
        aa=false;
      }else{
        translate(wwWhite*4,0);
      }
      drawSingleKeyboardPartOne();
      translate(wwWhite*3,0);
      drawSingleKeyboardPartTwo(); 
    }
  } 
}
