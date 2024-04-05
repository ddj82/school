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
String userId = (String) request.getAttribute("userId");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/table.css">
<meta charset="UTF-8" />
<title>MOCA DREAM 나의 예약 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
</head>
<body>
	<div class="d1">
	<h1>예약 내역<br></h1>
	<div class="right">
			<% if (!session.getAttribute("id").equals("admin")) { %>
			<a class="button" href="roomListAction.mc">예약하기</a><br>
			<% } %>
	</div>
	<form method="post">
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
					
					if (Integer.parseInt(now1) < Integer.parseInt(orderD)) {
						String orderD2 = "" + mc_OrderList.get(i).getR_cal(); %>
						<td>
							<a class="button" href="orderDelete.mc?r_uname=<%=mc_OrderList.get(i).getR_uname()%>&r_no=<%=mc_OrderList.get(i).getR_no()%>&r_cal=<%=orderD2%>&r_statime=<%=mc_OrderList.get(i).getR_statime()%>&r_used=<%=mc_OrderList.get(i).getR_used()%>">취소</a>
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
					<a href="myOrderList.mc?page=<%=nowPage - 1%>&id=<%=userId%>">[이전]</a>
				<% } %>
	
				<% for (int a = startPage; a <= endPage; a++) {
					if (a == nowPage) { %>
						[<%=a%>]
					<% } else { %>
						<a href="myOrderList.mc?page=<%=a%>&id=<%=userId%>">[<%=a%>]</a>&nbsp;
					<% } %>
				<% } %>
	
				<% if (nowPage >= maxPage) { %>
					[다음]
				<% } else { %>
					<a href="myOrderList.mc?page=<%=nowPage + 1%>&id=<%=userId%>">[다음]</a>
				<% } %>
			</section>
		<% } else { %>
		<section id="emptyArea">예약 내역이 없습니다.</section>
		<% } %>
	</div>
	<br>
	<br>
	<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>