package aaa;

import java.sql.*;

public class FunctionCall {

	public static void main(String[] args) {
		try {
			//데이터베이스 드라이버를 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//Connection 객체 생성
			Connection con = DriverManager.getConnection("JDBC:ORACLE:THIN:@LOCALHOST:1521:XE", "TEST", "1111");
			
			//명령문 담는 객체 생성
			//오라클에서 익명블록으로 함수호출 하는 방법
			CallableStatement cstmt = con.prepareCall("{? = CALL TEST_FUNC(?)}");
			
			//?에 값 바인딩
			cstmt.registerOutParameter(1, Types.VARCHAR);
			cstmt.setString(2, "TURNER");
			
			//명령문 실행
//			cstmt.executeUpdate();
//			cstmt.execute();
			cstmt.executeQuery();
			System.out.println(cstmt.getString(1));
			
			//SELECT문 듀얼테이블로 함수호출
			PreparedStatement ps = con.prepareStatement("SELECT TEST_FUNC(?) FROM DUAL");
			ps.setString(1, "TURNER");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				System.out.println("부서명 : " + rs.getString(1));
			}
			
			//사용한 객체 닫기
			rs.close();
			ps.close();
			cstmt.close();
			con.close();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}

}
