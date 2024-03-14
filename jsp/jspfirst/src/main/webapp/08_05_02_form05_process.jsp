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
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");
	String comment = request.getParameter("comment").replace("\n", "<br>").replace("<", "&lt;").replace(">", "&gt;");
	%>
	<p> 아이디 : <%=id %></p>
	<p> 비밀번호 : <%=passwd %></p>
	<p> 이름 : <%=name %></p>
	<p> 연락처 : <%=phone1 %>-<%=phone2 %>-<%=phone3 %></p>
	<p> 성별 : <%=gender %></p>
	<p> 취미 : 
		<%
		if (hobby != null) {
			for (int i = 0; i < hobby.length; i++) {
				out.println(" " + hobby[i]);
			}
		} else {
			out.print("선택한 취미가 없습니다.");
		}
		%>
	</p>
	<p> 가입 인사 : <%=comment %></p>
</body>
</html>