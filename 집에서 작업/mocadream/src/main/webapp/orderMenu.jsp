<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    p#log {
        text-align: right;
        margin-right: 20px;
    }
</style>
</head>
<body>
<div class="body-wrapper">
	<button class="button-link" onclick="location.href='nowcheck.mc'">실시간예약 조회</button>
	
	<br><br><br>
	
	<h5>검색하실 날짜를 선택해 주세요.</h5>
	
	<form action="dayOrderList.mc" method="get">
		<input type="date" name="r_cal">&nbsp;
		<button class="button-link" type="submit">예약내역 조회</button>
	</form>
	
	<br><br>
</div>
</body>
</html>