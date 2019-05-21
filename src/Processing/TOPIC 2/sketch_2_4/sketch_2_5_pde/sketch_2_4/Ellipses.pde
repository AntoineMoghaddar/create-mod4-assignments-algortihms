class Ellipses {
  //define variables
  PVector loc;
  int d;
  
  //constructor
  Ellipses(PVector loc, int d) {
    this.loc = loc;
    this.d = d;
  } 

//display new ellipse
  void display() {
    fill(random(0,255),0,0);
    noStroke();
    ellipse(loc.x, loc.y, d, d);
  }

//check if collision bewtween new and old ellipses
  boolean detectCollision(PVector newEllipse, int rEllipse) {
    return dist(loc.x, loc.y, newEllipse.x, newEllipse.y) < (((d + rEllipse)/2)+2);
  }
}

//if collision is true return true
boolean detectAnyCollision(ArrayList<Ellipses> ellipses, PVector newEllipse, int rEllipse) {
  for (int i = 0; i<ellipses.size(); i++) {
    Ellipses c = ellipses.get(i);
    if (c.detectCollision(newEllipse, rEllipse)) {
      return true;
    }
  }
  return false;
}


  
