package study;

import java.util.Arrays;
import java.util.*;
import java.util.stream.*;

public class streamEx {
    public static void main(String[] args) {

        /* 1번
        List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);
        System.out.println(numbers.stream().map(i -> i * 2).collect(Collectors.toList()));
*/

        /* 2번
        List<String> words = Arrays.asList("apple", "banana", "orange", "grape", "kiwi");
        System.out.println(words.stream().filter(i -> i.length() >= 5).collect(Collectors.toList()));
        words.stream().filter(i -> i.length() >= 5).collect(Collectors.toList());
        */

        /* 3번
        List<String> words = Arrays.asList("hello", "world", "java", "stream", "example");
        System.out.println(words.stream().map(i -> i.toUpperCase()).collect(Collectors.toList()));
        words.stream().map(i -> i.toUpperCase()).collect(Collectors.toList());
        */

        /* 4번
        List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        System.out.println(numbers.stream().filter(i -> i % 2 == 0).collect(Collectors.toList()));
        numbers.stream().filter(i -> i % 2 == 0).collect(Collectors.toList());
*/
        List<String> words = Arrays.asList("hello", "world", "java", "stream", "example");
        System.out.println(words.stream().map(i -> new StringBuffer(i).reverse()).collect(Collectors.toList()));
        words.stream().map(i -> new StringBuffer(i).reverse()).collect(Collectors.toList());

    }
}
