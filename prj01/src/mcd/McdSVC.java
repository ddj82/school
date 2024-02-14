package mcd;

import static mcd.db.JdbcUtil.*;
import java.sql.*;
import java.util.*;

public class McdSVC {
	Connection con;

	public void getMcdSVC(Scanner sc) {
		while (true) {
			System.out.println("[선택] 1.상품등록(관리자), 2.상품수정(관리자), 3.상품삭제(관리자), 4.상품검색, 5.전체목록, 6.종료");
			int c = 0;
			int menu_no = 0;
			c = sc.nextInt();
			switch (c) {
			case 1: { // o
				System.out.println("관리자 아이디/비번 입력");
				int login = 0;
				login = loginAdmin(sc, login);
				if (login == 0) {
					insertProduct(sc);
				} else {
					break;
				}
				break;
			}
			case 2: { // o
				System.out.println("관리자 아이디/비번 입력");
				int login = 0;
				login = loginAdmin(sc, login);
				if (login == 0) {
					updateProduct(sc);
				} else {
					break;
				}
				break;
			}
			case 3: { // o
				System.out.println("관리자 아이디/비번 입력");
				int login = 0;
				login = loginAdmin(sc, login);
				if (login == 0) {
					deleteProduct(sc);
				} else {
					break;
				}
				break;
			}
			case 4: { // o
				System.out.print("검색할 상품번호 입력: ");
				menu_no = sc.nextInt();
				searchProduct(menu_no);
				break;
			}
			case 5: { // o
				System.out.println("전체 상품 입니다.");
				allProduct();
				break;
			}
			case 6: { // o
				System.out.println("전 단계로 돌아갑니다.");
				return;
			}

			}

		}
	}

	public int loginAdmin(Scanner sc, int login) {
		System.out.print("아이디: ");
		String admin_id = sc.next();
		System.out.print("비밀번호: ");
		int admin_pw = sc.nextInt();
		con = getConnection();
		PreparedStatement ps = null;
		String sql = "SELECT * FROM ADMIN_M WHERE ADMIN_ID = ? AND ADMIN_PASSWD = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, admin_id);
			ps.setInt(2, admin_pw);
			int count = ps.executeUpdate();
			if (count > 0) {
				System.out.println("로그인 되었습니다.");
			} else {
				System.out.println("관리자만 이용할 수 있는 메뉴입니다.");
				login = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(con);
		}
		return login;

	}

	public void insertProduct(Scanner sc) { // 1
		con = getConnection();
		PreparedStatement ps = null;
		try {
			McdMenuVO mcdMenuVO = insertProductSet(sc);
			String sql = "INSERT INTO MENU_INFO VALUES (?, SEQ_MENUNO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, mcdMenuVO.getMenu_cat());
			ps.setString(2, mcdMenuVO.getMenu_nm());
			ps.setInt(3, mcdMenuVO.getMenu_pr());
			ps.setInt(4, mcdMenuVO.getMenu_wg());
			ps.setInt(5, mcdMenuVO.getMenu_ml());
			ps.setDouble(6, mcdMenuVO.getMenu_k());
			ps.setDouble(7, mcdMenuVO.getMenu_su());
			ps.setDouble(8, mcdMenuVO.getMenu_d());
			ps.setDouble(9, mcdMenuVO.getMenu_f());
			ps.setDouble(10, mcdMenuVO.getMenu_n());
			ps.setDouble(11, mcdMenuVO.getMenu_c());
			ps.setString(12, mcdMenuVO.getMenu_dc());
			int p = ps.executeUpdate();
			if (p > 0) {
				System.out.println(mcdMenuVO.getMenu_nm() + " 상품이 등록되었습니다.");
			} else {
				System.out.println("상품 등록에 실패하였습니다. 전 단계로 돌아갑니다.");
				return;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(con);
		}

	}

	public McdMenuVO insertProductSet(Scanner sc) { // 1
		System.out.print("상품종류 선택(1.버거, 2.버거세트, 3.사이드, 4.음료) >> ");
		String m_cat = sc.next();
		switch (Integer.parseInt(m_cat)) {
		case 1: {
			m_cat = "버거";
			break;
		}
		case 2: {
			m_cat = "버거세트";
			break;
		}
		case 3: {
			m_cat = "사이드";
			break;
		}
		case 4: {
			m_cat = "음료";
			break;
		}
		}

		System.out.print("상품명 >> ");
		sc.nextLine();
		String m_nm = sc.nextLine();

		System.out.print("상품가격 >> ");
		int m_pr = sc.nextInt();

		System.out.print("중량(g) >> ");
		int m_wg = sc.nextInt();

		System.out.print("중량(ml) >> ");
		int m_ml = sc.nextInt();

		System.out.print("최대열량(kcal) >> ");
		double m_k = sc.nextDouble();

		System.out.print("당(g) >> ");
		double m_su = sc.nextDouble();

		System.out.print("단백질(g) >> ");
		double m_d = sc.nextDouble();

		System.out.print("포화지방(g) >> ");
		double m_f = sc.nextDouble();

		System.out.print("나트륨(mg) >> ");
		double m_n = sc.nextDouble();

		System.out.print("카페인(mg) >> ");
		double m_c = sc.nextDouble();

		System.out.print("상품설명 >> ");
		sc.nextLine();
		String m_dc = sc.nextLine();

		McdMenuVO mcdMenuVO = new McdMenuVO(m_cat, 0, m_nm, m_pr, m_wg, m_ml, m_k, m_su, m_d, m_f, m_n, m_c, m_dc);
		return mcdMenuVO;
	}

	public void updateProduct(Scanner sc) { // 2
		con = getConnection();
		PreparedStatement ps = null;
		try {
			System.out.print("수정 할 상품번호 입력: ");
			int m_no = sc.nextInt();
			String sql = "SELECT * FROM MENU_INFO WHERE MENU_NO = " + m_no;
			ps = con.prepareStatement(sql);
			int p = ps.executeUpdate();
			if (p > 0) {
				ps.close();
				McdMenuVO mcdMenuVO = updateProductSet(sc);
				sql = "UPDATE MENU_INFO SET MENU_CAT = ?, MENU_NM = ?, MENU_PR = ?, MENU_WG = ?, MENU_ML = ?, "
						+ "MENU_K = ?, MENU_SU = ?, MENU_D = ?, MENU_F = ?, MENU_N = ?, MENU_C = ?, MENU_DC = ? "
						+ "WHERE MENU_NO = " + m_no;
				ps = con.prepareStatement(sql);
				ps.setString(1, mcdMenuVO.getMenu_cat());
				ps.setString(2, mcdMenuVO.getMenu_nm());
				ps.setInt(3, mcdMenuVO.getMenu_pr());
				ps.setInt(4, mcdMenuVO.getMenu_wg());
				ps.setInt(5, mcdMenuVO.getMenu_ml());
				ps.setDouble(6, mcdMenuVO.getMenu_k());
				ps.setDouble(7, mcdMenuVO.getMenu_su());
				ps.setDouble(8, mcdMenuVO.getMenu_d());
				ps.setDouble(9, mcdMenuVO.getMenu_f());
				ps.setDouble(10, mcdMenuVO.getMenu_n());
				ps.setDouble(11, mcdMenuVO.getMenu_c());
				ps.setString(12, mcdMenuVO.getMenu_dc());
				int k = ps.executeUpdate();
				if (k > 0) {
					System.out.println(m_no + "번 상품의 정보가 수정되었습니다.");
				} else {
					System.out.println("상품 수정에 실패하였습니다. 전 단계로 돌아갑니다.");
					return;
				}
			} else {
				System.out.println("잘못 된 상품 번호입니다. 전 단계로 돌아갑니다.");
				return;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(con);
		}

	}

	public McdMenuVO updateProductSet(Scanner sc) {
		System.out.print("수정 할 상품종류 선택(1.버거, 2.버거세트, 3.사이드, 4.음료) >> ");
		String m_cat = sc.next();
		switch (Integer.parseInt(m_cat)) {
		case 1: {
			m_cat = "버거";
			break;
		}
		case 2: {
			m_cat = "버거세트";
			break;
		}
		case 3: {
			m_cat = "사이드";
			break;
		}
		case 4: {
			m_cat = "음료";
			break;
		}
		}

		System.out.print("수정 할 상품명 >> ");
		sc.nextLine();
		String m_nm = sc.nextLine();

		System.out.print("수정 할 상품가격 >> ");
		int m_pr = sc.nextInt();

		System.out.print("수정 할 중량(g) >> ");
		int m_wg = sc.nextInt();

		System.out.print("수정 할 중량(ml) >> ");
		int m_ml = sc.nextInt();

		System.out.print("수정 할 최대열량(kcal) >> ");
		double m_k = sc.nextDouble();

		System.out.print("수정 할 당(g) >> ");
		double m_su = sc.nextDouble();

		System.out.print("수정 할 단백질(g) >> ");
		double m_d = sc.nextDouble();

		System.out.print("수정 할 포화지방(g) >> ");
		double m_f = sc.nextDouble();

		System.out.print("수정 할 나트륨(mg) >> ");
		double m_n = sc.nextDouble();

		System.out.print("수정 할 카페인(mg) >> ");
		double m_c = sc.nextDouble();

		System.out.print("수정 할 상품설명 >> ");
		sc.nextLine();
		String m_dc = sc.nextLine();

		McdMenuVO mcdMenuVO = new McdMenuVO(m_cat, 0, m_nm, m_pr, m_wg, m_ml, m_k, m_su, m_d, m_f, m_n, m_c, m_dc);

		return mcdMenuVO;
	}

	public void deleteProduct(Scanner sc) { // 3
		con = getConnection();
		PreparedStatement ps = null;
		try {
			System.out.print("삭제 할 상품번호 입력: ");
			int m_no = sc.nextInt();
			String sql = "DELETE FROM MENU_INFO WHERE MENU_NO = " + m_no;
			ps = con.prepareStatement(sql);
			int p = ps.executeUpdate();
			if (p > 0) {
				System.out.println(m_no + "번 상품의 정보가 삭제되었습니다.");
			} else {
				System.out.println("상품 삭제에 실패하였습니다. 전 단계로 돌아갑니다.");
				return;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
			close(con);
		}
	}

	public void searchProduct(int menu_no) {// 4
		con = getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MENU_INFO WHERE MENU_NO = " + menu_no;
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			McdMenuVO mcdmenuVO = null;

			while (rs.next()) {
				mcdmenuVO = new McdMenuVO(rs.getString("MENU_CAT"), rs.getInt("MENU_NO"), rs.getString("MENU_NM"),
						rs.getInt("MENU_PR"), rs.getInt("MENU_WG"), rs.getInt("MENU_ML"), rs.getDouble("MENU_K"),
						rs.getDouble("MENU_SU"), rs.getDouble("MENU_D"), rs.getDouble("MENU_F"), rs.getDouble("MENU_N"),
						rs.getDouble("MENU_C"), rs.getString("MENU_DC"));
				System.out.println(mcdmenuVO);
				System.out.println();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(st);
			close(con);
		}
	}

	public void allProduct() { // 5
		con = getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MENU_INFO ORDER BY MENU_NO";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			McdMenuVO mcdmenuVO = null;

			while (rs.next()) {
				mcdmenuVO = new McdMenuVO(rs.getString("MENU_CAT"), rs.getInt("MENU_NO"), rs.getString("MENU_NM"),
						rs.getInt("MENU_PR"), rs.getInt("MENU_WG"), rs.getInt("MENU_ML"), rs.getDouble("MENU_K"),
						rs.getDouble("MENU_SU"), rs.getDouble("MENU_D"), rs.getDouble("MENU_F"), rs.getDouble("MENU_N"),
						rs.getDouble("MENU_C"), rs.getString("MENU_DC"));
				System.out.println(mcdmenuVO);
			}
			System.out.println();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(st);
			close(con);
		}
	}

}
