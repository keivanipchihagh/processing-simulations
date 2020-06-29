class Wall {
  
  // Function: Display
  void display() {
    stroke(0, 50);
    strokeWeight(1);
    line(100, 100, width - 100, 100);
    line(100, 100, 100, height - 100);
    line(width - 100, 100, width - 100, height - 100);
    line(100, height - 100, width - 100, height - 100);
  }
}
