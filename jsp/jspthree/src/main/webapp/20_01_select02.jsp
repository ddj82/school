<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="20_01_dbconn.jsp" %>
	<table width="300" border="1">
		<tr>
			<th>아이디</th><th>비밀번호</th><th>이름</th>
		</tr>
		<%
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
// 			String sql = "SELECT * FROM MEMBER WHERE ID LIKE ?";
// 			ps = conn.prepareStatement(sql);
// 			ps.setString(1, "user%");
// 			rs = ps.executeQuery();
			String sql = "SELECT * FROM MEMBER";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				String id = rs.getString("ID");
				String pw = rs.getString("PASSWD");
				String name = rs.getString("NAME");
		%>
		<tr>
			<td><%=id %></td><td><%=pw %></td><td><%=name %></td>
		</tr>
		<%
			}
		} catch (SQLException ex) {
			out.print("Member 테이블 호출에 실패했습니다.<br>");
			out.print("SQLException: " + ex.getMessage());
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		%>
	</table>
</body>
</html>