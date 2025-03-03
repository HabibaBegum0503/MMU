void setup() {
  size(480, 120);
}

void draw() {
  if (mousePressed) {
    ellipse(mouseX,mouseY,75,75);
    ellipse(mouseX,mouseY,50,50);
    ellipse(mouseX,mouseY,25,25);
  } else {
    fill(255);
  }
}
