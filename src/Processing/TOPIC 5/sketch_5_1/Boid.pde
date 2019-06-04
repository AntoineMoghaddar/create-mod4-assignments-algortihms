// Boid class
// Methods for Separation, Cohesion, Alignment added

class Boid {

  PVector position;
  PVector positionEllipse;
  PVector velocity;
  PVector acceleration;
  float top;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float re; // r-ellipse

  Boid(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-0.8, 0.8), random(-0.8, 0.8));
    position = new PVector(x, y);
    top = 20.0;
    maxspeed = 3;
    maxforce = 0.05;
    positionEllipse = new PVector(width/2, height/2);
    re = 80;
  }

  void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    borders();
    render();
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    // Arbitrarily weight these forces
    sep.mult(1.1);
    ali.mult(1.1);
    coh.mult(1.0);
    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }

  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);  // A vector pointing from the position to the target
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    fill(175);
    stroke(0);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta +(0.5*PI));
    //draw fish
    beginShape();// top fish
    curveVertex(0, 0);
    curveVertex(0, 0);
    curveVertex(7, 3);
    curveVertex(16, 0); 
    curveVertex(16, 0);
    endShape();
    beginShape(); //buttom fish
    curveVertex(0, 0);
    curveVertex(0, 0);
    curveVertex(7, -3);
    curveVertex(16, 0); 
    curveVertex(16, 0); 
    endShape();
    beginShape(TRIANGLES);
    vertex(top, -3);
    vertex(15, 0);
    vertex(top, 3);
    endShape();
    ellipse(5, 0, 4, 4);
    endShape();
    popMatrix();

    ellipse(positionEllipse.x, positionEllipse.y, re, re);
  }

  // Wraparound
  void borders() { // maak hier boolean van xxxxxxx
    if ((position.x>width-top) || (position.x<+top))velocity.x = velocity.x *-1;
    if ((position.y>height-top) ||(position.y<+top)) velocity.y = velocity.y*-1;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 25.0f;
    float desiredseparation2 = 25.0f;

    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      float de = PVector.dist(position, positionEllipse);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if (((d > 0) && (d < desiredseparation))) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      } 
      
      //check if obstacle is too close
      else if ((de<(re+20)) && (de>0)) {
        PVector diff = PVector.sub(position, positionEllipse);
        diff.normalize();
        diff.div(de);       // Weight by distance
        diff.mult(9);
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average position (i.e. center) of all nearby boids, calculate steering vector towards that position
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all positions
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.position); // Add position
        sum.add(3, 3);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the position
    } else {
      return new PVector(0, 0);
    }
  }
}
