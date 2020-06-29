class Friction {
  
  // Vaiables
  private PVector force;
  private float coefficient;
  private float normal_force;

  // Constructor
  Friction() {
    // Initializing Coefficients
    coefficient = 0.01;
    normal_force = 1;
  }

  // Returing Force
  PVector getForce(PVector velocity) {
    // Get Object's Velocity    
    force = velocity.get();
    // Normilize And Reverse The Velocity
    force.normalize();
    force.mult(-1);
    // Add Coefficients
    force.mult(coefficient * normal_force);
    
    return force;
  }
}
