abstract class Shape{
  float x, y; // position
  float size; // radius
  color colour; // Processing colour representation
  float xt, yt; // target point - used by move method 
  
  Shape( float x, float y, float size, color colour) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.colour = colour;
    // set a target to move towards
    xt = x;
    yt = y;
  }
  
 abstract void render();

  
  void update() {
    move();
    render();
  }
  
   void move() {
    // is the centre close to the target?
    if ( (x-xt)*(x-xt) + (y-yt)*(y-yt) < 1 ) {
      // choose a new target
      xt = x + random( -50, 50 );
      yt = y + random( -50, 50 );
    }
    // move towards target
    x = xt * 0.05 + x * 0.95;
    y = yt * 0.05 + y * 0.95;
  }
}
