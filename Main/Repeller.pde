class Repeller {

  public PVector location;
  private float mass;
  public float sight;  

  public Repeller(PVector location, float mass, float sight) {
    this.location = location;
    this.mass = mass;
    this.sight = sight;
  }

  public void repel(Particle particle, float distance, float magnitude, boolean debugger) {
    PVector force = PVector.sub(particle.location, this.location);  // Draw a vector between the two
    force.normalize();  // Normalize force vector
    force = force.mult(magnitude / (distance * distance));

    // Apply Force
    particle.acceleration = force;
    
    if (debugger)
      drawForce(particle.location);
  }
  
  // Draw force
  private void drawForce(PVector location) {
    stroke(255, 0, 0);
    line(this.location.x, this.location.y, location.x, location.y); 
  }
}
