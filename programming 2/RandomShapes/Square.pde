class Square extends Shape {
  
  Square(float x, float y, float size, color colour)
  {
    super(x,y,size,colour);
  }
  
  void render()
 {
   fill(colour);
   square(x,y,size*2);
 }
}
