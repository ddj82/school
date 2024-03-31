<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.Mc_rooms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ArrayList<Mc_rooms> mc_rooms = (ArrayList<Mc_rooms>) request.getAttribute("mc_rooms");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOCA DREAM 예약하기 페이지</title>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.js"></script> -->
<style>
	#orderform {
		width: 400px;
		margin: auto;
		border: 1px solid gray;
	}
	
	.input {
		width: 400px;
		height: 30px;
	}
	
	table {
		/* 		width : 380px; */
		margin: auto;
		text-align: center;
	}
	
	#order, #reset {
		width: 30px border
	}
	
	/* 	        input[type=text],select,button { */
	/*             box-sizing: border-box; */
	/*             width: 600px; */
	/*             height: 50px; */
	/*             margin-bottom: 10px; */
	/*             max-width: 100%; */
	/*         } */
	input[type=checkbox] {
		width: 20px;
		height: 20px;
		margin: 0 5px 0 0;
		vertical-align: bottom;
	}
	
	/* .labelClass {margin-right: 20px;} */
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
			</c:otherwise>
		</c:choose>
	</p>
<!-- 	<form name="orderform" action="userOrderAction.mc" method="post"> -->
	<form name="orderform" action="ex.jsp" method="post">
		<section id="orderformArea">
			<table>
				<tr>
					<td colspan="2"><h1>예약 하기</h1></td>
				</tr>

				<tr>
					<td><label for="r_name">방 이름 : </label></td>
					<td>
					<select name="r_name" id="selRname" class="input" onchange="changeOp()">
						<% for (int i = 0; i < mc_rooms.size(); i++) { %>
							<option value="<%=mc_rooms.get(i).getR_name()%>"><%=mc_rooms.get(i).getR_name()%></option>
						<% } %>
					</select>
					</td>
				</tr>
				<tr>
					<td><label for="r_uname">예약자 이름 : </label></td>
					<td><input type="text" name="r_uname" class="input" id="r_uname" /></td>
				</tr>
				<tr>
					<td><label for="r_cal">예약 날짜 : </label></td>
					<td><input type="date" name="r_cal" class="input" id="r_cal" /></td>
				</tr>
				<tr>
					<td><label for="r_statime">예약 시간 : </label></td>
					<td>
					<select name="r_statime" class="input">
							<option>09:00</option>
							<option>10:00</option>
							<option>11:00</option>
							<option>12:00</option>
							<option>13:00</option>
							<option>14:00</option>
							<option>15:00</option>
							<option>16:00</option>
							<option>17:00</option>
							<option>18:00</option>
							<option>19:00</option>
							<option>20:00</option>
					</select>
					</td>
				</tr>
				<tr>
					<td><label for="r_time">이용 시간 : </label></td>
					<td>
					<select name="r_time" class="input">
						<option>1시간 이용</option>
						<option>2시간 이용</option>
						<option>3시간 이용</option>
					</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" id="order" value="예약 신청">&nbsp;&nbsp;
					<input type="reset" id="reset" value="다시 예약하기">
					</td>
				</tr>
			</table>
		</section>
	</form>
	<br><br>
	<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>