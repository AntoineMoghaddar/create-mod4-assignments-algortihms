
/* Daniel Shiffman
 some  lines added by Antoine Moghaddar(s1880241) and Sven Bormans(s2154900)
 The Nature of Code
 http://natureofcode.com
 */

//define variables
float xoff = 0.24;
float yoff = 0.1;
float xincrement = 0.01; 
float yincrement = 0.02;

void setup() {
  size(200, 200);
  background(0);
  noStroke();
}

void draw() {

  // Create an alpha blended background
  fill(0, 10);
  rect(0, 0, width, height);

  // Get a noise value based on xoff and scale it according to the window's width
  float n = noise(xoff)*width;
  float i = noise(yoff)*height;

  // With each cycle, increment xoff
  xoff += xincrement;
  yoff+= yincrement;

  // Draw the ellipse at the value produced by perlin noise
  fill(200);
  ellipse(n, i, 16, 16);
}
