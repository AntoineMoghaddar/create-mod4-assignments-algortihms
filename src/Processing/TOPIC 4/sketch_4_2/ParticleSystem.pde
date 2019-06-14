class ParticleSystem {
  //describe var
  ArrayList<Particle> particles;
  PVector origin;

  //constructor + define var
  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }
  
  //make multiples particles
  void addParticle() {  
    //if explosion is true make 200 new particles on place of mouse
    if (explosion) {
      origin = new PVector(mouseX, mouseY);
      for (int i = 0; i<200; i++) {
        particles.add(new Particle(origin));
      }
    }
    //return false
    explosion= false;
  }

  //make the particles and delete the older particles
  void run() {
    Iterator<Particle> it =
      particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isGone()) {
        it.remove();
      }
    }
  }
}
