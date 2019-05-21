//Declare variables

int startingPoint = 300; // fill in the startingPoint u want
PVector acceleration;
PVector position;
PVector gravitation;
PVector friction;

void setup() {
  size(800, 800);
  background(0);

  //define Variables
  position = new PVector(0, startingPoint);
  acceleration = new PVector(50, -35); // acceleration of your choice
  gravitation = new PVector(0, 9.81); // gravitation.y = 9.81 because of gravitation constant
  friction = new PVector(-1, 0.2);
  ellipse(position.x, position.y, 20, 20);
  
}

void draw() {
  fill(255);
  acceleration.add(gravitation);//add gravitation to your acceleration
  acceleration.add(friction);//add friction to your acceleration
  position.add(acceleration); // add the acceleration to the new position
  ellipse(position.x, position.y, 20, 20); // draw the ellipse
}
