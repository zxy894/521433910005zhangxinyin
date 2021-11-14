class Play{
SoundFile note;
  
  float group;
  float groupStart;
  float groupsmall;
  void PlayNotes(){
    if(mouseX>someKeyboards.start && mouseX<someKeyboards.start+someKeyboards.wwWhite*52
       && mouseY>someKeyboards.head && mouseY<someKeyboards.head+someKeyboards.hhWhite){
       groupStart=mouseX-someKeyboards.wwWhite*7*group+someKeyboards.wwWhite*5-someKeyboards.start;
       if(mouseY<someKeyboards.head+someKeyboards.hhBlack){
         fill(255);
         if(group==0){
           rect(someKeyboards.start+someKeyboards.wwWhite-someKeyboards.wwBlack/2,
                someKeyboards.head,someKeyboards.wwBlack,someKeyboards.hhBlack);
                note=new SoundFile(design211114D.this,"52.wav");
           if(mousePressed){
             note.play();
           }
         }else if(group!=8){
           groupsmall=floor((groupStart-someKeyboards.wwBlack/2)/someKeyboards.wwWhite);
           //println(str(groupsmall));
           if(groupsmall!=2.0 && groupsmall!=-1.0 && groupsmall!=6.0){
             rect( someKeyboards.wwWhite*7*group-someKeyboards.wwWhite*5
                                                   +someKeyboards.wwWhite*groupsmall+someKeyboards.start
                                                   +someKeyboards.wwWhite-someKeyboards.wwBlack/2,
                                                   someKeyboards.head,
                                                   someKeyboards.wwBlack,someKeyboards.hhBlack);
             //note=new SoundFile(design211114D.this,str(int(group*7-5+groupsmall)+51)+".wav");
             //println(str(int(group*7-6+groupsmall)+51));
             //if(mousePressed){
             //  note.play();
             //}
           }
         }
       }else{
         fill(125);
         if(group==8){
           rect(someKeyboards.wwWhite*51+someKeyboards.start,someKeyboards.head,
                someKeyboards.wwWhite,someKeyboards.hhWhite); 
           note=new SoundFile(design211114D.this,"51.wav");
           if(mousePressed){
             note.play();
           }
         }else if(group==0){
           if(mouseX<someKeyboards.start+someKeyboards.wwWhite){
             someSingleKeyboards=new SingleKeyboard(someKeyboards.start,someKeyboards.head);
             someSingleKeyboards.drawSingleKeyboardLeft();
             note=new SoundFile(design211114D.this,"0.wav");
             if(mousePressed){
               note.play();
             }
           }else{
             someSingleKeyboards=new SingleKeyboard(someKeyboards.wwWhite+someKeyboards.start,someKeyboards.head);
             someSingleKeyboards.drawSingleKeyboardRight();
             note=new SoundFile(design211114D.this,"1.wav");
             if(mousePressed){
               note.play();
             }
           }
         }else{
             groupsmall=floor(groupStart/someKeyboards.wwWhite);
             //println(str(groupsmall));
             someSingleKeyboards=new SingleKeyboard(
                                                   someKeyboards.wwWhite*7*group-someKeyboards.wwWhite*5
                                                   +someKeyboards.wwWhite*groupsmall+someKeyboards.start,
                                                   someKeyboards.head);             
             if(groupsmall==0.0 || groupsmall==3.0){
               someSingleKeyboards.drawSingleKeyboardLeft();
             }else if(groupsmall==2.0 || groupsmall==6.0) {
               someSingleKeyboards.drawSingleKeyboardRight() ; 
             }else if(groupsmall==1.0 || groupsmall==4.0 || groupsmall==5.0){
               someSingleKeyboards.drawSingleKeyboardMiddle() ; 
             }
             note=new SoundFile(design211114D.this,str(int(group*7-5+groupsmall))+".wav");
             if(mousePressed){
               note.play();
             }
           }
         }
      }
  }
  
  void determine(){
    group=floor((mouseX-someKeyboards.start+someKeyboards.wwWhite*5)/(someKeyboards.wwWhite*7));
  }
}
