// Particle System Object
class ParticleSystem {  

  // Objects Declaration
  Gravity gravity;

  // Variables
  PVector origin;
  ArrayList<Particle> particles;
  float xNoise = 0;
  float yNoise = 10;

  // Constructor
  ParticleSystem(PVector origin) {

    // Initialize Variables
    this.origin = origin.get();
    particles = new ArrayList<Particle>();

    // Initialize Objects
    gravity = new Gravity();
  }

  // Add Particle Function
  void addParticle() {
    float chance = random(0, 1);

    if (chance <= 0.5)
      particles.add(new Particle(origin, new PVector(random(-2.5, 2.5), random(-2.5, 2.5))));
    else
      particles.add(new Confetti(origin, new PVector(random(-2.5, 2.5), random(-2.5, 2.5))));
  }

  // Run Function
  void run() {

    xNoise += 0.01;
    yNoise += 0.02;

    // Add Particle
    addParticle();

    // For Each Particle In The List
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle particle = particles.get(i);
      // Apply Force To Particle
      particle.applyForce(PVector.div(gravity.getForce(), particle.mass));
      // Run Particle Funtions
      particle.run();

      if (particle.isDead())
        particles.remove(i);
    }
  }
}
