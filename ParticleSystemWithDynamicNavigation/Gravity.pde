// Gravity Object
class Gravity {

  // Variables
  PVector force;

  // Constructor
  Gravity() {
    // Initialize Variables
    force = new PVector(0, 0.07);
  }

  // Get Force Function
  PVector getForce() {
    return force;
  }
}
