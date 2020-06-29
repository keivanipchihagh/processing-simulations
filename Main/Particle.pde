class Particle {

  // Fields
  public PVector location, velocity, acceleration;
  private color particleColor, lineColor;
  private float radius, sight, mass;
  private float maxSpeed, minSpeed;

  // Constructor
  public Particle(PVector location, PVector velocity, float radius, float minSpeed, float maxSpeed) {    
    this.location = location;
    this.velocity = velocity;    
    this.acceleration = new PVector();
    this.particleColor = color(200, 200, 200, 200);
    this.lineColor = color(100, 100, 100, 150);
    this.radius = radius;             
    this.maxSpeed = maxSpeed;
    this.minSpeed = minSpeed;

    this.mass = this.radius;
    this.sight = this.radius * 10;
  }

  // Move
  public void move() {
    // Chain reaction
    this.velocity.add(this.acceleration);

    velocity.x = constrain(velocity.x, minSpeed, maxSpeed);
    velocity.y = constrain(velocity.y, minSpeed, maxSpeed);

    this.location.add(this.velocity);

    // Checks if particle is out of bounds or not. If so, teleports it back in
    this.teleport();

    this.acceleration.mult(0);  // Reset Acceleration
  }

  // Teleport
  private void teleport() {
    // Adjust X-Axis
    if (this.location.x >= width)
      this.location.x = 0;
    else if (this.location.x <= 0)
      this.location.x = width;

    // Adjust Y-Axis
    if (this.location.y >= height)
      this.location.y = 0;
    else if (this.location.y <= 0)
      this.location.y = height;
  }

  private void attract(Particle particle, float distance) {
    PVector force = PVector.sub(particle.location, this.location);  // Draw a vector between the two
    force.normalize();  // Normalize it                

    if (distance == 0)
      distance = 0.1;
    force = force.mult(0.01 * this.mass * particle.mass / (distance * distance));

    // Apply Force
    this.acceleration.add(force);
  }

  // Connect
  public void connect(Particle particle, float distance) {

    // Draw a line between the two particles
    stroke(lineColor);
    line(this.location.x, this.location.y, particle.location.x, particle.location.y);

    // Attract
    this.attract(particle, distance);
  }

  // Display
  public void display() {
    noStroke();
    fill(particleColor);
    ellipse(location.x, location.y, radius, radius);
  }
}
