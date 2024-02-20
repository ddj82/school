package study;

import java.util.*;
import java.util.*;

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

//        int[] num_list = {-1, 2, 5, 6, 3};
//            int answer = 0;
//            int a = 0;
//            int b = 0;
//
//            for (int i = 0; i < num_list.length; i++) {
//                if (i % 2 == 1) {
//                    b += i;
//                    System.out.println("b: " + b + ", " + i);
//                } else {
//                    a += i;
//                    System.out.println("a: " + a + ", " + i);
//                }
//            }
//            answer = Math.max(a, b);
//        System.out.println(answer);
//
//        int[] arr = {1, 0, 0, 1, 0, 0};
//        int[] arr1 = {0, 0, 0, 1};
//        int[] arr2 = {1, 1, 1, 1, 0};
//        int idx = 4;
//        int idx1 = 1;
//        int idx2 = 3;
//        int a = 0;
//        for (int i = 0; i < arr1.length; i++) {
//            if (i >= idx1) {
//                if (arr1[i] != 0) {
//                    a = i;
//                }
//            }
//        }
//        String my_string = "hello";
//        String answer = "";
//        int num1 = 1;
//        int num2 = 2;
//        char c = my_string.charAt(num1);
//
//        for (int i = 0; i < my_string.length(); i++) {
//            if (i == num1) {
//                answer += my_string.charAt(num2);
//            } else if (i == num2) {
//                answer += c;
//            } else {
//                answer += my_string.charAt(i);
//            }
//        }
//        String my_string = "hi12392";
//        String s = "";
//        List<Integer> a = new ArrayList<>();
//        for (int i = 0; i < my_string.length(); i++) {
//            if (Character.isDigit(my_string.charAt(i))) {
//                s += my_string.charAt(i);
//                a.add(Integer.parseInt(s));
//                s = "";
//            }
//        }
//        System.out.println(Arrays.toString(a.stream().mapToInt(i -> i).toArray()));
//        int[] answer = a.stream().mapToInt(i -> i).toArray();
        int n = 10;
        List<Integer> a = new ArrayList<>();
        a.add(n);
        while (true) {
            if (n % 2 == 0) {
                n = n / 2;
                a.add(n);
            } else {
                n = (3 * n) + 1;
                a.add(n);
            }
            if (n == 1) {
                break;
            }
        }
        System.out.println(Arrays.toString(a.stream().mapToInt(i -> i).toArray()));
        String s = "asdfg";
//        Character.toString(s.charAt(1)).equals("s");
        if (s.charAt(1) == '1') {

        }
        System.out.println(s.charAt(0) + 1);
    }
}
