<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!int data = 50;%>
	<%= data %>
	<%
	out.print("Value of the variable is:" + data + "<br>");
// 	out.println("Value of the variable is:" + data);
// 	out => body에서 출력해라는 jsp의 내장객체 out임
	String data = "하하하";
	out.print("2_Value of the variable is:" + data);
	
	%>
	<%= data %>
</body>
</html>