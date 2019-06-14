// each of these subclasses of Screen
// defines one state of the statemachine

AudioPlayer musicBegin;
class State1 extends Screen {
  //declare variables
  int timer;

  State1(ScreenState[] nextStates) {
    //define variables
    super(nextStates);
    musicBegin = minim.loadFile("bensound-happyrock.mp3");
    musicBegin.loop();
    musicBegin.unmute();
  }

  void draw() {
    //text with timer
    pushMatrix();
    translate(width/2, height/2);
    textSize(25);
    textAlign(CENTER);
    text("Welcome to the weather simulation.  ", 10, 0);
    int timeToGo = (TIME_GAME_1 - millis() + timer) / 1000;
    text("the simulation will start in...", 0, 35);
    text( timeToGo, 0, 65);
    popMatrix();

    //reset variables
    textAlign(LEFT);
    textSize(14);

    // conditional transition to a successor state - here with a timer condition
    if ((millis() - timer) > TIME_GAME_1) { 
      goToState(nextStates[0]);
      musicBegin.mute();
    }
  }

  void reset() {
    timer = millis();
  }
}
