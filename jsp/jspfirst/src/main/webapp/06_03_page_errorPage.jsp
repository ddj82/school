<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 실행부에서 에러가 나면 해당 파일을 보여라 -->
<%@ page errorPage="06_03_page_errorPage_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	out.print("에러테스트");
	String str = null;
	out.println(str.toString()); //에러발생
	out.print("에러테스트 종료");
	%>
</body>
</html>