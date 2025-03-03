
int imageSize = 20; // varibale of imageSize so it can be chnaged to the desired width and height of the instance
Arrow arrow1; // declaring arrow1 as class type Arrow
Arrow arrow2;
Arrow arrow3;



void setup()
{
  size(500, 500); // size of the screen

  arrow1 = new Arrow((int)random(width), (int)random(height), imageSize);// passing arrow1 through constructor along with the paramters required
  arrow2 = new Arrow((int)random(width), (int)random(height), imageSize);// (int)random(width) will choose random integer from 0 to width of screen
  arrow3 = new Arrow((int)random(width), (int)random(height), imageSize);// (int)random(height) will chose random integer from 0 to height of scrren
}

void draw()
{
  background(125);// colouring the background to a dark grey
  arrow1.update();// calls the update procedure to move and render the instance arrow1
  arrow2.update();
  arrow3.update();
  arrow1.wallCrash(width, height);// calls procedure wallCrash to check if the instance has crashed into the sides of the screen
  arrow2.wallCrash(width, height);// passes the parameters into the procedure which are height and width of screen
  arrow3.wallCrash(width, height);

  if (arrow1.crash(arrow2))// this is calling the boolean function crash to check if arrow1 and arrow2 have collided
  {
    arrow1.arrowsCrashed();// this is calling the procedure arrowsCrashed so that arrow1 and arrow2 bounce off each other
    arrow2.arrowsCrashed();
  }

  if (arrow1.crash(arrow3))// this is calling the boolean function crash to check if arrow1 and arrow3 have collided
  {
    arrow1.arrowsCrashed();// calling procedure arrowsCrashed so arrow1 and arrow3 bounce off each other
    arrow3.arrowsCrashed();
  }

  if (arrow2.crash(arrow3))// this is calling the boolean function crash to check if arrow2 and arrow3 have collided
  {
    arrow2.arrowsCrashed();// calling procedure arrowsCrashed so arrow2 and arrow3 bounce off each other
    arrow3.arrowsCrashed();
  }
}
