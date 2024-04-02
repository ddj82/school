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
<style type="text/css">
	#formid {
		width: 90%;
		height: 600px;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	h3 {
		text-align: center;
		color: pink;
	}
	
	table {
		margin: auto;
		width: 90%;
		text-align: center;
		border: 2px solid skyblue;
		border-collapse: collapse;
	}
	
	#tr1 {
		background: skyblue;
		text-align: center;
		border: 1px solid skyblue
	}
	
	tr, th, td {
		border: 2px solid skyblue padding: 5px;
		font-size: 1em;
	}
	
	#pageList {
		margin: auto;
		width: 500px;
		text-align: center;
	}
	
	#noorder {
		margin: auto;
		width: 500px;
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
<form id="formid" method="post">
	<section id="listForm">
		<h2>예약 내역<br></h2>
		<h3><a href="roomListAction.mc">예약하기</a></h3>
		<table>
			<% if (mc_OrderList != null && listCount > 0) { %>
			<tr id="tr1">
				<td>방 번호</td>
				<td>방 이름</td>
				<td>예약자명</td>
				<td>날짜</td>
				<td>이용 시간</td>
				<td>예약 시간</td>
				<td>종료 시간</td>
				<td>사용 여부</td>
			</tr>

			<%
			for (int i = 0; i < mc_OrderList.size(); i++) {
				request.setAttribute("myorder", mc_OrderList.get(i));
			%>
			<tr>
				<td><%=mc_OrderList.get(i).getR_no()%></td>
				<td><%=mc_OrderList.get(i).getR_name()%></td>
				<td><%=mc_OrderList.get(i).getR_uname()%></td>
				<td><%=mc_OrderList.get(i).getR_cal()%></td>
				<td><%=mc_OrderList.get(i).getR_time()%></td>
				<td><%=mc_OrderList.get(i).getR_statime()%></td>
				<td><%=mc_OrderList.get(i).getR_endtime()%></td>
				<td><%=mc_OrderList.get(i).getR_used()%></td>
				<%
				SimpleDateFormat ddd = new SimpleDateFormat("yyyy-MM-ddHH");
				Date now = new Date();
				String now1 = ddd.format(now);
				String orderD = "" + mc_OrderList.get(i).getR_cal() + mc_OrderList.get(i).getR_statime();
				orderD = orderD.replaceAll("-", "");
				now1 = now1.replaceAll("-", "");

				if (Integer.parseInt(now1) < Integer.parseInt(orderD)) {
					String orderD2 = "" + mc_OrderList.get(i).getR_cal();
				%>
				<td>
				<a href="orderDelete.mc?r_no=<%=mc_OrderList.get(i).getR_no()%>&r_cal=<%=orderD2%>&r_statime=<%=mc_OrderList.get(i).getR_statime()%>&r_used=<%=mc_OrderList.get(i).getR_used()%>">
				취소</a>
				</td>
				<% } %>
			</tr>
			<% } %>
		</table>
	</section>
</form>
<section id="pageList">
	<% if (nowPage <= 1) { %>
	[이전]
	<% } else { %>
	<a href="userorder_list.mc?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
	<% } %>

	<%
	for (int a = startPage; a <= endPage; a++) {
		if (a == nowPage) {
	%>
		[<%=a%>]
		<% } else { %>
		<a href="userorder_list.mc?page=<%=a%>">[<%=a%>]</a>&nbsp;
		<% } %>
	<% } %>

	<% if (nowPage >= maxPage) { %>
	[다음]
	<% } else { %>
	<a href="userorder_list.mc?page=<%=nowPage + 1%>">[다음]</a>
	<% } %>
</section>
<% } else { %>
<section id="noorder">예약 내역이 없습니다.</section>
<% } %>

<br><br>
<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>