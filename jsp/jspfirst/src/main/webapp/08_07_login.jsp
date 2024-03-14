<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("memberId");
	String pw = request.getParameter("memberPass");
	if (id != null && id.equals("admin") && pw != null && pw.equals("1234")) {
		response.sendRedirect("08_06_index.jsp?name=" + id);
	} else {
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if (!(id.equals("admin"))) {
		if (!(pw.equals("1234"))) {
			out.write("잘못된 아이디, 비밀번호입니다.");
		} else {
		out.write("잘못된 아이디입니다.");
		}
	} else if (!(pw.equals("1234"))) {
		out.write("잘못된 비밀번호입니다.");
	}

%>
</body>
</html>
<% } %>