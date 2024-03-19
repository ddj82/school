<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="java.text.NumberFormat, java.text.DateFormat, java.util.*" %>     --%>
<%@ page import="java.text.*, java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>현재 지역의 언어, 날짜, 통화</h3>
	<% 
	Locale locale = request.getLocale();
	/* request.getLocale() => 요청객체의 브라우저에 설정된 언어를 가져오세요(지역을 가져오세요) */
	Date currentDate = new Date();
	
	DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.FULL, locale);
	DateFormat dateFormat1 = DateFormat.getDateInstance(DateFormat.FULL);
	
	NumberFormat numberFormat = NumberFormat.getNumberInstance(locale);
	NumberFormat numberFormat1 = NumberFormat.getNumberInstance();
	%>
	<p>언어 : <%= locale.getDisplayLanguage() %></p>
	
	<p>날짜 : <%= dateFormat.format(currentDate) %></p>
	<p>날짜1 : <%= dateFormat1.format(currentDate) %></p>
	
	<p>숫자 (12345.67) : <%= numberFormat.format(12345.67) %></p>
	<p>숫자1 (12345.67) : <%= numberFormat1.format(12345.67) %></p>
</body>
</html>