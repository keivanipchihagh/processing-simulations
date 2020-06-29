// Difining Objects
Ball[]  balls;
Gravity gravity;
Liquid liquid;

void setup() {
  // Initialize Window
  size(640, 360);
  background(255);  

  // Initializing Objects
  balls = new Ball[5];
  for (int i = 0; i < balls.length; i++)
    balls[i] = new Ball(new PVector(i * 120 + 70, height / 10), random(0.1, 3));

  gravity = new Gravity();
  liquid = new Liquid();
}

void draw() {
  // Reset Background
  background(255);  

  displayText();
  liquid.display();

  if (mousePressed)
    reset();

  // Apply Functions For Each Ball Object
  for (Ball ball : balls) {
    // Apply Gravity Force    
    ball.applyForce(PVector.mult(gravity.getForce(), ball.mass));

    // Apply Liquid Resistance Force
    if (liquid.contains(ball)) 
      ball.applyForce(liquid.drag(ball));

    // Ball's Functions
    ball.move();
    ball.checkEdges();
    ball.display();
  }
}

void displayText() {  
  text("Fluid Coefficient: 0.03 - Gravity: 0.07 - WF Involved", 10, 20);
  fill(0);
  text("Click To Reset Simulation", 10, 35);
}

void reset() {
  for (int i = 0; i < balls.length; i++)
    balls[i] = new Ball(new PVector(i * 120 + 70, height / 10), random(0.1, 3));
}
