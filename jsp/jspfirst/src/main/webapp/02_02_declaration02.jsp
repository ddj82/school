<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	int sum(int a, int b) {
		System.out.println("하하하");
		return a + b;
	}
	%>
	<%
	System.out.print("ㅋㅋㅋ");
	out.println("2 + 3 = " + sum(2, 3));
	%>
</body>
</html>