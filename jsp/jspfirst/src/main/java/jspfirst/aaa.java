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
		int i = 1, j = 13, k = 1;
        int answer = 0;
        String[] a = new String[(j - i) + 1];
        for (int z = 0; z < a.length; z++) {
            a[z] = "" + i;
            i++;
            System.out.println(a[z]);
        }
        for (int n = 0; n < a.length; n++) {
        	if (a[n].indexOf(("" + k)) >= 0) {
        		answer++;
        		if (a[n].equals((k + "" + k))) {
        			answer++;
        		}
        	}
        }
        System.out.println(answer);
	}

}
