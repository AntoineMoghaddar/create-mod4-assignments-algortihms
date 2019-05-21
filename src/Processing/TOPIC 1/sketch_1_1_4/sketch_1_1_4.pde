

void setup() {

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
