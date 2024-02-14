package aaa;

import java.sql.*;

public class ProcedureCall {

	public static void main(String[] args) {
		try {
			//데이터베이스 드라이버를 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//Connection 객체 생성
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@LOCALHOST:1521:XE", "TEST", "1111");
			
			
			//명령문 담는 객체 생성
			CallableStatement cstmt = con.prepareCall("{CALL RES(?, ?, ?)}");
			//?에 값 바인딩
			cstmt.setInt(1, 70);
			cstmt.setString(2, "테스트3");
			cstmt.setString(3, "부산");
			
			
			//명령문 실행
			cstmt.executeQuery();
			
			//사용한 객체 닫기
			cstmt.close();
			con.close();
			System.out.println("프로시저 호출 완료");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	}

}
