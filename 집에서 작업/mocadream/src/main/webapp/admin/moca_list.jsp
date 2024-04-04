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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/table.css">
<meta charset="UTF-8" />
<title>MVC 게시판</title>
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