class Ball{
  PVector position;
  float dd;
  PVector speed;
  color c=color(random(255),random(255),random(255));
  
  Ball(PVector p,float d){
    position=p;
    dd=d;
    speed=new PVector(random(-1,1),random(-1,1));
  }
  
  void run(){
    move();
    collision();
    egde();
    attraction();
    drawBall();
    speed.limit(4);
  }
  
  void move(){
    position.add(speed);
  }
  
  void collision(){
    for(Ball tb:myBalls){
      float d=PVector.dist(tb.position,this.position);
      if(d>0 && d<(tb.dd/2+dd/2)){
          PVector a=PVector.sub(position,tb.position);
          speed.add(a);
      }
    }
  }
  
  void attraction(){
      PVector m=new PVector(mouseX,mouseY);
      float d=PVector.dist(m,position);
      PVector attr=PVector.sub(m,position);
      attr.normalize();
      attr.mult(15/d);
      speed.sub(attr);
  }
  
  void egde(){
    if(position.x>width-dd/2){
      position.x=width-dd/2;
      speed.x*=-1;
    }
    if(position.x<dd/2){
      position.x=dd/2;
      speed.x*=-1;
    }
    if(position.y>width-dd/2){
      position.y=width-dd/2;
      speed.y*=-1;
    }
    if(position.y<dd/2){
      position.y=dd/2;
      speed.y*=-1;
    }
  }
  
  void drawBall(){
    noStroke();
    fill(c);
    ellipse(position.x,position.y,dd,dd);
  }
}
