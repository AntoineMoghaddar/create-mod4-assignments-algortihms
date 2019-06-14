// each of these subclasses of Screen
// defines one state of the statemachine

AudioPlayer snowMusic;
Snow[] snow  = new Snow[250];
class State4 extends Screen {
  int points;
  int timer;

  State4(ScreenState[] nextStates) {
    super(nextStates);
    snowMusic =  minim.loadFile("Jingle_Bell_Rock.mp3");
    snowMusic.mute();
    snowMusic.loop();
    backgroundPicture = loadImage("maxresdefault.jpg");
    clouds = loadImage("cloud_PNG24.png");
    clouds.resize(600, 200);

    xPosCloud = 0;
    xPosCloud2 = 200;
    xPosCloud3 = 100;
    yPosCloud = -100;
    xSpeed = xSpeed2 =1;
    xSpeed3=-1;
    for (int i = 0; i < snow.length-1; i++) {
      snow[i+0] = new Snow(random(-300, width+300), random(60, height), 0, random(4));
    }
  }

  void draw() {
    snowMusic.unmute();
    Background();
    snow();
    fill(0);
    text("Way too cold this...\n Increase the temperature by hitting the n-button " + MAX_POINTS_4 + " times and bring back the sun \n or wait a few seconds for the rain to come back", 20, 20);
    text("the n-button is hit "+points+" times", 22, 80);

    // conditional transition to a successor state - here with a threshold condition
    // and also two different possible successor states 

    if (millis() - timer > TIME_GAME_4) {
      snowMusic.mute();
      goToState(nextStates[1]);
    }

    if (points >= MAX_POINTS_4) {
      snowMusic.mute();
      goToState(nextStates[0]);
    }
  }

  void reset() {
    points = 0;
    timer = millis();
  }

  void handleKeyPress() {
    // called by keyPressed() from main
    points++;
  }
  void Background() {
    //start music and draw background
    backgroundPicture.resize(width+200, height+112);
    image(backgroundPicture, 0, 0);
    fill(0, 50);
    rect(0, 0, width, height);
  }

  void snow() {
    //draw the snowflakes and clouds
    xPosCloud+= xSpeed;
    xPosCloud2+= xSpeed2;
    xPosCloud3+= xSpeed3;
    if (xPosCloud>width-400 || xPosCloud<-50) {    //bouncing clouds
      xSpeed = xSpeed *-1;
    } else if (xPosCloud2>width-400 || xPosCloud2<-50) {
      xSpeed2 = xSpeed2 *-1;
    } else if (xPosCloud3>width-400 || xPosCloud3<-50) {
      xSpeed3 = xSpeed3 *-1;
    }
    image(clouds, xPosCloud, yPosCloud);
    image(clouds, xPosCloud2, yPosCloud);
    image(clouds, xPosCloud3, yPosCloud);

    for ( int i = 0; i< snow.length-1; i++) { // snowflakes
      snow[i].run();
    }
  }
}
