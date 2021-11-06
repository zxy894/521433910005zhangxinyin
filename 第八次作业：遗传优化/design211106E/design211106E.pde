World world; 
void setup() {
  size(800, 600);
  frameRate(60);
  world = new World(90, 30);
}
void draw() {
  background(255);
  world.update();
}
