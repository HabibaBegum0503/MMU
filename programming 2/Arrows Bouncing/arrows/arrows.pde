int width = 500;
int height = 500;
Arrow arrow1;

  
void setup()
{
size(600,600);
  arrow1 = new Arrow(400,100);
  
}

void draw()
{
background(125);
arrow1.update();
arrow1.wallCrash(width,height);
}
