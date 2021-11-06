class World{
  ArrayList<Flea> fleas;
  ArrayList<Plant> plants;
  World(int plantsNum, int fleasNum) {
    plants = new ArrayList<Plant>();
    for (int i=0; i<plantsNum; i++) {
      PVector pos = new PVector(random(width), random(height));
      plants.add(new Plant(pos, new DNA()));
    }
    fleas = new ArrayList<Flea>();
    for (int i=0; i<fleasNum; i++) {
      PVector pos = new PVector(random(width), random(height));
      fleas.add(new Flea(pos, new DNA()));
    }
  }
  void update() {
    for (int i = plants.size()-1; i >= 0; i--) {
      Plant p = plants.get(i);
      p.update();
      if (p.dead()) {
        plants.remove(i);
      }
      Plant newP = p.breed();
      if (newP!=null) {
        plants.add(newP);
      }
    }
    for (Flea f : fleas) {
      f.flock(fleas);
    }
    for (int i = fleas.size()-1; i >= 0; i--) {
      Flea f = fleas.get(i);
      f.update();
      f.eat(plants);
      if (f.dead()) {
        fleas.remove(i);
      }
      Flea newP = f.breed();
      if (newP!=null) {
        fleas.add(newP);
      }
    }
  }
  float getFleaNum() {
    return fleas.size();
  }
  float getPlantNum() {
    return plants.size();
  }
  void addFlea(PVector pvector) {
    fleas.add(new Flea(pvector, new DNA()));
  }
  void addPlant(PVector pvector) {
    plants.add(new Plant(pvector, new DNA()));
  }
  void reducePlant() {
    plants.remove(0);
  }
  void reduceFlea() {
    fleas.remove(0);
  }
}
