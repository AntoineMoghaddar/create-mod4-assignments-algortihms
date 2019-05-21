//Declare variables
PVector startingPoint;
PVector mousePoint;
PVector acceleration;
PVector position;
PVector gravitation;
PVector friction;
PVector mouseClick;
PVector mouseRelease;


void setup() {
  size(800, 800);
  background(0);
  startingPoint = new PVector(150, 250);
  position = new PVector(startingPoint.x, startingPoint.y);
  acceleration = new PVector(50, -35); // acceleration of your choice
  gravitation = new PVector(0, 9.81); // gravitation.y = 9.81 because of gravitation constant
  friction = new PVector(-1, 0.2);
  mouseClick = new PVector(0, 0);
  mouseRelease = new PVector(0, 0);
  ellipse(position.x, position.y, 20, 20); // draw the ellipse
}



void draw() {

  float d = dist(mouseClick.x, mouseClick.y, mouseRelease.x, mouseRelease.y);
 
  
  acceleration.add(gravitation);//add gravitation to your acceleration
  acceleration.add(friction);//add friction to your acceleration
  position.add(acceleration); // add the acceleration to the new position
  ellipse(position.x, position.y, 20, 20); // draw the ellipse
  fill(255);
}
void mousePressed() {
  mouseClick = new PVector(mouseX, mouseY);
  acceleration = new PVector(0,0);
}

void mouseReleased() {
  mouseRelease = new PVector(mouseX, mouseY);
}
