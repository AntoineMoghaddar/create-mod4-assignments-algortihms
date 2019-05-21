void setup() {
  int count = 0;
  int[] many = new int[500];

  for (int i = 0; i<many.length; i++) {
    many[i] = int(random(0, 100));
    if (many[i] > 50) {
      count++;
    }  
  }
  println(count);
}
