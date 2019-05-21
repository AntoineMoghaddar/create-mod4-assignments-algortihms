
// The Nature of Code

// http://natureofcode.com

//Declare Variables
int cols, rows;
int scale ;
float increment;
float [][] terrain;
float w;
float h;
float moving;


void setup() {
  size(640, 600, P3D);

  //define variables
  scale = 15;
  increment = 0.2;
  w = 1200;
  h = 500;
  moving = 0;
  cols = width / scale; //define size of the map
  rows = height/scale;
  terrain = new float[cols][rows]; // define double array with the size of the map
}

void draw() {
  background(0);
  stroke(255);
  noFill();

  //rotate the point of view
  translate(w/2, h/2);
  rotateX(PI/3.5);
  translate(-w/2, -h/2);

  moving-=0.1;

  float yoff = moving; // Start xoff at 0
  for (int y = 0; y <rows; y++) {
    yoff += increment;   // Increment xoff 
    float xoff = 0.0;   // For every xoff, start yoff at 0
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);    
      xoff += increment; // Increment yoff
    }
  }

// make vertex in the shape of landscape;
  for (int y= 0; y<rows-1; y++) {
    beginShape(QUAD_STRIP);
    for (int x = 0; x<cols; x++) {
      vertex(x*scale, y*scale, terrain[x][y]); // x-line
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);//y-line
    }
    endShape();
  }
}
