// Confetti Object - Inherited From Particle
class Confetti extends Particle {

  // Constructor
  Confetti(PVector origin, PVector velocity) {
    super(origin, velocity);
  }

  // Inhrits run() From Parent

  // Display Function
  void display() {
    fill(127, lifeSpan);
    stroke(0, lifeSpan);

    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    rotate(atan(velocity.y / velocity.x));
    rect(0, 0, mass * 1.5, mass * 1.5);
    popMatrix();
  }
}
