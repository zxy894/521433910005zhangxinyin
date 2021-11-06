class Flea extends Creature {
  Flea(PVector pos, DNA initDNA) {
    super(pos, initDNA);
    health = 100;
    maxHealth = 100;
    breedProbability = 0.01;
    matingProbability = 0.01; 
    float lifetime = getLifetime();
    float speed = getMaxspeed();
    float size = getSize();
    lifetime = map(lifetime, 0, 1, 0.2, 0.7); 
    speed = map(speed, 0, 1, 0.5, 1);
    size = map(size, 0, 1, 0.5, 1);
    setLifetime(lifetime*50);
    setMaxspeed(speed*5);
    setSize(size*50);
    maxLifetime=getLifetime();
    maxSize = getSize();
    velocity = new PVector(random(-maxspeed, maxspeed), random(-maxspeed, maxspeed));
    velocity = velocity.limit(maxspeed);
    if (random(0, 1)<= 0.5) {
      gender = true;
    } else {
      gender = false;
    }
    if (gender) {
      col = color(255, 0, 0);
    } else {
      col = color(0, 255, 0);
    }
    alignWeight = 2;
    isRut = false;
  }
    void update() {
    rut();
    move(); 
    borders();
    display();
    health -= 0.15; 
    lifetime-=0.03;
    if (health<maxHealth/2) {
      isRut = false;
    }
  }
    void display() {
    r = map(lifetime, maxLifetime, 0, 0, 2*maxSize);
    if (r>=maxSize) {
      r = maxSize;
    }
    float alpha = map(health, 0, maxHealth, 100, 255);
    println(health);
    ellipseMode(RADIUS);
    fill(col, alpha);
    strokeWeight(r/30);
    pushMatrix();
    translate(position.x, position.y);
    line(0, 0+0.75*r, 0-r/sqrt(2), 0+0.75*r+r/sqrt(2));
    line(0, 0+0.75*r, 0+r/sqrt(2), 0+0.75*r+r/sqrt(2));
    ellipse(0, 0, r/2, r/2);
    popMatrix();
  }
    void flock(ArrayList<? extends Creature> Creatures) {
    if (isRut) {
      PVector mat = mating(Creatures);  
      PVector ali = align(Creatures);        
      mat.mult(5);
      ali.mult(alignWeight);
      applyForce(mat);
      applyForce(ali);
    } else {  
      PVector ali = align(Creatures);       
      ali.mult(alignWeight);
      applyForce(ali);
    }
  }
    Flea breed() {
    if (isPregnancy && random(1) < breedProbability) {
      DNA childDNA = dna.dnaCross(fatherDNA);
      childDNA.mutate(0.01); 
      return new Flea(position, childDNA);
    } else {
      return null;
    }
  }
    void move() {
    velocity.add(acceleration); 
    velocity.limit(maxspeed);   
    position.add(velocity);  
    acceleration.mult(0);    
  }
    PVector align (ArrayList<? extends Creature> creatures) {
    float neighbordist = size * 2;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Creature other : creatures) {
      PVector comparison = PVector.sub(other.position, position);
      float d = PVector.dist(position, other.position);
      float  diff = PVector.angleBetween(comparison, velocity);
      if ((diff < periphery) && (d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }
  void eat(ArrayList<Plant> plants) {
    if (health<100) {
      for (Plant p : plants) {
        float d = PVector.dist(position, p.position);
        if (d<r) {
          p.health-=5;
          health+=0.5;
          break;
        }
      }
    }
  }
    boolean dead() {
    if (lifetime<0.0 || health<0.0) {
      return true;
    } else {
      return false;
    }
  }
}
