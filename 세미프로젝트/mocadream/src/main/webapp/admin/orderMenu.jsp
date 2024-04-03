<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
	<p id="log">
		<c:choose>
			<c:when test="${id ne null }">
				<% if (session.getAttribute("id").equals("admin")) { %>
					[관리자계정]&nbsp; <a href="logout">로그아웃</a>
				<% } else { %>
					${id }님, 환영합니다. <a href="logout">로그아웃</a>
					<a href="loginMypage.mc">내 정보수정</a>
				<% } %>
			</c:when>
			<c:otherwise>
				<a href="loginForm.jsp">로그인</a>
				<a href="joinForm.jsp">/ 회원가입</a>
			</c:otherwise>
		</c:choose>
	</p>
	<button class="button-link" onclick="location.href='nowcheck.mc'">실시간예약 조회</button>
	
	<br><br><br>
	
	<h5>검색하실 날짜를 선택해 주세요.</h5>
	
	<form action="dayOrderList.mc" method="post">
		<input type="date" name="r_cal">&nbsp;
		<button class="button-link" type="submit">예약내역 조회</button>
	</form>
	
	<br><br>
	
	<a href="../main.jsp">메인으로</a>&nbsp;
</body>
</html>