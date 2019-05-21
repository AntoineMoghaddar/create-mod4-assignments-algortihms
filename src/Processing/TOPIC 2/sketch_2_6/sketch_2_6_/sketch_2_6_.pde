
/* Daniel Shiffman
 some  lines added by Antoine Moghaddar(s1880241) and Sven Bormans(s2154900)
 The Nature of Code
 http://natureofcode.com
 */

//define variables
float increment = 0.02;
float xmvmt = 0, ymvmt = 0;



void setup() {
//define size
  size(640, 360);
}

void draw() {
  background(0);
  
  //define  movement
  xmvmt-= 0.1;
  ymvmt -=0.2;
  float xoff = xmvmt; // Start xoff at 0
  loadPixels();
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = ymvmt;   // For every xoff move to the buttom
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      // Calculate noise and scale by 255
      float bright = noise(xoff, yoff)*255;
      // Set each pixel onscreen to a grayscale value
      pixels[x+y*width] = color(bright);
    }
  }
  updatePixels();
}
