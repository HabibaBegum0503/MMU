PImage knight; // declaring the knight image

class knight
{
  final int y = 20; // the y value for knight won't chnage so it is a final integer
  int x;
  int knightImage;// value used to select the image of the knight needed

  knight(int x) // value of x needs to be passed through
  {
    this.x = x; // value of x declared above should be the same as the value passed through
  }

  void render() // procedure to make knight appear on screen
  {
    if (knightImage == 1)// if statements to select image
    {
      knight = loadImage ("knightLeft.png");
    } 
    else if (knightImage ==2)
    {
      knight = loadImage("knightRight.png");
    } 
    else
    {
      knight = loadImage ("knightLeft.png");
      // default image for start up as an image number isnt passed through straight away
    }

    knight.resize(60, 80);// resize image of knight to fit
    image(knight, this.x, y);// displaying image on the screen at coordinates passed through
  }
  
  
 boolean crash(int intruX, int intruY)
{
   return (abs(this.x-intruX) < 10   &&  abs(this.y-intruY) <10);
}
  
}
