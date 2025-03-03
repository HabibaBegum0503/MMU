
class Arrow
{
  // members of the class
  float x, y; // location of the instance
  int imageSize; // this is the size the images width and height will be
  float speedX = 2.8;// this is the speed the image will move across the x axis
  float speedY = 2.2; // this is the speed the image will move across the y axis
  int xDirection =1; // this is the direction the arrow will move, left or right
  int yDirection = 1;// up or down
  PImage leftDown, leftUp, rightDown, rightUp; // declaring the images
  int random; // so a random image is chosen at start
  PImage currentArrow;// declaring the arrow's chosen image

  // constructor
  Arrow(float x, float y, int imageSize)// parameters x and y so I know where the image is
  {

    this.x = x;// assigning x in the class as the x parameter
    this.y = y; //assigning y in the class as the y parameter
    this.imageSize = imageSize; // assigning the imageSize in class as the imageSize in parameter

    leftDown = loadImage("ArrowLDown.png"); // assigning the chosen image to the corresponding variable
    leftDown.resize(imageSize, imageSize); // resizing the image to the chosen size - it is doing this for all possible images
    leftUp = loadImage("ArrowLUp.png");
    leftUp.resize(imageSize, imageSize);
    rightDown = loadImage("ArrowRDown.png");
    rightDown.resize(imageSize, imageSize);
    rightUp = loadImage("ArrowRUp.png");
    rightUp.resize(imageSize, imageSize);


    random = (int) random(5);// picking a random number so that a random arrow is chosen
    if (random == 1)
      currentArrow = leftDown;// if 1 is chosen the leftDown image will be assigned to the instance
    xDirection = xDirection * -1;
    if (random == 2)
      currentArrow = leftUp; // is 2 is chosen the leftUp image will be assigned to the instance
    yDirection = yDirection *-1;
    if (random ==3)
      currentArrow = rightDown;// if 3 is chosen the rightDown image will be assigned to the instance
    if (random == 4)
      currentArrow= rightUp;// if 4 is chosne the rightUp image will be assigned to the instance
    yDirection = yDirection *-1;
  }


  void render()
  {
    image(currentArrow, this.x, this.y);// this is to show the image on the screen and the location
  }

  void move()
  {
    this.x = this.x + (speedX*xDirection); // this will move the image x axis wise left or right by the speedX
    this.y = this.y +(speedY* yDirection);// this will move the image y axis wise up or down by the speedY
  }

  void update() // this is to update the image on the screen
  {
    move();// image is moved to a new location by the move procedure
    render();// image is displayed at the new location
  }

  void wallCrash(int width, int height) // this is to make the image bounce off the edges of screen
  {


    if (this.x > width-imageSize || this.x <imageSize)  // image hits left or right side of screen and should bounce off
    {
      xDirection *= -1; // this inverts the xdirection so it is moved in the opposite direction - from left to right || right to left
      if (this.x <imageSize) //this is to check if x is less than the imageSize - checking if has hit the x axis (top or bottom) at basically 0
      {
        currentArrow = rightDown; // if ths image hits x at 0 then the image rightDown will be the new image for the instance
      } else if (this.x > width -imageSize) // if x is greater than the width of the screen
      {
        currentArrow = leftUp; // leftUp becomes new image for the instance
      }
    }




    if (this.y>height - imageSize || this.y <imageSize)// if the instance hits the top or bottom of the screen it should bounce off
    {
      yDirection *= -1;// inverts yDirection so instance moves in opposite direction (top to bottom || bottom to top)

      if (this.y <imageSize) // if y is basically 0
      {
        currentArrow = leftDown; // leftDown is the new image assigned to the instance
      } else if (this.y >height -imageSize)// else if y is greater than the height
      {
        currentArrow = rightUp; // rightUp is the new image assigned to the instance
      }
    }
  }

  boolean crash(Arrow other)// this is to check is 2 instances have crashed
  {
    return (abs(this.x-other.x) < imageSize+10  &&  abs(this.y-other.y) < imageSize+10);
    // this finds the difference between x and y of both instances and compares to the value given
    // both equations must be true for a crash to occur
    // if both are true, TRUE will be returned else FALSE will be returned
  }



  void arrowsCrashed()
  {
    //I have split the screen into 4 squares
    // the if statments are checking which square the instance is in when crash occured and will chnage the chosen direction


    if ((this.x>=0) && (this.x<= width/2) && (this.y>=0) && (this.y<=height/2))// checks if instance is in the top left square
    {
      yDirection*=-1; // yDirection is inverted so it moves in opposite direction (top to bottom || bottom to top)
    }

    if ((this.x>=0) && (this.x<=width/2) && (this.y>height/2) && (this.y<=height))// checks if the instance is in the bottom left squre
    {
      yDirection = -1; // yDirection is inverted so it moves in opposite direction (top to bottom || bottom to top)
    }

    if ((this.x>width/2) && (this.x<=width) && (this.y>=0) && (this.y<=height/2))// checks if the instance is in the top right square
    {
      xDirection *=-1; // xDirection is inverted so it moves in opposite direction (left to right|| right to left)
    }

    if ((this.x>width/2) && (this.x<=width) && (this.y>height/2) && (this.y<=height))// checks if the instance is in the bottom right square
    {
      xDirection *=-1; // xDirection is inverted so it moves in opposite direction (left to right|| right to left)
    }
  }
}
