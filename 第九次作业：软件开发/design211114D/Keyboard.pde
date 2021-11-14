class Keyboard{
  float xx,yy;   
  float wwWhite=34;
  float hhWhite=260;
  float wwBlack=26;
  float hhBlack=120;
  int start=16;
  float head=20;
  boolean aa=true;
  
  void drawSingleKeyboardLeft(){
    stroke(0);
    beginShape();
    fill(255);
    vertex(start,head);
    vertex(wwWhite-wwBlack/2+start,head);   
    vertex(wwWhite-wwBlack/2+start,hhBlack+head);
    vertex(wwWhite+start,hhBlack+head);
    vertex(wwWhite+start,hhWhite+head);
    vertex(start,hhWhite+head);
    endShape(CLOSE);
    beginShape();
    fill(255);
    vertex(wwWhite+wwBlack/2+start,head);
    vertex(wwWhite+wwBlack/2+start,hhBlack+head);   
    vertex(wwWhite+start,hhBlack+head);
    vertex(wwWhite+start,hhWhite+head);
    vertex(wwWhite*2+start,hhWhite+head);
    vertex(wwWhite*2+start,head);
    endShape(CLOSE); 
    fill(0);
    rect(wwWhite-wwBlack/2+start,head,wwBlack,hhBlack);
  }
  
  void drawSingleKeyboardRight(){
    stroke(0);
    fill(255);
    rect(wwWhite*51+start,head,wwWhite,hhWhite);
  }  
  
  void drawSingleKeyboardPartOne(){
    beginShape();
    fill(255);
    vertex(start,0.0);
    vertex(wwWhite-wwBlack/2+start,0.0);   
    vertex(wwWhite-wwBlack/2+start,hhBlack);
    vertex(wwWhite+start,hhBlack);
    vertex(wwWhite+start,hhWhite);
    vertex(start,hhWhite);
    endShape(CLOSE);
    fill(0);
    rect(wwWhite-wwBlack/2+start,0.0,wwBlack,hhBlack);
    beginShape();
    fill(255);
    vertex(wwWhite+wwBlack/2+start,0.0);
    vertex(wwWhite+wwBlack/2+start,hhBlack);   
    vertex(wwWhite+start,hhBlack);
    vertex(wwWhite+start,hhWhite);
    vertex(wwWhite*2+start,hhWhite);
    vertex(wwWhite*2+start,hhBlack);
    vertex(wwWhite*2-wwBlack/2+start,hhBlack);
    vertex(wwWhite*2-wwBlack/2+start,0.0);
    endShape(CLOSE);
    fill(0);
    rect(wwWhite*2-wwBlack/2+start,0.0,wwBlack,hhBlack);
    beginShape();
    fill(255);
    vertex(wwWhite*2+wwBlack/2+start,0.0);
    vertex(wwWhite*2+wwBlack/2+start,hhBlack);   
    vertex(wwWhite*2+start,hhBlack);
    vertex(wwWhite*2+start,hhWhite);
    vertex(wwWhite*3+start,hhWhite);
    vertex(wwWhite*3+start,hhBlack);
    vertex(wwWhite*3+start,0.0);
    endShape(CLOSE); 
  }
  void drawSingleKeyboardPartTwo(){
    beginShape();
    fill(255);
    vertex(start,0.0);
    vertex(wwWhite-wwBlack/2+start,0.0);   
    vertex(wwWhite-wwBlack/2+start,hhBlack);
    vertex(wwWhite+start,hhBlack);
    vertex(wwWhite+start,hhWhite);
    vertex(start,hhWhite);
    endShape(CLOSE);
    fill(0);
    rect(wwWhite-wwBlack/2+start,0.0,wwBlack,hhBlack);
    beginShape();
    fill(255);
    vertex(wwWhite+wwBlack/2+start,0.0);
    vertex(wwWhite+wwBlack/2+start,hhBlack);   
    vertex(wwWhite+start,hhBlack);
    vertex(wwWhite+start,hhWhite);
    vertex(wwWhite*2+start,hhWhite);
    vertex(wwWhite*2+start,hhBlack);
    vertex(wwWhite*2-wwBlack/2+start,hhBlack);
    vertex(wwWhite*2-wwBlack/2+start,0.0);
    endShape(CLOSE);
    fill(0);
    rect(wwWhite*2-wwBlack/2+start,0.0,wwBlack,hhBlack);
    beginShape();
    fill(255);
    vertex(wwWhite*2+wwBlack/2+start,0.0);
    vertex(wwWhite*2+wwBlack/2+start,hhBlack);   
    vertex(wwWhite*2+start,hhBlack);
    vertex(wwWhite*2+start,hhWhite);
    vertex(wwWhite*3+start,hhWhite);
    vertex(wwWhite*3+start,hhBlack);
    vertex(wwWhite*3-wwBlack/2+start,hhBlack);
    vertex(wwWhite*3-wwBlack/2+start,0.0);
    endShape(CLOSE); 
    fill(0);
    rect(wwWhite*3-wwBlack/2+start,0.0,wwBlack,hhBlack);
    beginShape();
    fill(255);
    vertex(wwWhite*3+wwBlack/2+start,0.0);
    vertex(wwWhite*3+wwBlack/2+start,hhBlack);   
    vertex(wwWhite*3+start,hhBlack);
    vertex(wwWhite*3+start,hhWhite);
    vertex(wwWhite*4+start,hhWhite);
    vertex(wwWhite*4+start,0.0);
    endShape(CLOSE); 
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
