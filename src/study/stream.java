package study;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class stream {
    public static void main(String[] args) {

        /*
        * stream 중간 연산, 마무리 연산 등 기본 개념 알기
        * ::  참조 메소드 공부 하기
        * ->  람다 개념 공부 하기
        * */
        List<Integer> list = new ArrayList<Integer>();
        List<Integer> filteredList = new ArrayList<Integer>();

        list.add(1);
        list.add(1);
        list.add(2);
        list.add(2);
        list.add(3);
        list.add(3);
        list.add(3);

        System.out.println("========================================================");
        System.out.println(list);
        System.out.println(list.stream().distinct().collect(Collectors.toList()));

        System.out.println("========================================================");

        filteredList = list.stream().filter(i->i%2 == 0).collect(Collectors.toList());
        System.out.println(filteredList);

        System.out.println("========================================================");

        String[] arr = new String[]{"aa","bb", "cc","dd"};
        String a = Arrays.stream(arr).collect(Collectors.joining(""));
        System.out.println(a);

        System.out.println("========================================================");
    }
}
