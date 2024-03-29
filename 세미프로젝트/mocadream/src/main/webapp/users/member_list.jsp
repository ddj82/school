<%@ page import="vo.Mc_users"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% response.setContentType("text/html;charset=UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
<style>
	#memberListArea {
		width: 700px;
		border: 1px solid gray;
		margin: auto;
	}
	
	table {
		width: 500px;
		margin: auto;
		text-align: center;
	}
	
	td {
		border: 1px solid gray;
	}
</style>
</head>
<body>
	<p>
		<c:choose>
		<c:when test="${id ne null }">
			${id }님, 환영합니다. <a href="logout" id="log">로그아웃</a>
		</c:when>
		<c:otherwise>
			<a href="loginForm.html" id="log">로그인</a>
		</c:otherwise>
		</c:choose>
	</p>
	<section id="memberListArea">
		<table>
			<tr>
				<td colspan=2><h1>회원 목록</h1></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>연락처</td>
				<td>이메일</td>
				<td>경고</td>
				<td>회원상태</td>
				<td>제제</td>
				<td>석방</td>
			</tr>
			<c:forEach var="member" items="${memberList}">

				<tr>
					<c:choose>
						<c:when test="${member.id ne 'admin'}">
							<td>${member.id}</td>
							<td>${member.pw}</td>
							<td>${member.name}</td>
							<td>${member.tel}</td>
							<td>${member.email}</td>
							<td>${member.war}</td>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${member.id ne 'admin'}">
							<td>
								<c:choose>
									<c:when test="${member.state eq '1'}">정상 회원</c:when>
									<c:when test="${member.state eq '2'}">제제 회원</c:when>
									<c:when test="${member.state eq '0'}">탈퇴 회원</c:when>
									<c:otherwise>해당 없음</c:otherwise>
								</c:choose>
							</td>
							<td>
								<a href="memberWarningAction.mc?id=${member.id}"><c:choose>
										<c:when test="${member.state ne '2'}">제제</c:when>
									</c:choose>
								</a>
							</td>
		
							<td>
								<a href="memberReleaseAction.mc?id=${member.id}"><c:choose>
										<c:when test="${member.state eq '2'}">석방</c:when>
									</c:choose>
								</a>
							</td>
						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
	</section>
	<br><br><br><br>
	<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>