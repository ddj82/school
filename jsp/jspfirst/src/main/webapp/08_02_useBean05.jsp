<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="memberBean" class="com.dto.MemberBean"/>
<!-- 	property : 멤버 변수명을 의미함. -->
	<jsp:setProperty property="id" name="memberBean" value="2"/>
<!-- 	name => 세팅할 객체명, property => 세팅할 객체의 멤버필드명, value => 세팅할 값 -->
<%-- 	<% memberBean.setId(2); %> 와 같다. --%>
	
	<%= "아이디: " + memberBean.getId() %> <br>
	이름 : <jsp:getProperty property="name" name="memberBean"/> <br>
<%-- 		<%= memberBean.getName() %> 와 같다. --%>
<%-- 		<jsp:getProperty 에는 out.print()가 숨어있다. --%>
</body>
</html>