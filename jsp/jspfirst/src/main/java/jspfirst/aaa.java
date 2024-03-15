package jspfirst;

public class aaa {

	public static void main(String[] args) {
//		String myString = "aaaa";
//		String pat = "aa";
//		int answer = 0;
//		int c = 0;
//		System.out.println(myString.indexOf(pat, 1));
//		System.out.println(myString.indexOf(pat));
//		if (myString.indexOf(pat) >= 0) {
//			myString.indexOf(pat, pat.length());
//			System.out.println(myString.indexOf(pat, pat.length()));
//		}
//		System.out.println(myString.indexOf(pat, 4));
//        for (int i = 0; i < myString.length(); i++) {
//        	if (myString.indexOf(pat, c) >= 0) {
//        		i = myString.indexOf(pat, c);
//        		answer++;
//        	}
//        }
//        if (myString.indexOf(pat, c) >= 0) {
//        	c = myString.indexOf(pat, c);
//        	answer++;
//        	for (int i = c; i < myString.length(); i++) {
//        		if (myString.indexOf(pat, i) > c) {
//        			answer++;
//        		}
//        		c = myString.indexOf(pat, i);
//        	}
//        }
        
//        String[] mos = {".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."};
//        String letter = ".... . .-.. .-.. ---";
//        String answer = "";
//        String[] s = letter.split(" ");
//        for (int i = 0; i < s.length; i++) {
//        	for (int k = 0; k < mos.length; k++) {
//        		if (s[i].equals(mos[k])) {
//        			switch(k) {
//        			case 0: answer += "a"; break;
//        			case 1: answer += "b"; break;
//        			case 2: answer += "c"; break;
//        			case 3: answer += "d"; break;
//        			case 4: answer += "e"; break;
//        			case 5: answer += "f"; break;
//        			case 6: answer += "g"; break;
//        			case 7: answer += "h"; break;
//        			case 8: answer += "i"; break;
//        			case 9: answer += "j"; break;
//        			case 10: answer += "k"; break;
//        			case 11: answer += "l"; break;
//        			case 12: answer += "m"; break;
//        			case 13: answer += "n"; break;
//        			case 14: answer += "o"; break;
//        			case 15: answer += "p"; break;
//        			case 16: answer += "q"; break;
//        			case 17: answer += "r"; break;
//        			case 18: answer += "s"; break;
//        			case 19: answer += "t"; break;
//        			case 20: answer += "u"; break;
//        			case 21: answer += "v"; break;
//        			case 22: answer += "w"; break;
//        			case 23: answer += "x"; break;
//        			case 24: answer += "y"; break;
//        			case 25: answer += "z"; break;
//        			}
//        		}
//        	}
//        }
//		int i = 1, j = 13, k = 1;
//        int answer = 0;
//        String[] a = new String[(j - i) + 1];
//        for (int z = 0; z < a.length; z++) {
//            a[z] = "" + i;
//            i++;
//            System.out.println(a[z]);
//        }
//        for (int n = 0; n < a.length; n++) {
//        	if (a[n].indexOf(("" + k)) >= 0) {
//        		answer++;
//        		if (a[n].equals((k + "" + k))) {
//        			answer++;
//        		}
//        	}
//        }
//        System.out.println(answer);
//		String my_string = "aAb1B2cC34oOp";
//		char[] c = my_string.toCharArray();
//		char a = '1';
//		int b = 5;
//		System.out.println(Character.isDigit(a));
//		
//        String str = "";
//        char[] c = my_string.toCharArray();
//        for (int i = 0; i < c.length; i++) {
//            if (Character.isDigit(c[i])) {
//                str += c[i];
//                answer += Integer.parseInt(str);
//                str = "";
//            }
//        }
		
//		for (int i = 1; i <= a.length; i++) {
//			b[i] = i;
//		}
		
//		int[] a = {30, 10, 23, 6, 100};
//		
//		int[] b = new int[a.length];
//		int max = a[0];
//		int maxidx = 0;
//		int min = a[0];
//		int minidx = 0;
//		for (int i = 0; i < a.length; i++) {
//			if (a[i] > max) {
//				max = a[i];
//				maxidx = i;
//			}
//			if (a[i] < min) {
//				min = a[i];
//				minidx = i;
//			}
//		}
//		System.out.println(max);
//		System.out.println(maxidx);
//		System.out.println(min);
//		System.out.println(minidx);
//		
//		for (int i = 0; i < b.length; i++) {
//			b[i] = 2;
//		}
//		b[maxidx] = a.length;
//		b[minidx] = 1;
//		int c = 2; 
//		int q = 0;
//		// int[] a = {30, 10, 23, 6, 100};
//		for (int i = 0; i < a.length; i++) {
//			if (i != minidx && i != maxidx) {
//				q = a[i];
//				if (q < a[i + 1]) {
//					b[i + 1]++;
//				}
//			}
//		}
//		for (int i = 0; i < b.length; i++) {
//			System.out.println("b["+i+"]: " + b[i]);
//		}
//		int[] arr = {1, 2, 1, 4, 5, 2, 9};
//		int[] arr = {1, 2, 1, 2, 1, 10, 2, 1};
//		System.out.println(arr.length);
//		String s = "";
//		for (int i = 0; i < arr.length; i++) {
//			if (i == arr.length - 1) {
//				s += arr[i];
//			} else {
//				s += arr[i] + ",";
//			}
//		}
//		System.out.println(s);
//		System.out.println("첫번째 2 인덱스: " + s.indexOf("2") + ", 마지막 2 인덱스: " + s.lastIndexOf("2"));
		int answer = 0;
		String s = "10 Z 20 Z 1";
		String[] s1 = s.split(" ");
		int a = 0;
        for (int i = 0; i < s1.length; i++) {
        	System.out.println("s1[" + i + "] = " + s1[i]);
            if (!(s1[i].equals("Z"))) {
                a = Integer.parseInt(s1[i]);
                System.out.println("a = " + a);
                answer += a;
            } else {
                answer -= a;
            }
            System.out.println(answer);
        }
	}

}
