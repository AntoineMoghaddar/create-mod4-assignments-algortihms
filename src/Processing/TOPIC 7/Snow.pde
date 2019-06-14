class Snow {
  //declare variables
  float snowX;
  float snowY;
  float snowSpeedH;
  float snowSpeedV;
  PImage snowflake1;
  float rotation1;
  float diameter;


  Snow(float x, float y, float sH, float sV) {
    //define variables
    snowflake1 = loadImage("goeie snow2.png");
    snowflake1.resize(20, 20);
    snowX = x;
    snowY = y;
    snowSpeedH = sH;
    snowSpeedV = sV;
  }


  void mvmt() {
    //define movement
    //snowX from left to right
    int sinus =0;
    snowSpeedH += random(-PI/50, PI/50);
    sinus += 5*sin(snowSpeedH);
    snowX +=  sinus;
    //snowY down
    snowY+= snowSpeedV;
  }

  void display() {
    //display one snowflake
    image(snowflake1, snowX, snowY);
  }

  void reset() {
    // Refresh snowflakes 
    if (snowY > width) {
      snowY =  60;
      snowX = random(0, width);
    }
  }

  void run() {
    display();
    mvmt();
    reset();
  }
}
