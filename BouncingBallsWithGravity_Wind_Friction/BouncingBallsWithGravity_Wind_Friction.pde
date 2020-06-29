// Objects Declaration
Ball[] balls;
Gravity gravity;
Wind wind;
Friction friction;

void setup() {
  // Initialize Window
  size(640, 360);
  background(255);

  // Initializing Objects
  balls = new Ball[10];
  for (int i = 0; i < balls.length; i++)
    balls[i] = new Ball(new PVector(0, 0), i * 0.5);

  // Initialize Forces;
  gravity = new Gravity();
  wind = new Wind();
  friction = new Friction();
}

void draw() {
  background(255);

  // Draw Objects
  for (int i = 0; i < balls.length; i++) {
    // Apply Forces
    balls[i].applyForce(PVector.mult(gravity.getForce(), balls[i].mass));
    balls[i].applyForce(wind.getForce());
    balls[i].applyForce(friction.getForce(balls[i].velocity));
    // Object Functions
    balls[i].move();
    balls[i].checkEdges();
    balls[i].display();    
  }

  // Print Forces Disriptions
  text("Forces Involved: Gravity, Wind, Friction, Air Resistance", 10, height - 20);
  text("Friction Coefficient: 0.01 - Normal Force: 1.0 - Wind Direction: LTR - Wind Speed: 0.024", 10, height - 5);
}
