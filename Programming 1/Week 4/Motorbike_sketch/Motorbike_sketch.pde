Motorbike bike1; //declared refernece to motorbike object
//the reference name is bike1
Motorbike bike2;

void setup(){
  size(500,100); // width, height
  bike1 = new Motorbike(30, RED);
  //will create a motorbike object 
  bike2 = new Motorbike(70, BLUE);

}
void draw() {
  background(125);

bike1.update();

  bike2.update();
  if(bike1.finished())
  println("bike1 is the winner!");
  else
  println("Bike 2 is the winner!");
  
  
}
