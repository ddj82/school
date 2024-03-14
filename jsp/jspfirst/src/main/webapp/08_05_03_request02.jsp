<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {border-collapse: collapse;}
table, th, td {border: 1px solid #000;}
th {background-color: #ccc;}
td, th {padding: 10px 20px;}
</style>
</head>
<body>
	<% 
	String md = request.getMethod();
	String hostValue = request.getHeader("host");
	String alValue = request.getHeader("accept-language");
	String cookie = request.getHeader("cookie");
	String cookie2 = request.getCookies()[0].getValue();
	%>
	메소드 : <%=md %><br>
	쿠키1 : <%=cookie %><br>
	쿠키2 : <%=cookie2 %><br>
	<table>
		<tr><th>호스트명</th><th>설정된 언어</th><th>쿠키</th></tr>
		<tr><td><%=hostValue %></td><td><%=alValue %></td><td><%=cookie %></td></tr>
	</table>
</body>
</html>