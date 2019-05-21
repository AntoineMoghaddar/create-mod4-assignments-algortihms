/*Made by Antoine Moghaddar(s1880241) and Sven Bormans(s2154900)*/

// define var
float sd;
void setup() {

  size(640, 360);
  background(255);
  sd = 100; //  standard deviation
}

void draw() {
  // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0

  float xloc = randomGaussian(); // new xPosition
  float yloc = randomGaussian(); // new yPosition

  float mean = width/2; 
  float offsetHeight = height/2;// Define a mean value (middle of the screen along the x-axis)

  xloc = ( xloc * sd ) + mean;  // Scale the gaussian random number by standard deviation and mean
  yloc = ( yloc * sd ) + offsetHeight;  // Scale the gaussian random number by standard deviation and mean

  PVector v1 = new PVector(xloc, yloc);  // new vector  = new ellipse
  PVector v2 = new PVector(width/2, height/2); // make new vector = middle
  float distance = (v1.dist(v2)*3)/7; // look to distance between new ellipse and middle(v2)
  float size = 200/distance; // define size of new ellipse

  fill(255, 20, 147, 70);
  noStroke();
  ellipse(xloc, yloc, size, size);   // Draw an ellipse at our "normal" random position
}
