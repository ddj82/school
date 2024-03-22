<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB"); 
		/* "java:comp/env/jdbc/OracleDB" => java:comp/env/까지는 해당 컨텍스트태그안의 Resource태그들을 다 가져와서 이름이 jdbc/OracleDB인 DataSource */
		conn = ds.getConnection();
		
		ps = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID = ? AND PASSWORD = ?");
		ps.setString(1, id);
		ps.setString(2, pass);
		rs = ps.executeQuery();
		
		if (rs.next()) {
			session.setAttribute("id", id); //로그인 기능
			out.println("<script>");
			out.println("location.href='" + request.getContextPath() + "/auth/main.jsp';");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("location.href='" + request.getContextPath() + "/loginForm.jsp';");
			out.println("</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
