<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<h1>입력에 성공했습니다.</h1>
	<p>아이디 : <%=request.getParameter("id") %></p>
	<p>비밀번호 : <%=request.getParameter("passwd") %></p>
</body>
</html>