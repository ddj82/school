<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	String delete_id = request.getParameter("id");

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		ps = conn.prepareStatement("DELETE FROM MEMBER WHERE ID = ?");
		ps.setString(1, delete_id);
		int cnt = ps.executeUpdate();
		out.println("<script>");
		if (cnt > 0) {
			out.println("alert('회원이 삭제되었습니다.')");
		} else {
			out.println("alert('회원이 삭제되지 않았습니다.')");
		}
		out.println("location.href='" + request.getContextPath() + "/auth/member_list.jsp';");
		out.println("</script>");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
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