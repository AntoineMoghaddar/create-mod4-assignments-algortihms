class ParticleSystem {
  //describe var
  ArrayList<Particle> particles;
  PVector origin;

  //constructor + define var
  ParticleSystem(PVector location) {
    particles = new ArrayList<Particle>();
    origin = location.copy();
  }

  //direction of the particleSystem
  void move() {
    origin.add(0, -0.3);
  }

  //make multiples particles
  void addParticle() {
    move();
    particles.add(new Particle(origin));
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
