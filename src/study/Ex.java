package study;

import java.util.Arrays;

public class Ex {
    public static void main(String[] args) {
//        String my_string = " i    love  you";
//        my_string = my_string.trim();
//        String[] answer = my_string.split("\\s+");
//        for (int i = 0; i < answer.length; i++) {
//            System.out.print(answer[i] + " ");
//        }
//        System.out.println();
//        System.out.println(answer.length);

//        int[][] parts = {{0, 4}, {1, 2}, {3, 5}, {7, 7}};
////        System.out.println(parts[3][1]);
////        System.out.println(Arrays.toString(Arrays.stream(parts[3]).toArray()));
////        System.out.println(parts.length);
//        String[] my_strings = {"progressive", "hamburger", "hammer", "ahocorasick"};
//        String answer = "";
//        for (int i = 0; i < parts.length; i++) {
//            answer += my_strings[i].substring(parts[i][0], parts[i][1] + 1);
//        }
////        answer = my_strings[0].substring(parts[0][0],parts[0][1]);
//        int q = 2;
////        String s = my_strings[q].substring(parts[q][0], parts[q][1]);
////        System.out.println(s);
//        System.out.println(answer);
//        String mystring = "oxooxoxxox";
//        if (mystring.charAt(mystring.length() - 1) == 'x') {
//            mystring += " x";
//        }
//        System.out.println(mystring);
//        String[] ss = mystring.split("x");
//
//        for (int i = 0; i < ss.length; i++) {
//            System.out.print(ss[i] + ",");
//        }
//        System.out.println(".");
//        System.out.println(ss[5].length());
//        System.out.println(ss.length);

        int[] num_list = {-1, 2, 5, 6, 3};
            int answer = 0;
            int a = 0;
            int b = 0;

            for (int i = 0; i < num_list.length; i++) {
                if (i % 2 == 1) {
                    b += i;
                    System.out.println("b: " + b + ", " + i);
                } else {
                    a += i;
                    System.out.println("a: " + a + ", " + i);
                }
            }
            answer = Math.max(a, b);
        System.out.println(answer);
    }
}
