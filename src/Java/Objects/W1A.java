package Java.Objects;

import Java.Helperclasses.Antoine.Week1.Word;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Scanner;

public class W1A {
    private Scanner sc = new Scanner(System.in);
    private ArrayList<Character> chars;
    private String word;


    public void setWord() {
        System.out.println("Please provide me with a corresponding string below");
        word = sc.nextLine();
    }

    public String currentWord() {
        return word;
    }


    public ArrayList<Character> letterByLetter() {
        Word w = new Word(word);
        for (int i = 0; i < w.getWord().length(); i++) {
            chars.add(w.getWord().charAt(i));
        }
        return chars;
    }

    public void reverse() {
        Collections.reverse(chars);
    }

    public void run() {
        chars = new ArrayList<>();
        System.out.println("Please provide me with a corresponding string below");
        word = sc.nextLine();
    }

    public void printArray() {
        System.out.println();
        for (Character letter : chars) {
            System.out.println(letter);
        }
    }


}
