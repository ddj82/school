<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="vo.Mc_order"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<%
Mc_order mc_order = (Mc_order) request.getAttribute("mc_order");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOCA DREAM 현재 예약 확인</title>
<style>
	#memberInfoArea {
		width: 400px;
		margin: auto;
		border: 1px solid gray;
	}
	
	table {
		width: 380px;
		margin: auto;
		text-align: center;
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
	<section id="memberInfoArea">
		<table>
			<tr>
				<td>방 번호 :</td>
				<td><%=mc_order.getR_no()%></td>
			</tr>
			<tr>
				<td>방 이름 :</td>
				<td><%=mc_order.getR_name()%></td>
			</tr>
			<tr>
				<td>예약자 이름 :</td>
				<td><%=mc_order.getR_uname()%></td>
			</tr>
		 <%        
		    SimpleDateFormat ddd = new SimpleDateFormat("yyyy-MM-dd");     
		    String orderD = ddd.format(mc_order.getR_cal()); 
		 %>
		   <tr>
		      <td>예약 일자 : </td>
		      <td><%=orderD%></td>
		   </tr>
			<tr>
				<td>예약 시간 :</td>
				<td><%=mc_order.getR_time()%></td>
			</tr>
			<tr>
				<td>시작 시간 :</td>
				<td><%=mc_order.getR_statime()%></td>
			</tr>
			<tr>
				<td>종료 시간 :</td>
				<td><%=mc_order.getR_endtime()%></td>
			</tr>
			<tr>
				<td colspan=2>
				<a href="main.jsp">메인 화면으로 돌아가기</a>
				</td>
			</tr>
		</table>
	</section>
	<br><br>
	<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>