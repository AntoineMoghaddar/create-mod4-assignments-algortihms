float w;
float h;
float moving;
float up;

void setup() {
  size(450, 600);
  w = width;
  h = height;
  up = w/2;
}

void draw() {
  background(0);
  noStroke();
  fill(255, 0, 0);

  //flame left

  moving-=0.01;

  float mvmt =0;
  float xoff = 0.01;   // For every xoff, start yoff at 0
  for (int x = 0; x<20; x++) {
    mvmt = noise(xoff);    
    xoff += 0.0002; // Increment yoff




    up+=mvmt;
    float xFlame = 50 *sin(up);
    println(xFlame);

    beginShape();


    curveVertex(w/2, h);
    curveVertex(w/2, h);
    curveVertex((w)/3, 480);
    curveVertex((xFlame), 50); // top flame
    curveVertex(w/2, h);
    endShape();

    //flame right
    beginShape();
    curveVertex(w/2, h);
    curveVertex(w/2, h);
    curveVertex(2*w/3, 480);
    curveVertex(w/2, 50); // top flame
    curveVertex(w/2, h);
    endShape();
  }
  delay(50);
}
