package study;

import java.util.Arrays;

public class Ex {
    public static void main(String[] args) {
        String my_string = " i    love  you";
        my_string = my_string.trim();
        String[] answer = my_string.split("\\s+");
        for (int i = 0; i < answer.length; i++) {
            System.out.print(answer[i] + " ");
        }
        System.out.println();
        System.out.println(answer.length);


    }
}
