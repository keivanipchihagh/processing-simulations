// Objects Declaration
ParticleSystem system;

void setup() {
  // Initialize Window
  size(640, 360);
  background(255);

  // Initialize Objects
  system = new ParticleSystem(new PVector(width / 2, height / 2));
}

void draw() {

  // Reset Background
  background(255);

  system.run();
}
