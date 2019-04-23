package Java.Main;

import Java.Objects.W1A;

import java.util.Scanner;

public class Main {
    W1A w1a;
    Scanner sc = new Scanner(System.in);
    int opt;

    private void run() {
        w1a = new W1A();
        menu();
    }

    public void menupicker() {
        opt = sc.nextInt();
        while (opt != 9) {
            if (w1a.currentWord() != null) {
                switch (opt) {
                    case 1:
                        w1a.setWord();
                        break;
                    case 2:
                        w1a.letterByLetter();
                        w1a.printArray();
                        break;
                    case 3:
                        w1a.reverse();
                        w1a.printArray();
                        break;
                    case 4:
                        break;
                    case 5:
                        break;
                    default:
                        System.out.println("not a valid option :)");
                        break;
                }
            } else w1a.run();
            menu();
            opt = sc.nextInt();
        }
    }

    private void menu() {
        System.out.println("____________________________________");
        System.out.println("\tcurrentword:\t" + w1a.currentWord());

        System.out.println("1\tAdd word");
        System.out.println("2\treverse word");
        System.out.println("3\treverse word");
        System.out.println("4\toccurences character in word");
        System.out.println("5\tpalindrome word checker\n\n");
        System.out.println("9\tExit");
        System.out.println("____________________________________\n");
        System.out.println("Provide me with the menu-number of your choice");
        menupicker();
    }

    public static void main(String[] args) {
        new Main().run();
    }
}
