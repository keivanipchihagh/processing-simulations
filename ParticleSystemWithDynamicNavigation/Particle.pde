// Particle Object
class Particle {

  // Variables
  public PVector location;
  public PVector velocity;
  public PVector acceleration;
  public float mass;
  public float lifeSpan;

  // Constructor
  public Particle(PVector origin, PVector velocity) {
    // Initialize Variables
    this.location = origin.get();
    this.velocity = velocity;
    this.acceleration = new PVector();
    mass = 8.0;
    lifeSpan = 255.0;
  }

  // Apply Force Function
  public void applyForce(PVector force) {
    acceleration.add(PVector.div(force, mass));
  }

  // Run Function
  public void run() {
    move();
    display();
  }

  // Move Function
  public void move() {
    velocity.add(acceleration);
    location.add(velocity);

    lifeSpan -= 3;
    acceleration.mult(0);    // Reset Acceleration
  }

  // Is Dead Function
  public boolean isDead() {
    if (lifeSpan <= 0)
      return true;
    else
      return false;
  }

  // Display Function
  public void display() {
    fill(127, lifeSpan);
    stroke(0, lifeSpan);
    ellipse(location.x, location.y, mass * 1.5, mass * 1.5);
  }
}
