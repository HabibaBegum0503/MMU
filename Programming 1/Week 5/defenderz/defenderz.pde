PImage background; 
int bgX=0; //global variable background location
Defender player; // declared reference called player, which can point to defender object
ALIEN alien;
ALIEN alien2;
ALIEN alien3;


void setup() {
  size(800, 400);
  background = loadImage("spaceBackground.jpg");
  background.resize(width, height); //set image to be same size as the canvas
  player = new Defender(height/2);
  alien = new ALIEN(width, 40);
  alien2 = new ALIEN(width, 70);
  alien3 = new ALIEN(width, 100);
}


void draw ()
{
  drawBackground(); 
  player.render();
  alien.update();
}


void drawBackground()
{
  //scrolling background image
  image(background, bgX, 0); //draw image to fill the canvas
  //draw image again off the right of the canvas
  image(background, bgX+background.width, 0);    
  bgX = bgX- 4;

  if (bgX == -background.width) //if first image completely off the canvas
  {
    bgX=0; //reset back to initial value background
  }
}



void keyPressed()
{
  if (key == CODED)
    if (keyCode ==UP)
      player.y = player.y - 10;
    else if (keyCode == DOWN)
      player.y = player.y + 10;
}
