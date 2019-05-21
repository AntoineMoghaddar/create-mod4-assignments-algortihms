long number = 317584931803l;

void setup() {
  for (int i = 2; i< number; i++) {
    while (number%i == 0) {
      println(i);
      number = number/i;
    }
  }
  println(number);
}
