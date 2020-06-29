class Mover {

  // Variables - Vector
  private PVector location;
  private PVector velocity;
  private PVector acceleration;
  private float mass;

  // Variables - Angular
  private float angle;
  private float angularVelocity;
  private float angularAcceleration;

  // Constructor
  Mover() {
    // Initialize Variables
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2, 2), random(-2, 2));
    acceleration = new PVector(0, 0);
    mass = random(0.5, 3);
    angle = random(360);
    angularVelocity = 0;
    angularAcceleration = 0;
  }

  // Apply Force
  void applyForce(PVector force) {
    acceleration.add(PVector.div(force, mass));
  }

  // Move Function
  void move() {
    velocity.add(acceleration);
    velocity.limit(25);
    location.add(velocity);

    // Calculate Angular Acceleration
    angularAcceleration = (acceleration.x / 10);
    angularVelocity += angularAcceleration;
    angularVelocity = constrain(angularVelocity, -0.2, 0.2);
    // Set Direction
    angle = atan2(velocity.y,velocity.x);

    // Reset Acceleration For Each Frame    
    acceleration.mult(0);
  }

  // Display Function
  void display() {
    stroke(1);
    fill(175, 200);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);    
    rect(0, 0, mass*16, mass*16);
    popMatrix();
  }
}
