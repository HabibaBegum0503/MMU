int climber;


class Intruder
{

  int x;
  int y;
  int climb = 5;
  PImage Intruder1, Intruder2, Intruder3, currentIntruder;
  int counter = 0;
  int countDir=1;


    Intruder(int x, int y)
  {
    this.x = x;
    this.y = y;


    Intruder1 = loadImage("climber1.png");
    Intruder1.resize(60, 80);
    Intruder2 = loadImage("climber2.png");
    Intruder2.resize(60, 80);
    Intruder3 = loadImage("climber3.png");
    Intruder3.resize(60, 80);
    
  }


  void render()
  {
    if (counter>=0 && counter<=5) {
      image(Intruder1, this.x, this.y);
    } else if (counter>5 && counter<=15) {
      image(Intruder2, this.x, this.y);
    } else if (counter>15 && counter<=25)
    {
      image(Intruder3, this.x, this.y);
    } else
    {
      countDir = -countDir; //reverse sequence
    }
    counter = counter + countDir;
 
  }

  void move()
  {
    y = y- (int)random(climb);
    x = x+(int)random(-5, 5);
    if (y<0)
    {
      y = height;
    }
  }

  void update()
  {
   // if (this.y == 20)
  //  {
      //lifeLine = lifeLine - 10;
   // } else
   // {
      render();
      move();
  //  }
  }
}
