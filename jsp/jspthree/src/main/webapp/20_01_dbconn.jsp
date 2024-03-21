<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	String user = "test";
	String password = "1111";
	String url = "jdbc:oracle:thin:@LOCALHOST:1521:XE";
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
	} catch (ClassNotFoundException e) {
		out.print("ClassNotFoundException: " + e.getMessage());
	} catch (SQLException e) {
		out.print("SQLException: " + e.getMessage());
	}
%>