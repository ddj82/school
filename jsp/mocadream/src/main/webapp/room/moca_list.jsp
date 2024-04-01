<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="vo.Mc_rooms"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<meta charset="UTF-8" />
<title>MVC 게시판</title>
<style type="text/css">
	#registForm {
		width: 500px;
		height: 600px;
		border: 1px solid red;
		margin: auto;
	}
	
	h2, h4 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 650px;
	}
	
	#tr_top {
		background: orange;
		text-align: center;
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
	
    p {
        text-align: right;
        margin-right: 20px;
    }
</style>
</head>
<body>
	<p>
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
	<section id="listForm">
		<h2>방 목록<br></h2>
		<table>
			<% if (roomList != null && listCount > 0) { %>
			<tr id="tr_top">
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
		<h4>
			<a href="addroom.mc">(방 추가)</a>
		</h4>
	</section>

	<% } else { %>
	<section id="emptyArea">
		등록된 방이 없습니다. <br>
		<h4><a href="addroom.mc">(방 추가)</a></h4>
	</section>
	<%} %>
	<br><br>
	<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>