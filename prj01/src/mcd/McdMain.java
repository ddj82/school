package mcd;

import java.util.*;

public class McdMain {

	public static void main(String[] args) {
		McdSVC mcdSVC = new McdSVC();
		McdOrderSVC mcdOrderSVC = new McdOrderSVC();
		Scanner sc = new Scanner(System.in);
		
		int num = 0;
		while (true) {
			System.out.println("메뉴는 모두 번호로 입력해주세요.");
			System.out.println("[메인] 1.상품관련 , 2.주문관련, 3.종료");
			num = sc.nextInt();
			switch (num) {
			case 1: {
				mcdSVC.getMcdSVC(sc);
				break;
			}
			case 2: {
				mcdOrderSVC.getMcdOrderSVC(sc);
				break;
			}
			case 3: {
				System.out.println("프로그램을 종료합니다.");
				return;
			}
			}
		}
	}

}
