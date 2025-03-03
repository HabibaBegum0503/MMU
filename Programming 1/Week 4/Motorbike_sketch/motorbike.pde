final color RED = color(255,0,0); //colour red //final means it cant be chnaged once its been assigned - constant
final color BLUE = color(0,0,255); //colour blue

class Motorbike //class name must always be uppercase
{
  //instance variables
  //data
  //fields
  //properties
  //attributes
 int x = 5;  //members
 int y; //default value for int is 0
 int speed=2;
 int size=30;
 color colour;
 
 
//constructors are places after variables and befre methods
// default contructor - no args constructor - given by java
//motorbike()
//{
//}
// multiple contructors = contrcutor overloading = polymorphism

Motorbike(int y, color col) //signature: int, int
{
 this.y =y;
 this.colour = col;
}

Motorbike(int y) //signature:int
{
  this.y = y;
}

//methods, procedures an object of this type can perform
 void render()  //draws motorbike
 {
   float wheelHeight = size/3;
   fill(colour);
   triangle(x,y,x+size,y,x+size/2,y-size/2);  //built-in triangle routine
   drawWheel(x,y,wheelHeight);
   drawWheel(x+size,y,wheelHeight);
 }
 void move()
 {
  speed =(int)random(5);
  x = x +speed;// x+=speed
 }
 
 void update()
 {
 move();
 render();
 }
 
 
 void drawWheel(int x,int y,float size)
 {
    float inner = size*2/3;
    fill(0);
    ellipse(x,y,size,size);
    fill(255);
    ellipse(x,y,inner,inner);
 }
 
 boolean finished() // use this inside draw, to check if bike has finished
 {
    return x>(width-10); //screen width
 }

} //end of class description
