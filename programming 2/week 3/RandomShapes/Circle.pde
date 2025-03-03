class Circle extends Shape{  //circle inherits from class Shape

  Circle( float x, float y, float size, color colour) {
    super(x,y,size,colour);  //call constructor in parent class : Shape
  }

  void render() {
    fill( colour );
    ellipse( x, y, size*2, size*2 );
  }

 
}
