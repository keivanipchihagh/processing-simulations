class Ball {

  // Variables
  private PVector location;
  private PVector velocity;
  private PVector acceleration;
  private float mass;

  //Constructor
  Ball(PVector location, float mass) {
    this.location = location;
    velocity = new PVector(0, 0);
    acceleration = new PVector (0, 0);
    this.mass = mass;
  }

  // Apply Force Function
  void applyForce(PVector force) {
    acceleration.add(PVector.div(force,mass));
  }

  // Move Function
  void move() {
    velocity.add(acceleration);
    location.add(velocity);

    // Reset Acceleration Over The Frame
    acceleration.mult(0);
  }

  // Check Edges Function
  void checkEdges() {
    // Width
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }

    // height
    if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
    } else if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1;
    }
  }

  // Display Function
  void display() {
    fill(50, 100);
    stroke(2);
    strokeWeight(2);
    ellipse(location.x, location.y, mass*24, mass*24);
  }
}
