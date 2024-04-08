<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
<style>
div.div-textcen {
	text-align: center;
}
</style>
</head>
<body>
<div class="body-wrapper">
	<section class="title">예약 조회</section>
	<div class="div-textcen">
		<section class="title2">검색하실 날짜를 선택해 주세요.</section>
		<form action="dayOrderList.mc" method="get">
			<input type="date" name="r_cal">&nbsp;
			<button class="btn" type="submit">조회</button>
		</form>
	</div>
</div>
</body>
</html>