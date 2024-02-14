package mcd;
import static mcd.db.JdbcUtil.*;
import java.sql.*;
import java.util.*;
public class ExMain {
	public static void main(String[] args) {
		try {
			String sql = "SELECT DISTINCT ORDER_BR, ORDER_DT, ORDER_MA FROM ORDER_LIST WHERE ORDER_NM = '김동준'";
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				System.out.println("주문서");
				System.out.println("지점명: " + rs.getString(1));
				System.out.println("주문일자: " + rs.getString(2) + "\n");
				System.out.println("담당자명: " + rs.getString(3) + "\n");
			}
			rs.close();
			ps.close();
			
			sql = "SELECT DISTINCT ORDER_NM, ORDER_PN, ORDER_ADR FROM ORDER_LIST WHERE ORDER_NM = '바밤바'";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				System.out.println("주문자: " + rs.getString(1));
				System.out.println("연락처: " + rs.getString(2));
				System.out.println("주소: " + rs.getString(3));
			}
			rs.close();
			ps.close();
			
			sql = "SELECT MENU_NM, SUM(ORDER_EA), SUM(ORDER_TOT) FROM ORDER_LIST O, MENU_INFO M "
					+ "WHERE MENU_NO = ORDER_MENUNO AND ORDER_NM = '바밤바' "
					+ "GROUP BY MENU_NM ORDER BY SUM(ORDER_TOT) DESC";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			System.out.println("주문내용:");
			while (rs.next()) {
				System.out.println(rs.getString(1) + " " + rs.getInt(2) + "개 " + rs.getInt(3) + "원");
			}
			rs.close();
			ps.close();
			
			sql = "SELECT SUM(ORDER_TOT) TOTAL FROM ORDER_LIST WHERE ORDER_NM = '바밤바' AND ORDER_ADR = '아이스박스' GROUP BY ORDER_NUM";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				System.out.println();
				System.out.println("총 금액: " + rs.getInt("TOTAL"));
			}
			System.out.println("---------------------------------------");
			rs.close();
			ps.close();
			
			sql = "SELECT DISTINCT ORDER_REQ FROM ORDER_LIST WHERE ORDER_NM = '바밤바'";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				System.out.println("고객요청사항: " + rs.getString(1));
			}
			System.out.println("---------------------------------------");
			rs.close();
			ps.close();
			
			sql = "SELECT DISTINCT MENU_NM, MENU_WG, MENU_ML, MENU_K, MENU_SU, MENU_D, MENU_F, MENU_N, MENU_C "
					+ "FROM MENU_INFO M, ORDER_LIST O WHERE MENU_NO = ORDER_MENUNO AND ORDER_NM = '바밤바'";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			System.out.println("칼로리정보");
			while (rs.next()) {
				System.out.println(rs.getString("MENU_NM"));
				System.out.println("- 중량(g): " + rs.getInt("MENU_WG"));
				System.out.println("- 중량(ml): " + rs.getInt("MENU_ML"));
				System.out.println("- 열량(Kcal): " + rs.getDouble("MENU_K"));
				System.out.println("- 당(g): " + rs.getDouble("MENU_SU"));
				System.out.println("- 단백질(g): " + rs.getDouble("MENU_D"));
				System.out.println("- 포화지방(g): " + rs.getDouble("MENU_F"));
				System.out.println("- 나트륨(mg): " + rs.getDouble("MENU_N"));
				System.out.println("- 카페인(mg): " + rs.getDouble("MENU_C"));
				System.out.println();
			}
			rs.close();
			ps.close();
						
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
