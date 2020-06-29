// Objects Declarations
Vehicle vehicle;

void setup() {
  // Initialize Window
  size(640, 360);
  background(255);
  smooth();

  // Initialize Object
  vehicle = new Vehicle(new PVector(width / 2, height / 2));
}

void draw() {
  // Reset Background
  background(255);

  vehicle.arrive(new PVector(mouseX, mouseY));
  vehicle.move();
  vehicle.display();

  // Draw Ellipse On Mouse
  strokeWeight(2);
  fill(50, 100);
  ellipse(mouseX, mouseY, 32, 32);
}
