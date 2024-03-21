<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%-- <% request.setCharacterEncoding("utf-8"); %> --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {border-collapse: collapse; width: 60%; margin: 0 auto;}
	th {color: #fff; background-color: #555;}
	.tbr {border-right: 1px solid #fff !important;}
	td, th {border: 1px solid #555; padding: 20px;}
	tr td {text-align: center;}
	h1 {text-align: center;}
</style>
</head>
<body>
	<%@ include file="20_01_dbconn.jsp" %>
	<h1>MEMBER테이블 정보</h1>
	<table>
	<tr>
		<th class="tbr">아이디</th><th class="tbr">비밀번호</th><th class="tbr">이름</th>
	</tr>
	
	<%
	PreparedStatement ps = null;
	ResultSet rs = null;
 	String uid = request.getParameter("id");
 	String upw = request.getParameter("passwd");
 	String unm = request.getParameter("name");
	try {
		String sql = "INSERT INTO MEMBER VALUES(?, ?, ?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, uid);
		ps.setString(2, upw);
		ps.setString(3, unm);
		int c = ps.executeUpdate();
		
		if (c > 0) {
			System.out.println("추가에 성공했습니다.");
			ps.close();
// 			sql = "SELECT * FROM MEMBER";
			sql = "SELECT * FROM MEMBER WHERE ID = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, uid);
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
			
		} else {
			out.print("추가에 실패했습니다.<br>");			
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