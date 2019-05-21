void setup() {
  float everything = 0;
  float[] many = new float[1000];
  float[] more = new float[1000];

  for (int i = 0; i<many.length; i++) {
    many[i] = int(i * 5);
    more[i] = int(i * 3);
  }
  for (int i = 0; i<many.length; i++) {
    for (int z = 0; z<more.length; z++) {
      if (many[i]== more[z]) {
        many[i] = 0;
        everything += many[i] + more[i];
      }
    }
  }
  println(everything);

}
