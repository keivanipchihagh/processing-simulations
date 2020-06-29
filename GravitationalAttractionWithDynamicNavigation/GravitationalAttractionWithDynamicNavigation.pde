// Difining Objects
Mover[] movers;
Attractor attractor;

void setup() {
  // Initialize Window
  size(640, 360);
  background(255);
  smooth();

  // Initialize Objects
  movers = new Mover[10];
  for (int i = 0; i < movers.length; i++)
    movers[i] = new Mover();
  attractor = new Attractor();
}

void draw() {  
  // Reset Background
  background(255);

  printText();

  // Attractor Object's Functions
  attractor.display();

  // Mover Object's Functions
  for (Mover mover : movers) {
    mover.applyForce(attractor.attract(mover));
    mover.move();  
    mover.display();
  }
}


void printText() {
  fill(0);
  text("Gravatational Attraction With Dynamic Navigation - Constrained", 10, 20);
  text("Object Orientated Sample 2.3 - NOC", 10, 35);
}
