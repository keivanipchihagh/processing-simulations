class Gravity {
  // Variables
  private PVector force;

  // Constructor
  Gravity() {
    // Initializing Coefficient
    force  = new PVector(0, 0.1);
  }

  // Returning Force
  PVector getForce() {
    return force;
  }
}
