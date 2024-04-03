<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.Mc_users, vo.PageInfo"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setContentType("text/html;charset=UTF-8");

Mc_users article = (Mc_users) request.getAttribute("article");
ArrayList<Mc_users> articleList = (ArrayList<Mc_users>) request.getAttribute("articleList");
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
<meta charset="UTF-8">
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
<style>
#memberListArea {
	width: 80%;
	border: 1px solid gray;
	margin: 50px auto;
	padding: 5px;
}

table {
	width: 100%;
	margin: auto;
	text-align: center;
}

td {
	border: 1px solid gray;
	padding: 10px;
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
			</c:otherwise>
		</c:choose>
	</p>
	<section id="memberListArea">

		<form action="memberListAction.mc" method="POST">
			<label for="search">검색어: </label> <input type="text" id="search"
				name="search" placeholder="검색어를 입력하세요">
			<button type="submit">검색</button>
		</form>



		<%
		if (articleList != null && listCount > 0) {
		%>
		<table>
			<tr>
				<td colspan=10><h1>회원 목록</h1></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>연락처</td>
				<td>이메일</td>
				<td>주소</td>
				<td>경고횟수</td>
				<td>회원상태</td>
				<td>경고주기</td>
				<td>정지해제</td>
			</tr>
			<%
			for (int i = 0; i < articleList.size(); i++) {
				System.out.println(articleList.get(i).getId());
				if(!articleList.get(i).getId().equals("admin")){
			%>
			<tr>
				<td><%=articleList.get(i).getId()%></td>
				<td><%=articleList.get(i).getPw()%></td>
				<td><%=articleList.get(i).getName()%></td>
				<td><%=articleList.get(i).getTel()%></td>
				<td><%=articleList.get(i).getEmail()%></td>
				<td><%=articleList.get(i).getAddr()%></td>
				<td><%=articleList.get(i).getWar()%></td>
				<td>
					<%
					int state = articleList.get(i).getState();
					if (state == 1) {
						out.print("정상 회원");
					} else if (state == 2) {
						out.print("정지 회원");
					} else if (state == 0) {
						out.print("탈퇴 회원");
					} else {
						out.print("해당 없음");
					}
					%>
				</td>

				<%
				if (state == 1) {
				%>
				<td><a
					href="memberWarningAction.mc?id=<%=articleList.get(i).getId()%>">경고주기</a></td>
				<%
				} else {
				%>
				<td></td>
				<%
				}
				%>

				<%
				if (state == 2) {
				%>
				<td><a
					href="memberReleaseAction.mc?id=<%=articleList.get(i).getId()%>">
						정지해제 </a></td>

				<%
				} else {
				%>
				<td></td>
				<%
				}
				%>
			</tr>
			<%
			
			}
			
			}
			%>
		</table>

		<section>
			<%
			if (nowPage <= 1) {
			%>
			[이전]
			<%
			} else {
			%>
			<a href="memberListAction.mc?page=<%=nowPage - 1%>">[이전]</a>&nbsp;
			<%
			}
			%>

			<%
			for (int a = startPage; a <= endPage; a++) {
				if (a == nowPage) {
			%>
			[<%=a%>]
			<%
			} else {
			%>
			<a href="memberListAction.mc?page=<%=a%>">[<%=a%>]
			</a>&nbsp;
			<%
			}
			%>
			<%
			}
			%>

			<%
			if (nowPage >= maxPage) {
			%>
			[다음]
			<%
			} else {
			%>
			<a href="memberListAction.mc?page=<%=nowPage + 1%>">[다음]</a>
			<%
			}
			%>

			<%
			} else {
			%>
			<section>등록된 회원이 없습니다.</section>
			<%
			}
			%>
		</section>

		<br> <br> <a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>