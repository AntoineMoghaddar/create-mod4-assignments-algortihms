void setup() {
  int theSum = 0;
  int[] many = new int[1000];

  for (int i = 0; i<many.length; i++) {
    many[i] = int(i * 5);
    theSum+=many[i];    
  }  
  println(theSum);
}
