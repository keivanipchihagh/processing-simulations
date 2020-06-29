class Vehicle {

  // Variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius;
  float maxSpeed;
  float maxForce;

  // Constructor
  Vehicle(PVector location) {
    // Initialize Variables
    this.location = location;
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector();
    radius = 6.0;
    maxSpeed = 4.0;
    maxForce = 0.1;
  }

  // Function: Arrive With boundaries
  void arrive(PVector target) {
    PVector desiredVelocity = PVector.sub(target, location);

    if (location.x < 100)
      desiredVelocity = new PVector(maxSpeed, velocity.y);
    else if (location.x > width - 100)
      desiredVelocity = new PVector(-maxSpeed, velocity.y);

    if (location.y < 100)
      desiredVelocity = new PVector(velocity.x, maxSpeed);
    else if (location.y > height - 100)
      desiredVelocity = new PVector(velocity.x, -maxSpeed);

    if (desiredVelocity != null) {
      desiredVelocity.setMag(maxSpeed);
      PVector steer = PVector.sub(desiredVelocity, velocity);
      steer.limit(maxForce);
      applyForce(steer);
    }
  }

  // Apply Force Funtion
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  // Move Funtion
  void move() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);

    acceleration.mult(0);  // Reset Acceleration For Each Cycle
  }

  // Display Function
  void display() {

    float theta = atan2(velocity.y, velocity.x) + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);

    pushMatrix();
    beginShape();
    translate(location.x, location.y);
    rotate(theta);
    vertex(0, -radius * 2);
    vertex(radius, radius);
    vertex(-radius, radius);
    endShape(CLOSE);
    popMatrix();
  }
}
