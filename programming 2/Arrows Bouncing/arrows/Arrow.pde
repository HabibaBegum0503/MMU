
class Arrow
{
  // members of the class
  float x, y; // coordinates for the image
  float xDirection = 1;
  float yDirection =1;
  float speedX = 2.8;// speed the image will move
  float speedY = 2.2;
  PImage leftDown, leftUp, rightDown, rightUp; // declaring the images
  int random; // so a random image is chosen at start
  PImage currentArrow;

  // constructor
  Arrow(int x, int y)
  {

    this.x = x;
    this.y = y;

    leftDown = loadImage("ArrowLDown.png");
    leftDown.resize(20, 20);
    leftUp = loadImage("ArrowLUp.png");
    leftUp.resize(20, 20);
    rightDown = loadImage("ArrowRDown.png");
    rightDown.resize(20, 20);
    rightUp = loadImage("ArrowRUp.png");
    rightUp.resize(20, 20);


    random = (int) random(4);
    if (random == 1)
      currentArrow = leftDown;
    if (random == 2)
      currentArrow = leftUp;
    if (random ==3)
      currentArrow = rightDown;
    if (random == 4)
      currentArrow= rightUp;
  }


  void render()
  {
    image(currentArrow, this.x, this.y);
  }

  void move()
  {
    this.x = this.x + (speedX * xDirection);
    this.y = this.y + (speedY * xDirection);
  }

  void update()
  {
    move();
    render();
  }

  void wallCrash(int width, int height)
    // this is to make the image bounce off the edges of screen
  {
    if (this.x > width-20 || this.x <20)
      // image hits side of screen and should bounce off
    {
      xDirection = xDirection *-1;
      if (this.x <20)
      {
        currentArrow = rightDown;
        // if ths image hits left side of screen it will chnage to this specific image
      } else if (this.x > width -20)
      {
        currentArrow = leftUp;
        // if image hits right of screen it will chnage to this image
      }
    }
    if (this.y>height - 20 || this.y <20)
      // if image hits bottom of top of screen it should bounce
    {
      yDirection = yDirection * -1;
      if (this.y <20)
      {
        currentArrow = leftDown;
        // if the imgae hits the top it chnages to this image
      } else if (this.y >height -20)
      {
        currentArrow = rightUp;
        //if image hits the bottom it changes to this image
      }
    }
  }
}
