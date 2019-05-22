/*Antoine Moghaddar(s1880241) and Sven Bormans(s2154900) 
 Based on code of Daniel Shiffman 
 */

//import library
import java.util.Iterator;

//describe classes
ParticleSystem ps;

ArrayList<ParticleSystem> systems;
boolean explosion;

void setup() {
  size(800, 800);
  //define arraylist
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
  background(255);

  // For each Particle ps in particleSystem, run that Particle ps
  for (ParticleSystem ps : systems) {
    ps.run();
    ps.addParticle();
  }
}
void mousePressed() {
  //if mouseClicked set boolean and add new ps
  explosion = true;
  systems.add(new ParticleSystem());
}
