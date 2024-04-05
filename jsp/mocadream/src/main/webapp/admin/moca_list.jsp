<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="vo.Mc_rooms"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<%
	ArrayList<Mc_rooms> roomList = (ArrayList<Mc_rooms>) request.getAttribute("roomList");
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
<link rel="stylesheet" href="./css/default.css">
<meta charset="UTF-8" />

<title>MVC 게시판</title>
<style>
#ListArea {
	border-radius: 10px;
	overflow: auto;
}

section.small {
	width: 50%;
	margin: 0 auto;
}

#pageList {
	margin: auto;
	width: 500px;
	text-align: center;
}

#emptyArea {
	margin: auto;
	width: 500px;
	text-align: center;
}

section {
	margin-top: 20px;
}

section.title{
	font-size:25px
}

small.warning {
	font-size: 12px;
	color: red;
	padding: 0 3% 0 0;
}

div.d1 {
	background-color: white;
	width: 80%;
	margin: 0 auto;
	padding: 10px;
}

table {
	width: 100%;
	margin: 0 auto;
	border-collapse: collapse;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	text-align: center;
	margin: 0 auto;
}

td {
	padding: 2px 15px;
	white-space: nowrap;
	height: 50px;
	vertical-align: middle;
	border-top: 1px solid #dee2e6;
}

tr.tr1 {
	background-color: #dee2e6;
	font-size:18px;
	color: #343a40;
	border-top: 1px solid #dee2e6;
}

td.td1 {
	background-color: rgb(242, 231, 220);
	font-size:18px;
}

div.right {
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

html {
	font-size: 15px;
}
h1 {
	font-size: 1.6em;
}
</style>
</head>
<body>
<div class="body-wrapper">
<h1>방 목록</h1>
	<section id="ListArea">
	<div class="right">
		<a class="button-link" href="addroom.mc">방 추가</a>
	</div>
		<table>
			<% if (roomList != null && listCount > 0) { %>
			<tr class="tr1">
				<td>방번호</td>
				<td>방이름</td>
				<td>이용가능인원</td>
				<td>소개</td>
				<td>사진</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			<% for (int i = 0; i < roomList.size(); i++) { %>
			<tr>
				<td><%=roomList.get(i).getR_no()%></td>
				<td><%=roomList.get(i).getR_name()%></td>
				<td><%=roomList.get(i).getR_max()%></td>
				<td><%=roomList.get(i).getR_desc()%></td>
				<td><%=roomList.get(i).getR_file()%></td>

				<td><a href="mocaModifyForm.mc?r_no=<%=roomList.get(i).getR_no()%>&page=<%=nowPage%>">[수정]
				</a></td>

				<td><a href="mocaDeleteForm.mc?r_no=<%=roomList.get(i).getR_no()%>&page=<%=nowPage%>">[삭제]
				</a></td>


			</tr>
			<% } %>
		</table>
	</section>
	</div>

	<% } else { %>
	<section id="emptyArea">
		등록된 방이 없습니다. <br>
	</section>
	<%} %>
	<br><br>
	<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>