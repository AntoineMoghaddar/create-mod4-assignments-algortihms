class Particle {
  //describe var
  PVector locOriginal;
  PVector loc;
  PVector velocity;
  PVector acceleration;
  float lifeParticle;

  Particle(PVector startLocation) {
    //define var
    acceleration = new PVector(0, 0.1);
    velocity = new PVector(random(-0.75, 0.75), random(0, 0));
    loc = startLocation.copy();
    locOriginal = startLocation.copy();
    lifeParticle = 255.0;
  }

  //combine 2 voids to 1 void
  void run() {
    update();
    display();
  }

  //update of the particle location and color
  void update() {
    velocity.add(acceleration);
    loc.add(velocity);
    lifeParticle -= 3;
    float colorChangeMapped = map(-dist(loc.x, loc.y, locOriginal.x, locOriginal.y), -144, 0, 0, 255);
    fill(255, colorChangeMapped*2, 0, lifeParticle);
  }

  //define the 
  void display() {
    noStroke();
    ellipse(loc.x, loc.y, 15, 15);
  }

  //boolean for particle to die
  boolean isGone() {
    if (lifeParticle < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
