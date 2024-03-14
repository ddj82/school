<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="16kb" autoFlush="false" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>out객체의 버퍼 관련 메소드</h2>
	<% for (int i = 0; i < 1000; i++) { %>
	1234
	<%
// 	out.flush();
	}%>
	<br>버퍼 크기 : <%=out.getBufferSize() %>Byte
	<br>남은 크기 : <%=out.getRemaining() %>Byte
	<br>autoFlush여부 : <%=out.isAutoFlush() %>
</body>
</html>