package dbc0;

import java.sql.*;
import java.util.*;
import static mcd.db.JdbcUtil.*;

public class NmemberMain {

	public static void main(String[] args) {
		NmemberSVC nmemberSVC = new NmemberSVC();
		Scanner sc = new Scanner(System.in);
		
		while (true) {
			System.out.println("===== 로그인 =====");
			System.out.println("1. 회원로그인");
			System.out.println("2. 회원가입");
			System.out.println("3. 아이디찾기");
			System.out.println("4. 비밀번호찾기");
			System.out.println("5. 회원탈퇴");
			System.out.println("6. 종료하기");
			System.out.print("메뉴를 선택하세요 : ");

			int menu = Integer.parseInt(sc.next());
			switch (menu) {
			case 1:
				nmemberSVC.loginMember(sc);
				return;
			case 2:
				nmemberSVC.joinMember(sc);
				break;
			case 3:
				nmemberSVC.searchMemberId(sc);
				break;
			case 4:
				nmemberSVC.searchMemberPasswd(sc);
				break;
			case 5:
				nmemberSVC.deleteMember(sc);
				break;
			case 6:
				return;
			default:
				System.out.println("입력이 잘못되었습니다. 다시 입력해주세요.");
			}
		}
	}

}
