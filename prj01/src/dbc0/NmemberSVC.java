package dbc0;

import java.sql.*;
import java.util.*;
import static mcd.db.JdbcUtil.*;

public class NmemberSVC {
	Connection con;
	
	public NmemberVO getNmemberVO(Scanner sc) {
		System.out.println("회원가입 페이지입니다.");
		System.out.println("가입하실 아이디를 입력해주세요. \n(5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다)");
		System.out.print(": ");
		String n_id = sc.next();
		n_id += "@naver.com";
		
		System.out.println("비밀번호를 입력해주세요. \n(8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.)");
		System.out.print(": ");
		String n_passwd = sc.next();
		
		System.out.println("[선택] 이메일주소를 입력해주세요. (비밀번호 찾기, 본인 확인용)");
		System.out.println("입력을 원하지 않으시면 '다음'을 입력해주세요");
		System.out.print(": ");
		String n_subemail = sc.next().replace("다음", "");
		
		System.out.println("이름을 입력해주세요.");
		System.out.print(": ");
		String n_name = sc.next();
		
		System.out.println("생년월일 8자리를 입력해주세요.");
		System.out.print(": ");
		String n_age = sc.next();
		
		System.out.println("성별을 입력해주세요.");
		System.out.println("(남성이시면 1번, 여성이시면 2번)");
		System.out.print(": ");
		String n_gd = sc.next();
		if (n_gd.equals("1")) {
			n_gd = "남자";
		} else if (n_gd.equals("2")) {
			n_gd = "여자";
		}
		
		System.out.println("국적을 입력해주세요.");
		System.out.println("(내국인이면 1번, 외국인이면 2번)");
		System.out.print(": ");
		String n_nat = sc.next();
		if (n_nat.equals("1")) {
			n_nat = "내국인";
		} else if (n_nat.equals("2")) {
			n_nat = "외국인";
		}
		
		System.out.println("통신사를 입력해주세요.");
		System.out.println("(SKT는 1번, KT는 2번, LGU+는 3번, SKT알뜰폰은 4번, KT알뜰폰은 5번, LGU+알뜰폰은 6번)");
		System.out.print(": ");
		String n_hpcp = sc.next().toUpperCase();
		if (n_hpcp.equals("1")) {
			n_hpcp = "SKT";
		} else if (n_hpcp.equals("2")) {
			n_hpcp = "KT";
		} else if (n_hpcp.equals("3")) {
			n_hpcp = "LGU+";
		} else if (n_hpcp.equals("4")) {
			n_hpcp = "SKT알뜰폰";
		} else if (n_hpcp.equals("5")) {
			n_hpcp = "KT알뜰폰";
		} else if (n_hpcp.equals("6")) {
			n_hpcp = "LGU+알뜰폰";
		}
		
		System.out.println("핸드폰번호를 입력해주세요.");
		System.out.println("(-없이 11자리 숫자만 입력)");
		System.out.print(": ");
		String n_hp = sc.next();
				
		NmemberVO nmVO = new NmemberVO(n_id, n_passwd, n_subemail, n_name, n_age, n_gd, n_nat, n_hpcp, n_hp);
		
		return nmVO;
	}
	
	public void joinMember(Scanner sc) {
		NmemberVO nmVO = getNmemberVO(sc);
		
		con = getConnection();
		PreparedStatement ps = null;
			
		String sql = "INSERT INTO N_MEMBER VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, nmVO.getN_id());
			ps.setString(2, nmVO.getN_passwd());
			ps.setString(3, nmVO.getN_subemail());
			ps.setString(4, nmVO.getN_name());
			ps.setString(5, nmVO.getN_age());
			ps.setString(6, nmVO.getN_gd());
			ps.setString(7, nmVO.getN_nat());
			ps.setString(8, nmVO.getN_hpcp());
			ps.setString(9, nmVO.getN_hp());
			
			int count = ps.executeUpdate();
			if (count > 0) {
				System.out.println("회원가입 완료");
			} else {
				System.out.println("회원가입 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(con);
		}
			
	}
	
	public void loginMember(Scanner sc) {
		System.out.println("아이디를 입력하세요.");
		System.out.print(": ");
		String n_id = sc.next();
		n_id += "@naver.com";
		
		System.out.println("비밀번호를 입력하세요.");
		System.out.print(": ");
		String n_passwd = sc.next();
		
		NmemberVO nmVO = new NmemberVO(n_id, n_passwd);
		con = getConnection();
		PreparedStatement ps = null;
		
		String sql = "SELECT N_ID FROM N_MEMBER WHERE N_ID = ? AND N_PASSWD = ?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, nmVO.getN_id());
			ps.setString(2, nmVO.getN_passwd());

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				System.out.println("로그인 완료");
				System.out.print(rs.getString(1));
				System.out.println(" 님이 로그인 하셨습니다.");
			} else {
				System.out.println("로그인 실패");
			}
			
			close(rs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(con);
		}
	}
	
	public void searchMemberId(Scanner sc) {
		System.out.println("이름을 입력해주세요.");
		System.out.print(": ");
		String n_name = sc.next();
		
		System.out.println("생년월일 입력해주세요.");
		System.out.print(": ");
		String n_age = sc.next();
		
		con = getConnection();
		PreparedStatement ps = null;
		
		String sql = "SELECT N_ID FROM N_MEMBER WHERE N_NAME = ? AND N_AGE = ?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, n_name);
			ps.setString(2, n_age);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				System.out.print("가입하신 아이디는 '");
				System.out.print(rs.getString(1));
				System.out.println("' 입니다.");
			} else {
				System.out.println("찾을 수 없는 회원입니다.");
			}
			
			close(rs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(con);
		}
	}
	
	public void searchMemberPasswd(Scanner sc) {
		System.out.println("아이디를 입력해주세요.");
		System.out.print(": ");
		String n_id = sc.next();
		n_id += "@naver.com";
		
		System.out.println("이름을 입력해주세요.");
		System.out.print(": ");
		String n_name = sc.next();
		
		System.out.println("생년월일 입력해주세요.");
		System.out.print(": ");
		String n_age = sc.next();
		
		con = getConnection();
		PreparedStatement ps = null;
		
		String sql = "SELECT N_PASSWD FROM N_MEMBER WHERE N_ID = ? AND N_NAME = ? AND N_AGE = ?";
	
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, n_id);
			ps.setString(2, n_name);
			ps.setString(3, n_age);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				System.out.print("회원님의 비밀번호는 '");
				System.out.print(rs.getString(1));
				System.out.println("' 입니다.");
			} else {
				System.out.println("찾을 수 없는 회원입니다.");
			}
			
			close(rs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(con);
		}
	}
	
	public void deleteMember(Scanner sc) {
		System.out.println("아이디를 입력하세요.");
		System.out.print(": ");
		String n_id = sc.next();
		n_id += "@naver.com";
		
		System.out.println("비밀번호를 입력하세요.");
		System.out.print(": ");
		String n_passwd = sc.next();
		
		NmemberVO nmVO = new NmemberVO(n_id, n_passwd);
		con = getConnection();
		PreparedStatement ps = null;
		
		int d = 0;
		String sql = "SELECT N_ID FROM N_MEMBER WHERE N_ID = ? AND N_PASSWD = ?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, nmVO.getN_id());
			ps.setString(2, nmVO.getN_passwd());
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				System.out.println("정말 탈퇴 하시겠습니까?");
				System.out.print("탈퇴는 1번, 로그인화면은 2번을 눌러주세요. : ");
				d = sc.nextInt();
			} else {
				System.out.println("회원정보가 없습니다. 처음으로 돌아갑니다.");
				return;
			}
			close(rs);
			close(ps);
			
			if (d == 1) {
				sql = "delete FROM N_MEMBER WHERE N_ID = ? AND N_PASSWD = ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, nmVO.getN_id());
				ps.setString(2, nmVO.getN_passwd());
				int a = ps.executeUpdate();
				
				if (a > 0) {
					System.out.println("회원탈퇴가 정상 처리되었습니다. 처음으로 돌아갑니다.");
				} else {
					System.out.println("회원탈퇴가 처리되지 않았습니다. 처음으로 돌아갑니다.");
				}
			} else if (d == 2) {
				return;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(con);
		}
	}
}
