void setup() { //runs once at startup
size(500,500);
}

void draw() { // 60 times per second
fill( (random(255)), random(255), random(255));  // choosing random colours for the ellipse
ellipse(mouseX, mouseY, 50,50) ; // x, y,wdith,height  // drawing ellipse on mouse coordinates
}
