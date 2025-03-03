int x = 50;
int y = 10;
int numberofcolumns = 5;
int numberofrows = 2;


size(300,300);


for(int columns = 0; columns <numberofcolumns; columns=columns+1) //loop to create columns //should create 3 columns
{
  
  
  for(int row = 0; row<numberofrows; row = row+1) //loop to create rows in each column // should create 10 rows
  {
    
    
  ellipse(x,y, 10,10); //creates first circle
  ellipse(x+20, y, 10,10); //create second circle
  line (x,y,x+20,y); //draws a line from circle to circle
  y = y+ 30; //increases y so it moves down
  
  
  }
  
  
x = x + 90; //increase x to move across
y = 10; 
}
