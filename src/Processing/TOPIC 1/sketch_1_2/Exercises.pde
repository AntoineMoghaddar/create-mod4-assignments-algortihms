class Exercises {

  void one() {

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
    char[] word3 = "goedendag".toCharArray();
    println(word3);
  }

  void two() {

    //if (callMethod) {
    //method 1
    char[] word3 = "woow this is now backwards".toCharArray();
    for (int i =  word3.length -1; i>=0; i--) {
      println(word3[i]);
    }
  }

  void tree() {
    //method 1
    char[] word3 = "woow this is now backwards".toCharArray();
    char doubleLetter = 'w';
    int countOfLetter = 0;

    for (int i =  word3.length -1; i>=0; i--) {
      if (doubleLetter == word3[i]) {
        countOfLetter++;
      }
    }
    println("This word has  "+countOfLetter+ " W's");
  }

  void four() {
    //method 1
    char[] word3 ="woooow".toCharArray();
    boolean palindrome = true;
    for (int i = 0; i<word3.length/2; i++) {
      if (!(word3[i] == word3[word3.length-1-i])) {
        palindrome =false;
      }
    }
    println("palindrome = " + palindrome);
  }
}
