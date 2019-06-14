// each of these subclasses of Screen
// defines one state of the statemachine

//declare variables
PImage backgroundPicture;
AudioPlayer musicSunny;
int rotationSun;
float sine;

class State2 extends Screen {
  State2(ScreenState[] nextStates) {
    //define variables
    super(nextStates);
    musicSunny = minim.loadFile("bensound-buddy.mp3");
    musicSunny.loop();
    musicSunny.mute();
    backgroundPicture = loadImage("maxresdefault.jpg");
    rotationSun=0;
    sine =0;
  }

  void draw() {
    Background();
    sunDrawing();
    rotate(-50);
    text("Press a key for rain", 250, 20);
  }

  void reset() {
    // empty
  }

  void handleKeyPress() {
    // called by keyPressed() from main
    // conditional transition to a successor state - here with an interaction condition
    musicSunny.mute();
    goToState(nextStates[0]); // 0 = verder, 1 = verder
  }

  void sunDrawing() {
    //draw the sun
    pushMatrix();
    rotationSun++;
    rotate(rotationSun);
    noStroke();
    for (int i=0; i<25; i++) {
      fill(255, 255, 0);
      rect(50, 0, 100, 10);
      rotate((2*PI)/25);
    }
    ellipse(0, 0, 150, 150);    
    rotate(2*PI/50);
    for (int k =0; k<25; k++) {
      fill(255, 165, 0);
      rotate(2*PI/25);
      rect(73, 0, 40, 10);
    }
    popMatrix();
  }

  void Background() {
    //start music and draw background
    backgroundPicture.resize(width+200, height+112);
    image(backgroundPicture, 0, 0);
    musicSunny.unmute();
    float brightness = 5*sin(sine);
    sine= sine+5;
    println(brightness);
    fill(255,255,255,60+brightness);
    rect(0,0,width,height);
  }
}
