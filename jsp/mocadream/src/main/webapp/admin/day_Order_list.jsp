<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Mc_order" %>
<%@ page import="vo.PageInfo" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<%
	ArrayList<Mc_order> dayOrderList = (ArrayList<Mc_order>) request.getAttribute("dayOrderList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/table.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="body-wrapper">
	<h1>예약 리스트</h1>
	<br>
	<section id="ListArea">
		<table>
<% if (dayOrderList != null && listCount > 0) { %>
			<tr class="tr1">
				<td>예약일자</td>
				<td>방번호</td>
				<td>방이름</td>
				<td>예약자</td>
				<td>입실시간</td>
				<td>퇴실시간</td>
				<td>이용시간</td>
				<td>사용 여부</td>
				<td>취 소</td>
			</tr>
	<%for (int i = 0; i < dayOrderList.size(); i++) { %>
			<tr>
				<td><%=dayOrderList.get(i).getR_cal() %></td>
				<td><%=dayOrderList.get(i).getR_no()%></td>
				<td><%=dayOrderList.get(i).getR_name() %></td>
				<td><%=dayOrderList.get(i).getR_uname() %></td>
				<td><%=dayOrderList.get(i).getR_statime() %> : 00</td>
				<td><%=dayOrderList.get(i).getR_endtime() %> : 00</td>
				<td><%=dayOrderList.get(i).getR_time() %>시간</td>
				<td><%=dayOrderList.get(i).getR_used()%></td>
				<td>
					<% String orderD2 = "" + dayOrderList.get(i).getR_cal(); %>
					<a class="button" href="orderDelete.mc?r_no=<%=dayOrderList.get(i).getR_no()%>&r_cal=<%=orderD2%>&r_statime=<%=dayOrderList.get(i).getR_statime()%>&r_uname=<%=dayOrderList.get(i).getR_uname()%>&r_used=<%=dayOrderList.get(i).getR_used()%>">취소</a>
				</td>
			</tr>
	<%} %>
		</table>
	</section>

	<section id="pageList">
		<%if (nowPage <= 1) { %>
			[이전]
		<%} else { %>
			<a href="dayOrderList.mc?page=<%= nowPage-1 %>">[이전]</a>
		<%} %>

		<%for (int a = startPage; a <= endPage; a++){
				if (a == nowPage) {%>
					[<%=a %>]
				<%} else { %>
					<a href="dayOrderList.mc?page=<%= a %>">[<%= a %>]</a>&nbsp;
				<%} %>
		<%} %>

		<%if (nowPage >= maxPage) { %>
			[다음]
		<%} else { %>
			<a href="dayOrderList.mc?page=<%= nowPage + 1 %>">[다음]</a>
		<%} %>
	</section>
<% } else { %>
	<section id="emptyArea">예약 된 룸이 없습니다.</section>
<% } %>
	<br><br>
	<a href="../main.jsp">메인으로</a>&nbsp;
</body>
</html>