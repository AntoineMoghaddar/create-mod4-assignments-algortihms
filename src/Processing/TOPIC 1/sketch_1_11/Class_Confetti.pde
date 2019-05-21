class Confetti {
  
  
  
  color c;        // a confetti has a colour
  float xpos;     // a confetti has an x-position
  float ypos;     // a confetti has an y-position
  float radius;    // a confetti has a radius;
  float dx;       // the confetti moves with some speed in x direction
  float dy;       // the confetti moves with some speed in y direction
  int id;         // a confetti knows here its number
  PVector location = new PVector(random(radius,width-radius),random(radius,height-radius));
  PVector velocity = new PVector(random(-3,4),random(-3,4));
  
  Confetti(int j) {  //constructor: gives values to the variables
    c= color(int(random(180,255)), int(random(0,150)), int(random(100,200)));  //pinkish
    
    radius=random(10,25);
    location.add(velocity);
    
  }
    
  void draw_confetti() {
 
    //noStroke();
    fill(c);
    ellipse(location.x,location.y,2*radius,2*radius);
  }
  
  void move_confetti() {
    //if the confetti reaches the left wall or the right wall, it bounces
    if ((location.x>width-radius-velocity.x) || (location.x<radius-velocity.x))  velocity.x=-velocity.x;
    location.x+= velocity.x;
    //if the confetti reaches the top wall or the botton wall, it bounces
    if ((location.y>height-radius-velocity.y) || (location.y<radius-velocity.y))  velocity.y=-velocity.y;
    location.y+= velocity.y;
  }
  
  void collide() {
    // compare each confetti with all confettis having a higher index
    // where the actual highest index is i
    for (int j = id + 1; j < i; j++) {
      float distx = confs[j].location.x+confs[j].velocity.x - location.x-dx;
      float disty = confs[j].location.y+confs[j].velocity.y - location.y-velocity.y;
      float distance = sqrt(distx*distx + disty*disty);
      float minDist = confs[j].radius + radius;
      
      if (distance < minDist) {    // physics of collission
        float angle = atan2(disty, distx);
        float sine = sin(angle);
        float cosine = cos(angle); 

        
        float ax = cosine * velocity.x + sine * velocity.y;
        float ay = cosine * velocity.y - sine * velocity.x;
        
        velocity.x = ax;                   // change of the movement vector of the calling object
        velocity.y = ay;
        
        ax = cosine * confs[j].velocity.x + sine * confs[j].velocity.y;
        ay = cosine * confs[j].velocity.y - sine * confs[j].velocity.x;
        
        confs[j].velocity.x = ax;          // change of the movement vector of the other object 
        confs[j].velocity.y = ay;
      }
    }   
  }
  
}
