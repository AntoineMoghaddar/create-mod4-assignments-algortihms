/*Antoine Moghaddar(s1880241) and Sven Bormans(s2154900) 
 Based on code of Daniel Shiffman 
 */
 
 //import library
import java.util.Iterator;

//describe classes
ParticleSystem ps;
Rocket rocket;

void setup() {
  size(640, 800);
  //define classes and give them the beginning vars
  ps = new ParticleSystem(new PVector(width/2, height));
  rocket = new Rocket(new PVector(width/2, height));
}

void draw() {
  background(255);
  //draw 6 particleSystems on the same spot
  for (int i = 0; i<5; i++) {
    ps.addParticle();
    ps.run();
    rocket.display();
  }
}
