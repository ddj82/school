<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<html>
<head>
<%
	String info_id = request.getParameter("id");
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		ps = conn.prepareStatement("SELECT * FROM MEMBER WHERE ID = ?");
		ps.setString(1, info_id);
		rs = ps.executeQuery();
%>
<style>
	table {
		margin: auto;
		width: 400px;
		border: 1px solid gray;
		text-align: center;
	}
</style>
</head>
<body>
	<% if (rs != null && rs.next()) { %>
	<table>
		<tr>
			<td>아이디 : </td>
			<td><%= rs.getString("id") %></td>
		</tr>	
		<tr>
			<td>비밀번호 : </td>
			<td><%= rs.getString("password") %></td>
		</tr>	
		<tr>
			<td>이름 : </td>
			<td><%= rs.getString("name") %></td>
		</tr>	
		<tr>
			<td>생년월일 : </td>
			<td><%= rs.getString("birth") %></td>
		</tr>	
		<tr>
			<td>성별 : </td>
			<td><%= rs.getString("gender") %></td>
		</tr>	
		<tr>
			<td>이메일 : </td>
			<td><%= rs.getString("mail") %></td>
		</tr>	
		<tr>
			<td colspan=2><a href="member_list.jsp">리스트로 돌아가기</a></td>
		</tr>	
	</table>
<%
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>