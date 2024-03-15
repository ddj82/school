<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String name = request.getParameter("abc");
	if (name != null) {
		application.setAttribute(name, "orange");
	%>
	application 기본 객체의 속성 설정:
	<%=name %> = <%=application.getAttribute(name) %>
	<%} else { %>
	application 기본 객체의 속성 설정 안함 <br>
	쿼리스트링으로 추가하고 재실행해주세요. <br>
	추가할 문자열 : ?abc=fruit
	<%} %>
</body>
</html>