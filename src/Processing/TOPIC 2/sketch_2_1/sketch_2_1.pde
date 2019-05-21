/*Made by Antoine Moghaddar(s1880241) and Sven Bormans(s2154900)*/

//define variable
int[] diceRolls= new int[10000];//insert how many dice rolls
int[] nums = {0, 0, 0, 0, 0, 0};
String[] element = {"one", "two", "three", "four", "five", "six"};

  void setup() {
  }

  void draw() {
  }

  void manyDiceRoll() {
    //choose random number and give length to nums
    for (int i = 0; i<diceRolls.length; i++) {
         switch(int(random(1, 7))) {
            case 1: nums[0]++;break;
            case 2: nums[1]++;break;
            case 3: nums[2]++;break;
            case 4: nums[3]++;break;
            case 5: nums[4]++;break;
            case 6: nums[5]++;break;
          }
    }
    // print the occurence of length of all nums
    for (int i = 0; i < nums.length; i++) {
      println("The occurence of " + element[i] + " is " + nums[i] );
    }
    println("");
}

void mousePressed() {
  //if mousePresses start programm
  manyDiceRoll();
}
