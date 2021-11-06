class Creature {
  PVector position,acceleration,velocity; 
  float lifetime,maxspeed,maxforce;    
  float size,r;            
  float maxLifetime,maxSize,health,maxHealth;
  DNA dna;          
  DNA fatherDNA;
  float alignWeight;
  float breedProbability,matingProbability; 
  float xoff,yoff;  
  float periphery = PI/2; 
  Boolean gender,isRut,isPregnancy; 
  color col;   
  Creature(PVector pos, DNA initDNA) {
    position=pos.copy();
    dna = initDNA;
    lifetime = map(dna.genes.get("lifetime"), 0, 1, 0, 1);
    maxspeed = map(dna.genes.get("speed"), 0, 1, 0, 1);
    size = map(dna.genes.get("size"), 0, 1, 0, 1);
    maxforce = 0.05;
    breedProbability = 0.005;
    alignWeight = 1;
    xoff = random(1000);
    yoff = random(1000);
    float vx = map(noise(xoff), 0, 1, -maxspeed, maxspeed);
    float vy = map(noise(yoff), 0, 1, -maxspeed, maxspeed);
    velocity = new PVector(vx, vy);
    acceleration = new PVector(0, 0);
    isRut = false;
    isPregnancy = false;
  }
  void update() {
    move();
    borders();
    display();
    lifetime-=0.01;
  }
  void move() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);  
    position.add(velocity); 
    acceleration.mult(0); 
  }
  void display() {
    ellipseMode(CENTER);
    stroke(0);
    fill(0, lifetime);
    ellipse(position.x, position.y, r, r);
  }  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  void flock(ArrayList<? extends Creature> Creatures) {
    PVector ali = align(Creatures);      
    ali.mult(alignWeight);
    applyForce(ali);
  }
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);  
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    return steer;
  }
  PVector align (ArrayList<? extends Creature> creatures) {
    float neighbordist = r * 3;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Creature other : creatures) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
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
  void rut() {
    if (r >= maxSize && health>maxHealth/2) {
      if (!isRut && !isPregnancy) {
        if (random(1)<matingProbability) {
          isRut = true;
          if (gender) {
            col = color(100, 0, 0);
          } else {
            col = color(0, 100, 0);
          }
        }
      }
    }
  }
  PVector mating(ArrayList<? extends Creature> creatures) {
    float neighbordist = r * 15;
    if (isRut) {
      for (Creature other : creatures) {
        if (other.isRut && gender != other.gender) {
          float d = PVector.dist(position, other.position);
          if ( (d < neighbordist) && (d>r)) {
            return seek(other.position);
          } else if (d<r) { 
            isRut = false;
            other.isRut = false;
            if (gender) {
              col = color(255, 0, 0);
              other.col = color(0, 255, 0);
              isPregnancy = true;
              fatherDNA = other.dna;
            } else {
              col = color(0, 255, 0);
              other.col = color(255, 0, 0);
              other.isPregnancy = true;
              other.fatherDNA = dna;
            }
          }
        }
      }
    }
    return new PVector(0, 0);
  }
  PVector foraging(ArrayList<? extends Creature> creatures) {
    float neighbordist = r * 10;
    for (Creature c:creatures) {
      PVector comparison = PVector.sub(c.position, position);
      float d = PVector.dist(position, c.position);
      float  diff = PVector.angleBetween(comparison, velocity);
      if ((diff < periphery) && (d < neighbordist)) {
        return seek(c.position);
      }
    }
    return new PVector(0, 0);
  }

  public Creature  breed() {
    return null;
  };
  void borders() {
    if (position.x < -r) position.x = width+r;
    if (position.y < -r) position.y = height+r;
    if (position.x > width+r) position.x = -r;
    if (position.y > height+r) position.y = -r;
  }
  boolean dead() {
    if (lifetime<0.0) {
      return true;
    } else {
      return false;
    }
  }
  public float getLifetime() {
    return lifetime;
  }
  public void setLifetime(float lifetime) {
    this.lifetime=lifetime;
  }
  public float getMaxspeed() {
    return maxspeed;
  }
  public void setMaxspeed(float speed) {
    maxspeed=speed;
  }
  public float getSize() {
    return size;
  }
  public void setSize(float size) {
    this.size=size;
  }
}
