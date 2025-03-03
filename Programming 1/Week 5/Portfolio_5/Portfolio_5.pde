PImage background = loadImage("spaceBackground.jpg");
int bgX = 0; // global variable background location




void setup()
{
  size(800, 400);
  background.resize(width, height);
}


void draw()
{
  drawBackground();
}

void drawBackground()
{
  //scrolling background image
  image(background, bgX, 0); //draw image to fill the canvas
  // draw image again off the right of the canvas
  image(background, bgX+background.width, 0);
  bgX = bgX - 4;
  
  if (bgX == - background.width)// if first image completely off canvas
    {
      bgX =0; // reset back to initial value background
    }
}
