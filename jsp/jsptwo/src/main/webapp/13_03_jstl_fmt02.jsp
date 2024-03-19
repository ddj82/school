<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>숫자 : <fmt:formatNumber value="3200100" /></p>
	<p>기본값(천단위구분) : <fmt:formatNumber value="3200100" type="number"/></p>
	<p>기본값(천단위안함) : <fmt:formatNumber value="3200100" type="number" groupingUsed="false"/></p>
	<p>기본값(천단위구분, 통화기호 기본 포함) : <fmt:formatNumber value="3200100" type="currency" groupingUsed="true"/></p>
<%-- 	<p>기본값(천단위구분, 통화기호 기본 포함) : <fmt:formatNumber value="3200100" type="currency"/></p> --%>
	<p>기본값(천단위구분, 통화기호 설정) : <fmt:formatNumber value="3200100" type="currency" currencySymbol="&#8361;"/></p>
<%-- 	<p>기본값(천단위구분, 통화기호 설정) : <fmt:formatNumber value="3200100" type="currency" currencySymbol="\\"/></p> --%>
	<p>기본값(비율로 표현) : <fmt:formatNumber value="0.45" type="percent"/></p>
	<p>정수 최소 10자리 표현, 소수점 2자리 표현 : <fmt:formatNumber value="3200100" minIntegerDigits="10" minFractionDigits="2" /></p>
	<p>소수점 3자리 표현, 빈 곳은 0으로 표시 : <fmt:formatNumber value="3200100.45" pattern=".000" /></p>
	<p>천단위 구분, 소수점 두자리까지 표현, 3자리에서 반올림 : <fmt:formatNumber value="3200155.456" pattern="#,#00.0#" /></p>
</body>
</html>