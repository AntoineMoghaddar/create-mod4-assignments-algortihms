// each of these subclasses of Screen
// defines one state of the statemachine
//declare classes
AudioPlayer musicRain;
AudioPlayer rainSound;
Rain[] rain = new Rain[250];

//declare variables
PImage clouds;
float xPosCloud;
float xPosCloud2;
float xPosCloud3;
float yPosCloud;
int xSpeed;
int xSpeed2;
int xSpeed3;

class State3 extends Screen {
  State3(ScreenState[] nextStates) {
    //define variables
    super(nextStates);
    musicRain = minim.loadFile("Sad-instrumental-music.mp3");
    rainSound = minim.loadFile("Rain-on-concrete.mp3");
    musicRain.loop();
    rainSound.loop();
    musicRain.mute();
    rainSound.mute();

    backgroundPicture = loadImage("maxresdefault.jpg");
    clouds = loadImage("cloud_PNG24.png");
    clouds.resize(600, 200);
    xPosCloud = 0;
    xPosCloud2 = 200;
    xPosCloud3 = 100;
    yPosCloud = -100;
    xSpeed = xSpeed2 =1;
    xSpeed3=-1;
    //make the raindrops
    for (int i=0; i<rain.length; i++) {
      rain[i] = new Rain();
    }
  }

  void draw() {
    musicRain.unmute();
    rainSound.unmute();
    Background();
    rain();
    fill(110);
    text("Oohnoo now it's raining....\n Press n for snow.... \n if you prefer better weather (like everyone else) press any other key", 20, 20);
  }

  void reset() {
    // empty
  }

  void handleKeyPress() {
    musicRain.mute();
    rainSound.mute();
    // called by keyPressed() from main
    // conditional transition to a successor state - here with an interaction condition
    // also, here are two different possible successor states

    if (key == 'n') {
      goToState(nextStates[0]);
    } else {
      goToState(nextStates[1]);
    }
  }
  void Background() {
    //start music and draw background
    backgroundPicture.resize(width+200, height+112);
    image(backgroundPicture, 0, 0);
    fill(0, 50);
    rect(0, 0, width, height);
  }

  void rain() {
    //draw the rain and clouds
    for (int i=0; i<rain.length; i++) {
      rain[i].display(); 
      rain[i].mvmt();
    }
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
  }
}
