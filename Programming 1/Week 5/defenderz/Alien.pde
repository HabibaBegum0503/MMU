
color ALIEN1 = color(0, 255, 0);

color ALIEN2 = color(50, 100, 0);




class ALIEN {
  int x ;
  int y;
  int step = 2;
  PImage crash = loadImage("crash.jpg");


  ALIEN(int x, int y)
  {
    this.x = x;
    this.y = y;
    crash.resize(30, 30);
  }


  void render() {

    fill(ALIEN1);

    ellipse(x, y, 30, 30);

    fill(ALIEN2);

    ellipse(x, y, 50, 15);
  }


  void move()
  {
    x=x-step;
    y=y+(int)random(-5, 5);
    if (x<0) {
      x = width;
    }
    //if (this.y >= height)
    // step = step* -1;
    //else if (this.y <=0)
    //{
    // step = 1;
    //}
    //this.y = this.y +step;
  }

  void update()
  {
    render();
    move();
  }


  void alienCrash(int y)
  {
    if ((this.x - 30) >20)
      if ((this.y - y) >20)
      image(crash,this.x, this.y);
    }
  }
