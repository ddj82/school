<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<html>
<head>
<%
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		ps = conn.prepareStatement("SELECT * FROM MEMBER");
		rs = ps.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<style>
	table {
		margin: auto;
		width: 400px;
		border: 1px solid gray;
		text-align: center;
	}
	.td_title {
		font-weight: bold;
		font-size: x-large;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<td colspan=2 class="td_title">회원 목록</td>
		</tr>
		<%
		if (rs != null) { 
			while (rs.next()) {
		%>
		<tr>
			<td>
				<a href="member_info.jsp?id=<%=rs.getString("id") %>">
					<%=rs.getString("id") %>
				</a>
			</td>
			<td>
				<a href="member_delete.jsp?id=<%=rs.getString("id") %>">삭제</a>
			</td>
		</tr>
		<%
			}
		}
		%>
	</table>
</body>
</html>