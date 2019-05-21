

void setup() {

  //method 1
  char[] word3 = "woow this is now backwards".toCharArray();
  for (int i =  word3.length -1; i>=0; i--) {
    println(word3[i]);
  }
}

void draw() {
}
