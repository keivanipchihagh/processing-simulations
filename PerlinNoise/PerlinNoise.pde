// Objects
Ball ball;

// Variables
float timeX = 0;
float timeY = 100;

void setup() {
  // Initialize Window
  size(640, 360);
  background(255);

  // Initialize Object
  ball = new Ball(width / 2, height/2);
}

void draw() {
  background(255);
  
  // Mapping Object's Properties
  ball.move((int)map(noise(timeX),0,1,0,width), (int)map(noise(timeY),0,1,0,height));
  ball.display();
  
  // Time Increment
  timeX += 0.005;
  timeY += 0.005;
}
