Star[] starArray = new Star[50]; // array of 50 Stars
Circle[] circleArray = new Circle[50]; // array of 50 Circles

void setup() {
  size( 500, 500 );

  // create some random circles and stars
  for (int i = 0; i < circleArray.length; i++ ) {
    float x = random(width);
    float y = random(height);
    float size = random(height * 0.1);
    color colour = randomColour();

    circleArray[i] = new Circle(x, y, size, colour );
  }

  for (int i = 0; i < starArray.length; i++ ) {
    float x = random(width);
    float y = random(height);
    float size = random(height * 0.1);
    color colour = randomColour();
    
    int numPoints = (int)random( 4, 10 ); //!! different

    starArray[i] = new Star(x, y, size, colour, numPoints );
  }
} //end of setup

void draw() {
  background(255); // set background to white
  // draw the circles -> enhanced for loop
  for ( Circle circle : circleArray ) {
    circle.update();
  }
  // draw the stars
  for ( Star star : starArray ) {
    star.update();
  }
}
color randomColour() {
  return color( (int)random(256), (int)random(256), (int)random(256) );
}
