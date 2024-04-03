<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="vo.Mc_order"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<%
ArrayList<Mc_order> mc_OrderList = (ArrayList<Mc_order>) request.getAttribute("mc_OrderList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>MOCA DREAM 나의 예약 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
	#ListArea {
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
		overflow: auto;
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

	tr:nth-child(even) {
		background-color: #f2f2f2;
	}

	tr.tr1 {
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
<body style="background-color: rgb(250, 240, 230)">
	<div style="background-color: white; width: 80%; margin: 0 auto; padding: 10px;">
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
	<h1>예약 내역<br></h1>
	<form id="formid" method="post" class="input">
		<a class="button" href="roomListAction.mc">예약하기</a>
		<section id="ListArea">
			<table>
			<% if (mc_OrderList != null && listCount > 0) { %>
				<tr class="tr1">
					<td>날짜</td>
					<td>방 번호</td>
					<td>방 이름</td>
					<td>예약자명</td>
					<td>이용 시간</td>
					<td>예약 시간</td>
					<td>종료 시간</td>
					<td>사용 여부</td>
					<td>취 소</td>
				</tr>

				<%
				for (int i = 0; i < mc_OrderList.size(); i++) {
					request.setAttribute("myorder", mc_OrderList.get(i));
				%>
				<tr>
					<td><%=mc_OrderList.get(i).getR_cal()%></td>
					<td><%=mc_OrderList.get(i).getR_no()%></td>
					<td><%=mc_OrderList.get(i).getR_name()%></td>
					<td><%=mc_OrderList.get(i).getR_uname()%></td>
					<td><%=mc_OrderList.get(i).getR_time()%>시간</td>
					<% if (mc_OrderList.get(i).getR_statime() == 9) { 
						String statime = "09"; %>
						<td><%=statime %>:00</td>
					<% } else { %>
						<td><%=mc_OrderList.get(i).getR_statime()%>:00</td>
					<% } %>
					<td><%=mc_OrderList.get(i).getR_endtime()%>:00</td>
					<td><%=mc_OrderList.get(i).getR_used()%></td>
					
					<%
					SimpleDateFormat ddd = new SimpleDateFormat("yyyy-MM-ddHH");
					Date now = new Date();
					String now1 = ddd.format(now);
					String orderD = "";
					
					if (mc_OrderList.get(i).getR_statime() == 9) {
						orderD = "" + mc_OrderList.get(i).getR_cal() + "0" + mc_OrderList.get(i).getR_statime();
					} else {
						orderD = "" + mc_OrderList.get(i).getR_cal() + mc_OrderList.get(i).getR_statime();
					}
					
					orderD = orderD.replaceAll("-", "");
					now1 = now1.replaceAll("-", "");
					
					System.out.println("now1문자열 : " + now1);
					System.out.println("now1 : " + Integer.parseInt(now1));
					System.out.println("orderD문자열 : " + orderD);
					System.out.println("orderD : " + Integer.parseInt(orderD));
					System.out.println();
					
					if (Integer.parseInt(now1) < Integer.parseInt(orderD)) {
						System.out.println("i : " + i);
						String orderD2 = "" + mc_OrderList.get(i).getR_cal(); %>
						<td>
							<a href="orderDelete.mc?r_no=<%=mc_OrderList.get(i).getR_no()%>&r_cal=<%=orderD2%>&r_statime=<%=mc_OrderList.get(i).getR_statime()%>&r_used=<%=mc_OrderList.get(i).getR_used()%>">취소</a>
						</td>
					<% } %>
				</tr>
				<% } %>
			</table>
		</section>
	</form>
			<section style="text-align: center;">
				<% if (nowPage <= 1) { %>
					[이전]
				<% } else { %>
					<a href="myOrderList.mc?page=<%=nowPage - 1%>">[이전]</a>
				<% } %>
	
				<% for (int a = startPage; a <= endPage; a++) {
					if (a == nowPage) { %>
						[<%=a%>]
					<% } else { %>
						<a href="myOrderList.mc?page=<%=a%>">[<%=a%>]</a>&nbsp;
					<% } %>
				<% } %>
	
				<% if (nowPage >= maxPage) { %>
				[다음]
				<% } else { %>
				<a href="myOrderList.mc?page=<%=nowPage + 1%>">[다음]</a>
				<% } %>
			</section>
		<% } else { %>
		<section id="noorder">예약 내역이 없습니다.</section>
		<% } %>
	</div>
	<br>
	<br>
	<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>