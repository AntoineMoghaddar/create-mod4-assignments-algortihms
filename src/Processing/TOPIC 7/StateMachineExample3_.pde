/*Antoine Moghaddar(s1880241) and Sven Bormans(s2154900) 
 Based on code of David Stritzl & Angelika Mader
 */

//import libraries
import java.util.*;
import ddf.minim.*;

//classes
Minim minim;
ScreenStateMachine stateMachine;

void setup() {
  size(700, 394);
  minim = new Minim(this);
  Map<ScreenState, Screen> screens = new HashMap<ScreenState, Screen>();

  // the following sets up the structure of the state machine in the game
  // first, it matches the names of the ScreenStates to the instances of the game phase
  // second, it defines the list of successor screens for each screen (game phase)
  screens.put(ScreenState.STATE_1, new State1(new ScreenState[] {ScreenState.STATE_2}));// geeft de overgang aan --> 0 gaat naar screenstate 2
  screens.put(ScreenState.STATE_2, new State2(new ScreenState[] {ScreenState.STATE_3}));
  screens.put(ScreenState.STATE_3, new State3(new ScreenState[] {ScreenState.STATE_4, ScreenState.STATE_2}));
  screens.put(ScreenState.STATE_4, new State4(new ScreenState[] {ScreenState.STATE_1, ScreenState.STATE_3}));

  stateMachine = new ScreenStateMachine(screens, ScreenState.STATE_1);
}

void draw() {
  stateMachine.doAvailableTransitions();
  stateMachine.drawScreen();
}

void keyPressed() {
  stateMachine.handleKeyPress();
}

void mousePressed() {
  stateMachine.handleMousePress();
}
