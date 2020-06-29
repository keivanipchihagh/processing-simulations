class Ball {
  // Variables
  PVector location;

  // Object Constructor
  Ball(int xLocation, int yLocation) {
    location = new  PVector(xLocation, yLocation);
  }

  // move Function
  void move(int xLocation, int yLocation) {
    location = new  PVector(xLocation, yLocation); 
    // Check Corners
    checkCorners();
  }

  // Display Function
  void display() {
    fill(50);
    noStroke();
    ellipse(location.x, location.y, 48, 48);
  }

  // Check Corners Function
  void checkCorners() {
    if (location.x + 24 >= width || location.x - 24 <= 0)
      location.x = width / 2;
    if (location.y + 24 >= height || location.y - 24 <= 0)
      location.y = height / 2;
  }
}
