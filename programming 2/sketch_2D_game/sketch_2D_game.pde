PImage background;// declaring the background image
int backgroundShown;
int lifeLine = 100;
knight player; // declaring player as class knight
Intruder intruder1;
Intruder intruder2;
Intruder intruder3;

void setup()
{
  size(800, 400);
  background = loadImage("startScreen.png");
  background.resize(width, height); // resizing to fit the screen
  player = new knight(700); // passing through value x to knight class
  intruder1 = new Intruder(40, height);
  intruder2 = new Intruder(100,height);
  intruder3 = new Intruder(200,height);

}

void draw() {
  image(background, 0, 0);
  player.render();
  intruder1.update();
  intruder2.update();
  intruder3.update();
  if (player.crash(intruder1.x, intruder1.y))
  {
    
  }
}

void keyPressed()
{
  if(key == 'q' || key == 'Q')
    {
      backgroundShown = 1;
      background = loadImage("castleWall.jpg");// assigning image to background
  background.resize(width, height); // resizing to fit the screen
  image(background, 0, 0);
  lifeLine = 100;
  
    }
  if (key == CODED)
  {
    
    if (keyCode == DOWN)
    {
      player.knightImage =1;
      player.x = player.x-10;
    } 
    else if (keyCode == UP)
    {
      player.knightImage = 2;
      player.x = player.x + 10;
    } 
     else if(keyCode == LEFT)
    {
      player.knightImage = 1;
      player.x = player.x -10;
    }
    else if (keyCode == RIGHT)
    {
      player.knightImage = 2;
      player.x = player.x +10;
    }
  }
}
