class Wind {
  // Variables
  private PVector force;

  // Constructor
  Wind() {
    // Initializing Coefficient    
    force  = new PVector(0.01, 0);
  }

  // Returning Force
  PVector getForce() {
    return force;
  }
}
