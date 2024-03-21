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
 	String unm = request.getParameter("name");
	try {
		String sql = "SELECT * FROM MEMBER WHERE ID = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, uid);
		int c = ps.executeUpdate();
		
		if (c > 0) {
			response.sendRedirect("20_02_update01_2.jsp?id=" + uid + "&passwd=" + upw);
	%>
<%-- 	<%@ include file="20_02_update01_2.jsp" %> --%>
	<%			
		} else {
			out.print("회원정보가 없습니다.");
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