<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<jsp:useBean id="person" class="com.dto.Person" /> --%>
	<jsp:useBean id="person" class="com.dto.Person" scope="request" />
	<p>아이디 : <%= person.getId() %></p>
	<p>이 름 : <%= person.getName() %></p><br><hr>
	<% 
	person.setId(20182005);
	person.setName("고희동");
	%>
	<p>아이디 : <%= person.getId() %></p>
	<p>이 름 : <%= person.getName() %></p><br><hr>
	<jsp:include page="08_02_useBean03.jsp"/>
<%-- 	<jsp:useBean id="person" class="com.dto.Person" scope="request" /> --%>
<%-- 	<p>아이디 : <%= person.getId() %></p> --%>
<%-- 	<p>이 름 : <%= person.getName() %></p> --%>
<!-- 	11번줄에서 person객체를 생성하고 request공간에 저장되어있음 -->
<!-- 	그리고 20번 줄에서 08_02_useBean03.jsp를 가져오고 이곳에 기술한 객체생성문인  -->
<%-- 	<jsp:useBean id="person" class="com.dto.Person" scope="request" /> 는  --%>
<!-- 	request에 person객체가 있으면 가져오라는 말이 됨 -->
</body>
</html>