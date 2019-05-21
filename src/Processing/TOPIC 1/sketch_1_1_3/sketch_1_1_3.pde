

void setup() {

  //method 1
  char[] word3 = "woow this is now backwards".toCharArray();
  char doubleLetter = 'w';
  int countOfLetter = 0;

  for (int i =  word3.length -1; i>=0; i--) {
    if (doubleLetter == word3[i]) {
      countOfLetter++;
    }
  }
  println(countOfLetter);
}

void draw() {
}
