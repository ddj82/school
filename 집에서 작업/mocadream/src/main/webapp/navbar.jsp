<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<% if (!(session.getAttribute("id") == null)) {
	if (session.getAttribute("id").equals("admin")) { %>
		<%@ include file="/admin/admincss.jsp" %>
	<% }
} %>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Josefin+Slab:ital,wght@0,100..700;1,100..700&family=Merienda:wght@300..900&family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&family=Rowdies:wght@300;400;700&family=Sora:wght@100..800&display=swap" rel="stylesheet">
<% if (!(session.getAttribute("id") == null)) {
	if (session.getAttribute("id").equals("admin")) { %>
		<%@ include file="/admin/adminscript.jsp" %>
	<% }
} %>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: "Merriweather", serif;
}

div.ddiv {
	display: none;
}

/*  nav-var style  */
.navbar__title {
	display: flex;
	justify-content: center;
	padding-bottom: 40px;
	background-color: rgb(7, 10, 60);
	color: rgba(255, 255, 255, 1);
}

.navbar__title>p {
	display: inline-block;
	margin: auto 20px;
	font-size: 40px;
	font-weight: bold;
}

.navbar__img {
 	background-image: url("./roompic/logo1.png");
	color: black;
	padding-left: 0;
	width: 100px;
	height: 80px;
	background-size: 100% 100%;
	display: inline-block;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	color: rgb(205, 133, 63)
}

/* navbar__menu 메뉴창 */
.navbar__menu {
	list-style: none;
	display: flex;
	margin: 0;
	justify-content: center;
	background-color: white;
	border-top: 1px solid #e1e1e1;
	border-bottom: 1px solid #e1e1e1;
	height: 80px;
	align-items: center;
}

/* menu list */
.navbar__menu li {
	padding: 10px 40px;
	font-size: 18px;
	border-right: 1px solid #e1e1e1;
}

.navbar__menu li>p {
	height: 40%
}

.navbar__menu li a {
	color: #333;
}

.navbar__menu li a:hover {
	color: rgb(205, 133, 63)
}

/* navbar__sign 로그인 */
.navbar__sign {
	justify-content: end;
	list-style: none;
	display: flex;
	margin: 0;
	background-color: rgb(7, 10, 60);
}

/* sign list */
.navbar__sign li {
	/* 	border-radius:5px; */
	/*  background-color:black; */
	padding: 8px 18px;
	text-align: center;
}

.navbar__sign li a {
	color: rgba(255, 255, 255, 0.65);
	/*   color:white; */
	padding: 10px;
}

.menu {
	cursor: pointer;
}

.menu .hide {
	display: none;
}

.ad_li {
	font-size: 12px;
	padding: 8px 10px;
}

.navbar__title:hover {
	cursor: pointer;
}
a.logA {
	color: rgba(255, 255, 255, 0.65);
}
<% if (!(session.getAttribute("id") == null)) {
	if (session.getAttribute("id").equals("admin")) { %>
		<%@ include file="/admin/adminstyle2.jsp" %>
	<% }
} %>
</style>
</head>
<body>
	<nav class="navbar">
		<ul class="navbar__sign">
			<li>
			<c:choose>
				<c:when test="${id ne null }">
					<% if (session.getAttribute("id").equals("admin")) { %>
						[관리자계정]&nbsp; <a href="logout">로그아웃</a>
						<a href="">관리자 페이지</a>
					<% } else { %>
						${id }님, 환영합니다. <a href="logout">로그아웃</a>
						<a href="loginMypage.mc">내 정보수정</a>
					<% } %>
				</c:when>
				<c:otherwise>
					<a href="loginForm.jsp">로그인</a>
					<a href="joinForm.jsp">회원가입</a>
				</c:otherwise>
			</c:choose>
			</li>
		</ul>

		<div class="navbar__title" onclick="location.href='./main.jsp';">
			<div class="navbar__img" onclick="location.href='./main.jsp';"></div>
			<p style="font-family: 'Merriweather', serif;">MocaDream</p>
		</div>

		<c:choose>
			<c:when test="${id ne null }">
				<%
				if (session.getAttribute("id").equals("admin")) {
				%>
				<ul class="navbar__menu">
					<li><a href="boardList.mc">공지사항</a></li>
					<li><a href="./way_moca.jsp">이용방법</a></li>
					<li><a href="mocaDetail.mc">방정보</a></li>
					<li><a href="./map.jsp">오시는길</a></li>
				</ul>

<!-- 				<ul class="navbar__menu"> -->
<!-- 					<li class="admin"><a href="memberListAction.mc">회원리스트 조회</a></li> -->
<!-- 					<li class="admin"><a href="./orderMenu.jsp">예약 리스트</a></li> -->
<!-- 					<li class="admin"><a href="mocaList.mc">방 관리</a></li> -->
<!-- 					<li class="admin"><a href="boardList.mc">공지 관리</a></li> -->
<!-- 				</ul> -->
				<% if (session.getAttribute("id").equals("admin")) { %>
					<%@ include file="/admin/adminbody.jsp" %>
				<% }


				
				} else {
				%>
				<ul class="navbar__menu">
					<li><a href="boardList.mc">공지사항</a></li>
					<li><a href="./way_moca.jsp">이용방법</a></li>
					<li><a href="mocaDetail.mc">방정보</a></li>
					<li><a href="roomListAction.mc">예약하기</a></li>
					<li><a href="myOrderList.mc">예약 내역 확인</a></li>
					<li><a href="./map.jsp">오시는길</a></li>
				</ul>
				<%
				}
				%>
			</c:when>
			<c:otherwise>
				<ul class="navbar__menu">
					<li><a href="boardList.mc">공지사항</a></li>
					<li><a href="./way_moca.jsp">이용방법</a></li>
					<li><a href="mocaDetail.mc">방정보</a></li>
					<li><a href="roomListAction.mc">예약하기</a></li>
					<li><a href="./map.jsp">오시는길</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</nav>
</body>
</html>