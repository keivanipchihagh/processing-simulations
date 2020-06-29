// Variables
int[] randomColumn;

void setup() {
  // Initialize Window
  size(640, 360);
  background(255);

  // Initialzie Variable
  randomColumn = new int[20];
}

void draw() {
  int randomIndex = (int)random(0, randomColumn.length);
  randomColumn[randomIndex]++;

  stroke(0);
  fill(50);
  int columnWidth = width / randomColumn.length;

  for (int i = 0; i < randomColumn.length; i++)
    rect(i * columnWidth, height, columnWidth, -5 * randomColumn[i]);
}
