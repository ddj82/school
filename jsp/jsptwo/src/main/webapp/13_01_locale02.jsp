<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*, java.util.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>현재 지역의 국가, 날짜, 통화</h3>
	<% 
	Locale locale = request.getLocale();
	Date currentDate = new Date();
	
	DateFormat dateFormat1 = DateFormat.getDateInstance(DateFormat.FULL, locale);
	DateFormat dateFormat2 = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.SHORT, locale);
	DateFormat dateFormat3 = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.FULL, locale);
	
	NumberFormat numberFormat1 = NumberFormat.getNumberInstance(locale);
	NumberFormat numberFormat2 = NumberFormat.getCurrencyInstance(Locale.KOREA);
	NumberFormat numberFormat21 = NumberFormat.getCurrencyInstance(locale);
	NumberFormat numberFormat3 = NumberFormat.getPercentInstance(locale);
	%>
	
	<p>언어 : <%= locale.getDisplayLanguage() %></p>
	
	<p>dateFormat1 날짜(요일까지) : <%= dateFormat1.format(currentDate) %></p>
	<p>dateFormat2 날짜시간(분까지만) : <%= dateFormat2.format(currentDate) %></p>
	<p>dateFormat3 날짜시간(모두) : <%= dateFormat3.format(currentDate) %>
	
	<small style="color: red">(한국 표준시(KST, Korea Standard Time))</small></p>
	
	<p>numberFormat1 숫자 (천단위 구분) : <%= numberFormat1.format(12345.67) %></p>
	<p>numberFormat2 숫자 (지역의 통화 형식) : <%= numberFormat2.format(12345.67) %></p>
	<p>numberFormat21 숫자 (지역의 통화 형식) : <%= numberFormat21.format(12345.67) %></p>
	<p>numberFormat3 숫자 (지역의 비율 형식) : <%= numberFormat3.format(0.45) %></p>
</body>
</html>