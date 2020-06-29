class Liquid {

  // Variables
  private float liquidWidth, liquidHeight;
  private PVector location;
  private float coefficient;

  // Constructor
  Liquid() {
    liquidWidth = width;
    liquidHeight = height / 2;
    location = new PVector(0, height / 2);
    coefficient = 0.03;
  }

  // Drag Function
  PVector drag(Ball ball) {
    // Get Object's Velocity
    PVector force = ball.velocity.get();
    // Normalize & Reverse
    force.normalize();
    force.mult(-1);
    // Calculate The Formula
    force.mult(pow(ball.velocity.mag(), 2) * coefficient);
    
    return force;
  }

  // Contains Function
  boolean contains(Ball ball) {
    return ball.location.y > location.y && ball.location.y < location.y + liquidHeight && ball.location.x > location.x && ball.location.x < location.x + liquidWidth;
  }

  // Display Function
  void display() {
    noStroke();
    fill(127);
    rect(location.x, location.y, liquidWidth, liquidHeight);
  }
}
