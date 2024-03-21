<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="20_02_update01_process2.jsp?id=<%=request.getParameter("id") %>&passwd=<%=request.getParameter("passwd") %>" method="post">
		<p> 새비밀번호 : <input type="password" name="newpw"></p>
		<p><input type="submit" value="전송" id="newpwsbm"></p>
	</form>
</body>
</html>