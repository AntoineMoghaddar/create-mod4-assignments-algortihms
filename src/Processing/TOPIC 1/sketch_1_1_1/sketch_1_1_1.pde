

void setup() {
  // method 1
  char[] word = {'g', 'o', 'e', 'd', 'e', 'n', 'd', 'a', 'g'}; 
  for (int i = 0; i<word.length; i++) {
    println(word[i]);
  }
  
  // method 2
  String word2 = "goedendag"; 
  char[] letters = word2.toCharArray();
  println(letters);
  
  //method 3
  char[] word3 = "goedendag3".toCharArray();
  println(word3);
 
}

void draw() {
}
