/*Antoine Moghaddar(s1880241) and Sven Bormans(s2154900) 
 Based on code of Daniel Shiffman 
 */

Flock flock;

void setup() {
  size(800,400);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 50; i++) {
    Boid b = new Boid(random(30,width/6),random(30,height/6));
    flock.addBoid(b);
  }
}

void draw() {
  background(255);
  flock.run();
  
  // Instructions
  fill(0);
  text("Drag the mouse to generate new boids.",10,height-16);
}

// Add a new boid into the System
void mouseDragged() {
  flock.addBoid(new Boid(mouseX,mouseY));
}
