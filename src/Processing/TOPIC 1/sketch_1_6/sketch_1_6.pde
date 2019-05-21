void setup() {
  String bNumbers = "1,0,1,1,0,1";
  String[] bNumbersS = split(bNumbers, ",");
  float count = 0;
  int z = -1;
  for (int i = bNumbersS.length-1; i>=0; i--) {
    z++;
    if (bNumbersS[i].equals("1") == true) {
      count+= pow(2, z);
      //println(count);
    } else {
      count+=0;
    }
  }
  print(count);
}
