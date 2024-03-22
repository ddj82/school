<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	Connection conn = null;

	try {
// 		context.xml에 Context태그의 객체화
		Context init = new InitialContext();

// 		context.xml에 Resource태그의 객체화
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		out.println("<h3>연결되었습니다.</h3>");
	} catch (Exception e) {
		out.println("<h3>연결에 실패하였습니다.</h3>");
		e.printStackTrace();
	}
%>