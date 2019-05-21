Exercises exercise;

void setup() {
  exercise = new Exercises();
}

void draw() {
  
  switch(keyCode) {
  case '1':  
    exercise.one();
    break; 
  case '2': 
    exercise.two();
    break; 
  case '3': 
    exercise.tree();
    break;
  case '4': 
    exercise.four();
    break;
  default:
    break;
  }
}
