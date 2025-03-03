//portfolio 2

// traffic jam

//rows of cars
  //singular row of cars
    // loop
      // draw a car
        //draw body of the car- rectangle
          // draw roof of car - rectangle
            // draw front wheel
              //draw back wheel
           
     
           
void setup() //program starts here
{
  size(500,500);
DrawRowOfCars(20,50,20,7);// calling the parameter DrawACar to create a car on the screen
DrawRowOfCars(20,100,30,5);
DrawRowOfCars(20,180,50,3);
DrawRowOfCars(20,300,85,2);
}


void DrawRowOfCars(int x, int y, int SizeOfCar, int NumberOfCars)//drawing row of cars
{
 for(int CarNum = 0; CarNum <NumberOfCars; CarNum = CarNum + 1)//loop to draw row of cars
 {
  DrawACar(x, y,SizeOfCar);
   x = x +(SizeOfCar*3);
 }
}

void DrawACar(int x, int y, int SizeOfCar) // calls the other parameters so a car is drawn
{
  CarBody(x,y,SizeOfCar);
  CarRoof(x+(SizeOfCar/2), y, SizeOfCar/2);
  FrontWheels(x, y+SizeOfCar, SizeOfCar/2);
  BackWheels(x+(SizeOfCar*2),y+SizeOfCar,SizeOfCar/2);
}

void CarBody(int x, int y, int sizeofcar) // draws the body of the car - long rectangle at the bottom
{
  line(x, y, x + (sizeofcar * 2), y);
  line(x + (sizeofcar * 2), y, x + (sizeofcar * 2), y + sizeofcar);
  line(x + (sizeofcar * 2), y + sizeofcar, x, y + sizeofcar);
  line(x, y + sizeofcar, x , y);
}

void CarRoof(int x, int y, int sizeofroof) // draws the roof of the car - small rectangle at the top
{
  line(x, y, x + (sizeofroof * 2), y);
  line(x + (sizeofroof * 2), y, x + (sizeofroof * 2),y- sizeofroof);
  line(x + (sizeofroof * 2), y - sizeofroof, x, y - sizeofroof);
  line(x, y - sizeofroof, x, y);
}

void FrontWheels(int x, int y, int sizeofwheel)// drawing the front wheels of the car
{
  fill(10,10,10);
  ellipse(x,y,sizeofwheel,sizeofwheel);
    fill(255,255,255);
  ellipse(x,y,sizeofwheel/2,sizeofwheel/2);
 
 
}

void BackWheels(int locationX,int locationY, int sizeofwheel)//drawing the back wheels of the car
{
  fill(10,10,10);
  ellipse(locationX, locationY, sizeofwheel, sizeofwheel);
  fill(255,255,255);
  ellipse(locationX ,locationY,sizeofwheel/2,sizeofwheel/2);

}
