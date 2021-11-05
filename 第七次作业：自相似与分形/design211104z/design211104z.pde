int season=1;

void setup(){
  size(1600,800);
  background(255);
}

void draw(){
  if (mousePressed){
    noStroke();
    fill(255,20);
    rect(0,0,width,height);
    float hh=(height-mouseY)/3.5;
    translate(mouseX,height);
    branch(hh,5);
  }
}

void branch(float len,float w) {
  float theta = random(PI/10,PI/4); 
  float dd=map(len,2,228,20,200);
  float a=map(len,2,228,15,150);
  rotate(random(-PI/10,PI/10));
  if(len<170){
    noStroke();
    if(season==1){
      fill(random(235,255),random(135,165),random(185,215),a);
    } else if(season==2){
      fill(random(95,125),random(200,230),random(155,185),a);
    } else if(season==3){
      fill(random(205,235),random(135,165),random(65,95),a);
    } else {
      fill(255,a);
    }
    ellipse(0,-len-dd/1.2,dd,dd);
  }
  strokeWeight(w);
  stroke(0);
  line(0,0,0,-len);
  translate(0,-len);
  len*=random(0.5,0.8);
  w*=random(0.5,0.9);
  if (len>2) {
    pushMatrix();
    rotate(theta);
    branch(len,w);
    popMatrix();
    pushMatrix();
    rotate(-theta);
    branch(len,w);
    popMatrix();
  }
}

void keyPressed(){
  if (key=='a'){
    season=1;
  } else if (key=='b'){
    season=2;
  } else if (key=='c'){
    season=3;
  } else if (key=='d'){
    season=4;
  } 
}
