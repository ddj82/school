<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="vo.Mc_order"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
Mc_order mc_order = (Mc_order) request.getAttribute("mc_order");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOCA DREAM 현재 예약 확인</title>
<style>
#ListArea {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	overflow: auto;
	width: 50%;
	margin: 0 auto;
}

table {
	width: 100%;
	margin: 0 auto;
	border-collapse: collapse;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	text-align: center;
	margin: 0 auto;
}

td, th {
	border: 1px solid #ddd;
	padding: 2px 15px;
	white-space: nowrap;
	height: 50px;
}

th {
	background-color: #f8f8f8;
	font-weight: bold;
}

td.td1 {
	background-color: rgb(242, 231, 220);
}

button, a.button-link {
	background-color: rgb(232, 221, 210);
	border: none;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 30px;
}

button:hover, .button-link:hover {
	opacity: 0.8;
}

a.button {
	color: black;
	background-color: rgb(232, 221, 210);
	border: none;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 30px;
}

a.button:hover {
	opacity: 0.8;
}

section {
	margin-top: 20px;
}

form.input {
	text-align: right;
}

input {
	width: 300px;
	height: 25px;
	padding: 10px;
	background-color: rgb(250, 240, 230);
	border-radius: 10px;
	border: 1px solid #ccc;
}

input:focus {
	border: 2px solid #000;
}

p#log {
	text-align: right;
	margin-right: 20px;
}
</style>
</head>
<body style="background-color: rgb(250, 240, 230);">
	<div style="width:80%; margin:0 auto; background-color:white;">
		<p id="log">
			<c:choose>
				<c:when test="${id ne null }">
					<%
					if (session.getAttribute("id").equals("admin")) {
					%>
					[관리자계정]&nbsp; <a href="logout">로그아웃</a>
					<%
					} else {
					%>
					${id }님, 환영합니다. <a href="logout">로그아웃</a>
					<a href="loginMypage.mc">내 정보수정</a>
					<%
					}
					%>
				</c:when>
				<c:otherwise>
					<a href="loginForm.html">로그인</a>
					<a href="joinForm.jsp">/ 회원가입</a>
				</c:otherwise>
			</c:choose>
		</p>
		<section id="ListArea" style="background-color: white;">
			<table>
				<tr>
					<td class="td1">방 번호 :</td>
					<td><%=mc_order.getR_no()%>번</td>
				</tr>
				<tr>
					<td class="td1">방 이름 :</td>
					<td><%=mc_order.getR_name()%></td>
				</tr>
				<tr>
					<td class="td1">예약자 ID :</td>
					<td><%=mc_order.getR_uname()%></td>
				</tr>
				<%
				SimpleDateFormat ddd = new SimpleDateFormat("yyyy-MM-dd");
				String orderD = ddd.format(mc_order.getR_cal());
				%>
				<tr>
					<td class="td1">예약 일자 :</td>
					<td><%=orderD%></td>
				</tr>
				<tr>
					<td class="td1">예약 시간 :</td>
					<td><%=mc_order.getR_time()%>시간</td>
				</tr>
				<tr>
					<td class="td1">시작 시간 :</td>
					<td><%=mc_order.getR_statime()%>시</td>
				</tr>
				<tr>
					<td class="td1">종료 시간 :</td>
					<td><%=mc_order.getR_endtime()%>시</td>
				</tr>
			
			</table>
		</section>
		<br>
		<br> <a href="main.jsp">메인으로</a>&nbsp;
	</div>
</body>
</html>