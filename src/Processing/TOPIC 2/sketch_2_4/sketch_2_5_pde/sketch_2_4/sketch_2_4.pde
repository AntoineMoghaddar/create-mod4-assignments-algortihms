/* made with help from Michael Pinn

Antoine Moghaddar(s1880241) and Sven Bormans(s2154900)*/

// define new variables
ArrayList<Ellipses> ellipses = new ArrayList<Ellipses>(); //make new arraylist
PVector newEllipse; 
int rEllipse;
Ellipses ellipse = new Ellipses(new PVector(0, 0), 0);

void setup() {
  background(255);
  size(600,600);
  
  // starting point
  ellipses.add(ellipse); 
  newEllipse = new PVector(random(width), random(height));
}

void draw() {
  //display ellipse
  ellipse.display();
  int rEllipse =  (int)random(0, 100); // set ray new ellipse

// if collision make new variables
  while (detectAnyCollision (ellipses, newEllipse, rEllipse)) {
    newEllipse = new PVector(random(width), random(height));
    rEllipse = (int) random(0, 100);
  }

//if no collision add new ellipse
  ellipse = new Ellipses(newEllipse, rEllipse);
  ellipses.add(ellipse);
} 
