class Particle {
  //describe var
  PVector locOriginal;
  PVector loc;
  PVector velocity;
  float lifeParticle;
  int choose2DObject;

  Particle(PVector startLocation) {
    //define var
    velocity = new PVector(random(-3, 3), random(-3, 3));
    loc = startLocation.copy();
    locOriginal = startLocation.copy();
    lifeParticle = 255.0;
    choose2DObject = int(random(3));
  }

  //combine 2 voids to 1 void
  void run() {
    update();
    display();
  }

  //update of the particle location and color
  void update() {
    loc.add(velocity);
    lifeParticle -= 2;
    float colorChangeMapped = map(-dist(loc.x, loc.y, locOriginal.x, locOriginal.y), -144, 0, 0, 255);
    float colorChangeMappedFlipped = map(dist(loc.x, loc.y, locOriginal.x, locOriginal.y), -144, 0, 0, 255);
    fill(255, colorChangeMapped, colorChangeMappedFlipped, lifeParticle);
  }

  void display() {
    stroke(0, lifeParticle*2); // disappearing stroke
    //define the 2D-Object
    if (choose2DObject == 0) {
      ellipse(loc.x, loc.y, 15, 15);
    } else if (choose2DObject ==1) {
      rect(loc.x, loc.y, 15, 15);
    } else if (choose2DObject ==2) {
      triangle(loc.x, loc.y+13, loc.x+7, loc.y, loc.x+11, loc.y+13);
    }
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
