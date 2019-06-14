class Rain {
  //declare variables
  float xPosRain;
  float yPosRain;
  float rainSpeed;

  Rain() {
    //define variables
    xPosRain = random(0, width);
    yPosRain = random(60, height);
    rainSpeed = random(1, 8);
  }


  void mvmt() {
    //define movement
    yPosRain += rainSpeed;
    if (yPosRain>height) {
      yPosRain = random(60, height);
    }
  }

  void display() {
    //Make one raindrop
    stroke(0, 0, 255, 90);
    line(xPosRain, yPosRain, xPosRain, yPosRain+7);
  }
}
