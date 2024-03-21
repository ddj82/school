<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%-- <% request.setCharacterEncoding("utf-8"); %> --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="20_01_dbconn.jsp" %>
	<h3>MEMBER테이블 정보</h3>
	
	<%
	PreparedStatement ps = null;
	ResultSet rs = null;
 	String uid = request.getParameter("id");
 	String upw = request.getParameter("passwd");
	String newpw = request.getParameter("newpw");
	try {
		String sql = "UPDATE MEMBER SET PASSWD = ? WHERE ID = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, newpw);
		ps.setString(2, uid);
		int c = ps.executeUpdate();
		
		if (c > 0) {
			ps.close();
	%>
	<h3>비밀번호 변경이 완료되었습니다.</h3>
	<%
			sql = "SELECT * FROM MEMBER WHERE ID = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, uid);
			rs = ps.executeQuery();
			while (rs.next()) {
	%>
	<h3>회원정보 입니다.</h3>
	<p>아이디 : <%= rs.getString("id") %></p>
	<p>새비밀번호 : <%= rs.getString("passwd") %></p>
	<p>이름 : <%= rs.getString("name") %></p>
	<p><small>변경 전 비밀번호 : <%= request.getParameter("passwd") %></small></p>
	<br>
	<%
			}
				
		} else {
			out.print("변경에 실패했습니다.");
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
</body>
</html>