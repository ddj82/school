<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	Connection conn = null;
	PreparedStatement ps = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		ps = conn.prepareStatement(
				"INSERT INTO MEMBER VALUES (?, ?, ?, ?, ?, ?, ?, ?, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'))");
		ps.setString(1, id);
		ps.setString(2, pass);
		ps.setString(3, name);
		ps.setString(4, birth);
		ps.setString(5, gender);
		ps.setString(6, email);
		ps.setString(7, phone);
		ps.setString(8, address);
		
		int c = ps.executeUpdate();
		
		if (c != 0) {
			out.println("<script>");
			out.println("location.href='loginForm.jsp'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("location.href='loginForm.jsp'");
			out.println("</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
