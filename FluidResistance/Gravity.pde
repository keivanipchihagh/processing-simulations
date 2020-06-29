class Gravity {
  
  // Variables
  private PVector force;

  // Construtor
  Gravity() {
    force = new PVector(0, 0.07);
  }

  PVector getForce() {
   return force; 
  }
}
