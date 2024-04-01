<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.Mc_users"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% response.setContentType("text/html;charset=UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
<style>
#memberListArea {
	width: 80%;
	border: 1px solid gray;
	margin: 50px auto;
	padding: 5px;
}

table {
	width: 100%;
	margin: auto;
	text-align: center;
}

td {
	border: 1px solid gray;
	padding: 10px;
}
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
				<a href="loginForm.html">로그인</a>
				<a href="joinForm.jsp">/ 회원가입</a>
			</c:otherwise>
		</c:choose>
	</p>
	<section id="memberListArea">

		<form action="memberListAction.mc" method="POST">
            <label for="search">검색어: </label>
            <input type="text" id="search" name="search" placeholder="검색어를 입력하세요">
            <button type="submit">검색</button>
        </form>
        
		<table>
			<tr>
				<td colspan=9><h1>회원 목록</h1></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>연락처</td>
				<td>이메일</td>
				<td>경고횟수</td>
				<td>회원상태</td>
				<td>경고주기</td>
				<td>정지해제</td>
			</tr>
			<c:forEach var="member" items="${memberList}">
			<c:choose>
				<c:when test="${member.id ne 'admin'}">
				<tr>
					<td>${member.id}</td>
					<td>${member.pw}</td>
					<td>${member.name}</td>
					<td>${member.tel}</td>
					<td>${member.email}</td>
					<td>${member.war}</td>
					<td><c:choose>
							<c:when test="${member.state eq '1'}">정상 회원</c:when>
							<c:when test="${member.state eq '2'}">정지 회원</c:when>
							<c:when test="${member.state eq '0'}">탈퇴 회원</c:when>
							<c:otherwise>해당 없음</c:otherwise>
						</c:choose></td>

					<td><a href="memberWarningAction.mc?id=${member.id}"> <c:choose>
								<c:when test="${member.state eq '1'}">경고주기</c:when>
							</c:choose>
					</a></td>

					<td><a href="memberReleaseAction.mc?id=${member.id}"> <c:choose>
								<c:when test="${member.state eq '2'}">정지해제</c:when>
							</c:choose>
					</a></td>
				</tr>
				</c:when>
			</c:choose>
			</c:forEach>
		</table>
	</section>
	
	<br><br>
	<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>