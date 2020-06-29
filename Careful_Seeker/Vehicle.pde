class Vehicle {

  // Variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;  // Maximum Steering Speed
  float maxForce;  // Maximum Steering Force
  float radius;

  // Constructor
  Vehicle(PVector location) {
    this.location = location;
    velocity = new PVector();
    acceleration = new PVector();
    maxSpeed = 5.0;
    maxForce = 0.1;
    radius = 6.0;
  }

  // Move Funtion
  void move() {
    velocity.add(acceleration);
    location.add(velocity);

    acceleration.mult(0);  // Reset Acceleration For Each Cycle
  }

  // Apply Force Funtion
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  // Seek Function
  void arrive(PVector target) {
    PVector desiredVelocity = PVector.sub(target, location);
    float distance = desiredVelocity.mag();  // Calculate The Distance

    float arrivingVelocity = map(distance, 0, location.mag(), 0, maxSpeed);

    desiredVelocity.setMag(arrivingVelocity);  // Scale The Desired Velocity

    PVector steer = PVector.sub(desiredVelocity, velocity);
    steer.limit(maxForce);  // Limit Steering Force

    applyForce(steer);
  }

  void display() {
    float theta = atan2(velocity.y, velocity.x) + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex(0, -radius * 2);
    vertex(radius, radius * 2);
    vertex(-radius, radius * 2);
    endShape(CLOSE);
    popMatrix();
  }
}
