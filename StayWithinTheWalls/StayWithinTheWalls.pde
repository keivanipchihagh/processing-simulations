// Objects
Vehicle vehicle;
Wall wall;

void setup() {
  // Initialize Window
  size(640, 360);
  background(255);
  smooth();

  // Initialize Objects
  vehicle = new Vehicle(new PVector(width / 2, height / 2));
  wall = new Wall();
}

void draw() {
  // Reset background
  background(255);
  
  // Display Cursor
  fill(127, 50);
  stroke(0);
  strokeWeight(2);  
  ellipse(mouseX, mouseY, 20, 20);

  // Wall's Functions
  wall.display();  

  // Vehicle's Functions
  vehicle.arrive(new PVector(mouseX, mouseY));
  vehicle.move();
  vehicle.display();
}
