Square[] someSquares;
int totalNumOfSquares =floor(random(5,15));

void setup(){
  size(600,600);
  background(255);
  initiateData();
  for(int i=0;i< someSquares.length;i ++){
    someSquares[i].display();
  }
}

void draw(){
  if (keyPressed){
    background(255);
    initiateData();
    for(int i=0;i< someSquares.length;i ++){
      someSquares[i].display();
    }
  }
}

void initiateData(){
  someSquares= new Square[totalNumOfSquares];
  for(int i=0;i< someSquares.length;i ++){
    float ww=random(10,300);
    float hh=random(10,300);
    someSquares[i]=new Square(random(width),random(height),ww,hh);
  }
}
