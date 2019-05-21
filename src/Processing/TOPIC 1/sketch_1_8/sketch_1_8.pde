void setup() {
  for (int i = 0; i<6; i++) {
    for (int z = i+1 ; z<7; z++) {
      for (int k = z+1; k<8; k++) {
        for (int s = k+1; s<9; s++) {  
          print(i);
          print(z);
          print(k);
          println(s);
        }
      }
    }
  }
}
