<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="com.dto.MemberBean" %>     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
<%-- 	<% MemberBean memberBean = new MemberBean(); %> --%>
	<jsp:useBean id="memberBean" class="com.dto.MemberBean"></jsp:useBean>
	
<%-- 	<jsp:setProperty name="memberBean" property="*"/> --%>
<!-- 	property="*"로 설정하기 위해서는 1. 폼요소의 name속성, 2. dto클래스의 멤버필드명, 3. 데이터베이스의 컬럼명을 일치 시켜줘야함  -->

	<jsp:setProperty name="memberBean" property="id" param="user_id"/>
<!-- 	jsp:setProperty property="id", name="memverBean", param="user_id" -->
<!-- 	조합 => memberBean.setId(request.getParameter("user_id")); -->
<!-- 	=> memberBean.setId(1); -->

	<jsp:setProperty name="memberBean" property="name" param="name"/>
<!-- 	jsp:setProperty property="name", name="memverBean", param="name" -->
<!-- 	조합 => memberBean.setName(request.getParameter("name")); -->
<!-- 	=> memberBean.setName("홍길동"); -->

	<jsp:setProperty name="memberBean" property="hobby" param="hobby"/>
<!-- 	jsp:setProperty property="hobby", name="memverBean", param="hobby"  -->
<!-- 	조합 => memberBean.setHobby(request.getParameterValues("hobby")); -->
<!-- 	request.getParameterValues("hobby") => request객체에 담아놓은 내가 고른 hobby의 value값으로 새로운 배열객체를 보냄 -->
<!-- 	com.dto.MemberBean에 멤버필드로 있던 private String[] hobby = new String[3];의 값이 바뀜(length3에서 새로보낸 배열의 length로) -->
<!-- 	=> memberBean.setHobby("hobby"); -->
	
	아이디 : <jsp:getProperty property="id" name="memberBean"/><br>
	이름 : <jsp:getProperty property="name" name="memberBean"/><br>
	취미 : <jsp:getProperty property="hobby" name="memberBean"/><br>
	요청정보 컨텐츠타입 = <%= request.getContentType() %> <br>
	세션아이디 = <%= request.getRequestedSessionId() %> <br>
	<small style="color: red">클라이언트가 전송한 요청 정보(post로 보낸 데이터만)의 컨텐츠 타입을 구함. String으로 반환</small>
	<br>
	<%
// 	memberBean.setHobby(request.getParameterValues("hobby"));
	String[] hobby = memberBean.getHobby();
	out.print("방개수: " + hobby.length + "<br>");
// 	out.print("[0]: " + hobby[0] + "<br>");
// 	out.print("[1]: " + hobby[1] + "<br>");
// 	out.print("[2]: " + hobby[2] + "<br>");
	for (int i = 0; i < hobby.length; i++) {
		if (hobby[i] != null) {
			out.write(hobby[i]);
			if (i != (hobby.length - 1)) {
				out.write(", ");
			}
		} else {
			if (i == 0) {
				out.write("입력된 취미 정보가 확인되지 않습니다.");
			}
		}
	}
	%>
	
</body>
</html>