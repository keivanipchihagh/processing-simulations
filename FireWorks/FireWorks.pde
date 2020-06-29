ArrayList<Firework> fireworks;

PVector gravity = new PVector(0, 0.2);
int coolDown;
boolean maneuver;
int fireWorksCount;
int X, Y, dir;
boolean debug;
int counter;
float chance;

void setup() {
  fullScreen();  
  fireworks = new ArrayList<Firework>();
  chance = 0.015;
  coolDown = 300;
  maneuver = false;
  fireWorksCount = 0;
  X = 0;
  Y = 0;
  dir = 1;
  debug = false;
  counter = 0;
  colorMode(HSB);
  background(51);
  pixelDensity(displayDensity());
}

void draw() {
  if (random(1) < chance) {
    fireworks.add(new Firework());
  }
  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);  

  for (int i = fireworks.size() - 1; i >= 0; i--) {
    Firework f = fireworks.get(i);
    f.run();
    if (f.done()) {
      fireworks.remove(i);
    }
  }

  // Display frame rate once in a while
  if (coolDown % 5 == 0)
    display();

  if (maneuver) {
    fireworks.add(new Firework(new PVector(X, Y)));
    X += ((width / fireWorksCount) * dir);
  }

  coolDown++;
  // Turn of maneuver to maintain frame rate 
  if (maneuver && coolDown > 200)
    maneuver = false;
}

// One random launch when clicked
void mouseClicked() {       
  fireworks.add(new Firework(new PVector(mouseX, mouseY)));
}

// Continues launches when dragged
void mouseDragged() {

  if (counter % 3 == 0 && coolDown > 300) {
    fireworks.add(new Firework(new PVector(mouseX, mouseY)));
  }
  counter++;

  if (counter > 300) {
    coolDown = 0;
    counter = 0;
  }
}

// Costume maneuvers
void keyPressed() {  

  fireWorksCount = (int)random(50, 60);  // Keep low for slower PCs

  if (key == '1' && coolDown > 300) {
    X = 0;
    Y = height;

    for (int i = 0; i < fireWorksCount; i++)
      fireworks.add(new Firework(new PVector(X += (width / (float)fireWorksCount), Y)));

    coolDown = 0;
  } else if (key == '2' && coolDown > 300) {    
    Y = height;
    maneuver = true;
    coolDown = 0;

    if ((int)random(2) == 0) {
      dir = 1;
      X = 0;
    } else {
      dir = -1;
      X = width;
    }
  } else if (key == ' ') {
    if (debug)
      debug = false;
    else
      debug = true;
  } else if (keyCode == UP)
    chance += 0.001;
  else if (keyCode == DOWN)
    chance -= 0.001;
}

void display() {
  fill(255);
  if (!debug)
    text("'space' to debug", 10, 20);
  else {
    text("FPS: " + (int)frameRate, 10, 20);
    text("Active Threads: " + fireworks.size(), 10, 35);
    text("Chance: " + chance, 10, 50);

    if (coolDown < 300) {
      text("Maneuver Status: WAIT", 10, 65);
      cursor(WAIT);
    } else {
      text("Maneuver Status: OK", 10, 65);
      cursor(ARROW);
    }
  }
}
