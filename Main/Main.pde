ParticleSystem system;
Repeller repeller;

boolean debugger;

// Adjustable variables (Adjusting these will change performane & visual effects)
float minSpeed = -2;
float maxSpeed = 2;
float minParticleRadius = 5;
float maxParticleRadius = 10;
float minParticleCount = 200;
float maxParticleCount = 400;

float repellerMass = 10;
float repellerSight = 200;
float repellerForceMag = pow(10, 10);

void setup() {
  this.system = new ParticleSystem(int(random(minParticleCount, maxParticleCount)), new PVector(minParticleRadius, maxParticleRadius), new PVector(minSpeed, maxSpeed));
  debugger = false;

  // Window configs
  background(0);
  fullScreen(P3D);
  smooth();
}

void draw() {
  background(0);
  system.update();
  
  drawText();
}

void mouseMoved() {
  if (mouseX >= 0 && mouseX <= width && mouseY >= 0 && mouseY <= height) {
    this.repeller = new Repeller(new PVector(mouseX, mouseY), repellerMass, repellerSight);
    system.addRepeller(repeller, repellerForceMag, debugger);
  }
}

void keyPressed() {
  if (key == ' ')
    if (!debugger)
      debugger = true;
    else
      debugger = false;
}

void drawText() {
 fill(255);
 text("Press 'space' for debugger", 10, 20);
}
