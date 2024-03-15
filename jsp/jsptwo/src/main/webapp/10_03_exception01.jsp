<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>에러처리 : try~catch 사용</h2>
	name 파라미터 값 : <%= request.getParameter("name") %>
	<%try { %>
	name 파라미터 값 : 
	<%= request.getParameter("name").toUpperCase() %>
	<%
	} catch (Exception e) {
		out.print("<hr>&lt;에러 내용&gt;<br>");
		out.print("name파라미터가 올바르지 않습니다.<br>");
		out.print("에러메시지 : " + e.getMessage());
	}
	%>
</body>
</html>