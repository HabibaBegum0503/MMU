class Star extends Shape {
  int numPoints; // number of 'points' of the star   !!! Different

  Star( float x, float y, float size, color colour, int numPoints ) {
    super(x,y,size, colour);  //call constructor in parent class 
    
    this.numPoints = numPoints;  //!!!different
  }

  void render() {  // !!different
    fill(colour);
    float dTheta = (float) Math.PI / (float) numPoints;

    beginShape(); // start a filled polygon
    float theta = 0;
    for ( int i = 0; i <= numPoints; i++ ) {
      // add outer vertex 
      vertex( (float)(x + size * Math.cos( theta )), (float)(y + size * Math.sin(theta)) );
      theta += dTheta;
      // add inner vertex
      vertex( (float)(x + 0.5 * size * Math.cos( theta )), (float)(y + 0.5 * size * Math.sin(theta)) );
      theta += dTheta;
    }
    endShape(); // end filled polygon
  }
}
