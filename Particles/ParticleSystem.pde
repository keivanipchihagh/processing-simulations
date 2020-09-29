class ParticleSystem {

  // Fields
  ArrayList<Particle> particles = null;

  // Constructor
  public ParticleSystem (int size, PVector radiusRange, PVector velocityRange) {
    this.particles = new ArrayList<Particle>();

    // Populate the system
    for (int i = 0; i < size; i++) {
      PVector initialLocation = new PVector(random(width), random(height));
      PVector initialVelocity = new PVector(random(velocityRange.x, velocityRange.y), random(velocityRange.x, velocityRange.y));
      float radius = random(radiusRange.x, radiusRange.y);

      particles.add(new Particle(initialLocation, initialVelocity, radius, velocityRange.x, velocityRange.y));
    }
  }

  // Updates each particles
  public void update() {
    for (Particle particle : particles) {
      particle.move();      
      particle.display();

      for (Particle mate : particles) {
        float distance = getDistance(particle.location, mate.location);

        if (distance < particle.sight) {
          particle.connect(mate, distance);
        }
      }
    }
  }

  public void addRepeller(Repeller repeller, float repellerForceMag, boolean debugger) {
    for (Particle particle : particles) {
      float distance = getDistance(particle.location, repeller.location);
      if (distance < repeller.sight)
        repeller.repel(particle, distance, repellerForceMag, debugger);
    }
  }

  // Calculates the distance between the two vectors
  private float getDistance(PVector loc1, PVector loc2) {
    return sqrt(pow(loc1.x - loc2.x, 2) + pow(loc1.y - loc2.y, 2));
  }
}
