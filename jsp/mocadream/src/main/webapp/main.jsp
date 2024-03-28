<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    p {
        text-align: right;
        margin-right: 20px;
    }
</style>
</head>
<body>
	<p>
		<c:choose>
		<c:when test="${id ne null }">
			${id }님, 환영합니다. <a href="logout" id="log">로그아웃</a>
<!-- 			<a href="updateUsers.mc">내 정보수정</a> -->
		</c:when>
		<c:otherwise>
			<a href="loginForm.html" id="log">로그인</a>
		</c:otherwise>
		</c:choose>
	</p>
	<a href="">소식</a>&nbsp;
	<a href="">이용안내</a>&nbsp;
	<a href="">방정보</a>&nbsp;
	<a href="">예약하기</a>&nbsp;
	<a href="">오시는길</a> <br><br><br>
	<c:choose>
		<c:when test="${id eq 'admin' }">
			<a href="admin.jsp">관리자메뉴</a>
		</c:when>
	</c:choose>
</body>
</html>