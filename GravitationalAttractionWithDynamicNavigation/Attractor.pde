class Attractor {

  // Variables
  private PVector location;
  private float mass;
  private final float G = 2.2;

  // Constructor
  Attractor() {
    // Initialize Variables
    location = new PVector(width/2, height/2);
    mass = 4;
  }

  // Display Function
  void display() {
    stroke(2);
    fill(127);
    ellipse(location.x, location.y, mass*16, mass*16);
  }

  // Attract Function
  PVector attract(Mover mover) {
    // Calculate Attraction Force
    PVector force = PVector.sub(location, mover.location);
    float distance = force.mag();
    // Constrain Distance To ReEnforce Attraction Force!
    distance  = constrain(distance, 5.0, 20.0);
    force.normalize();
    
    // Calculate Strength
    float strength = G * mass * mover.mass / (distance * distance);    

    return force.mult(strength);
  }
}
