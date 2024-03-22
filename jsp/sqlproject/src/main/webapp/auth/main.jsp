<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=id %> 로 로그인 하셨습니다.</h3>
	
	<button type="button" onclick="location.href='<%=request.getContextPath()%>/logout.jsp';">로그아웃</button>
	
	<%if (id != null && id.equals("admin")) { %> <!-- => 프로그래밍적 시큐리티 -->
	<a href="<%=request.getContextPath()%>/auth/member_list.jsp">
	관리자모드 접속(회원 목록 보기)
	</a>
	<%} %>
</body>
</html>