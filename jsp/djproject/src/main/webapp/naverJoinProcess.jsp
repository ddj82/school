<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String ugen = request.getParameter("ugen");
	String utel = request.getParameter("utel");
	Connection conn = null;
	PreparedStatement ps = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		ps = conn.prepareStatement(
				"INSERT INTO NAVERMEM VALUES (?, ?, ?, ?, ?, ?, ?)");
		ps.setString(1, id);
		ps.setString(2, pw);
		ps.setString(3, email);
		ps.setString(4, name);
		ps.setString(5, birth);
		ps.setString(6, ugen);
		ps.setString(7, utel);
		
		int c = ps.executeUpdate();
		
		if (c != 0) {
			out.println("<script>");
			out.println("location.href='good.jsp'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("location.href='bad.jsp'");
			out.println("</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script>");
		out.println("location.href='bad.jsp'");
		out.println("</script>");
	} finally {
		try {
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>