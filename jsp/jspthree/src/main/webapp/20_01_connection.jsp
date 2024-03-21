<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {border-collapse: collapse; width: 60%; margin: 0 auto;}
	th {color: #fff; background-color: #555;}
	.tbr {border-right: 1px solid #fff !important;}
	td, th {border: 1px solid #555; padding: 20px;}
	tr > td:first-of-type {text-align: center;}
	h1 {text-align: center;}
</style>
</head>
<body>
	<%
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	try {
// 		String url = "jdbc:mariadb://LOCALHOST:3306/testdb";
// 		String url = "jdbc:mysql://LOCALHOST:3306/testdb";
		String url = "jdbc:oracle:thin:@LOCALHOST:1521:XE";
		String user = "test";
		String password = "1111";
		
// 		Class.forName("org.mariadb.jdbc.Driver");
// 		Class.forName("com.mysql.jdbc.Driver");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
		System.out.println("데이터베이스 연결이 성공되었습니다.");
		
		String sql = "SELECT * FROM STUDENT";
		st = conn.createStatement();
		rs = st.executeQuery(sql);
	%>
	<h1>학생 테이블의 데이터 정보</h1>
	<table>
		<colgroup>
			<col width="10%"/><col width="30%"/>
			<col width="30%"/><col width="30%"/>
		</colgroup>
		<tr>
			<th class="tbr">아이디</th><th class="tbr">이름</th>
			<th class="tbr">성별</th><th>지역</th>
		</tr>
		<%
		while(rs.next()) {
			String id = rs.getString("id");
			String name = rs.getString("name");
			String gender = rs.getString("gender");
			String address = rs.getString("address");
		%>
		<tr>
			<td><%=id %></td><td><%=name %></td>
			<td><%=gender %></td><td><%=address %></td>
		</tr>
	<%
		}
		
	} catch (SQLException ex) {
		out.println("데이터베이스 연결이 실패되었습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	} catch (ClassNotFoundException ex) {
		out.println("드라이버를 찾을 수 없습니다.<br>");
		out.println("ClassNotFoundException: " + ex.getMessage());
	} finally {
		if (rs != null) {
			rs.close();
		}
		if (st != null) {
			st.close();
		}
		if (conn != null) {
			conn.close();
		}
	}
	%>
	</table>
	
</body>
</html>