<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="com.dto.MemberBean, java.util.Date" %>    --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="date" class="java.util.Date" />
<%-- 	<% Date date = new Date(); %> --%>
<%-- 	<% java.util.Date date = new java.util.Date(); %> --%>
	<p><% out.print("오늘의 날짜 및 시각"); %></p>
	<p><%= date.toLocaleString() %></p><br>
	<hr>
	
	<jsp:useBean id="memberBean" class="com.dto.MemberBean"/>
	
<%-- 	<% MemberBean memberBean = new MemberBean(); %> --%>
<%-- 	<% com.dto.MemberBean memberBean = new com.dto.MemberBean(); %> --%>
	<%
	memberBean.setId(1);
	memberBean.setName("김동준");
	out.print("아이디: " + memberBean.getId() + "<br>");
	out.print("이름: " + memberBean.getName());
	
	%>
</body>
</html>