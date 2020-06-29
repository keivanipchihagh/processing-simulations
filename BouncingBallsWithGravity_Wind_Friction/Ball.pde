class Ball {

  // Variables
  private PVector location;
  private PVector velocity;
  private PVector acceleration;
  public float mass;

  // Constructor
  Ball(PVector primaryLocation, float mass) {
    location = new PVector(primaryLocation.x, primaryLocation.y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    this.mass = mass;
  }

  // Apply Force
  void applyForce(PVector force) {
    acceleration.add(PVector.div(force,mass));
  }

  // Move Function
  void move() {
    velocity.add(acceleration);
    location.add(velocity);
  
    // Reset Acceleration
    acceleration.mult(0);
  }

  // Display Function
  void display() {
    fill(127);
    stroke(2);
    ellipse(location.x, location.y, mass * 12, mass * 12);
  }

  // Check Edges Function
  void checkEdges() {
    // 0 & Width
    if (location.x > width) {
      velocity.x *= -1;
      location.x = width;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    // 0 & height
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    } else if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
  }
}
