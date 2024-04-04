<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.Mc_users, vo.PageInfo"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<% 
response.setContentType("text/html;charset=UTF-8"); 
ArrayList<Mc_users> memberList = (ArrayList<Mc_users>) request.getAttribute("memberList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
String search = (String)request.getAttribute("search");
%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
<meta charset="UTF-8">
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
</head>
<body>
<div class="body-wrapper">
		<h1>회원 목록</h1>
		<div class="right">
		<form action="memberListAction.mc" method="POST">
			<input type="text" id="search" name="search" placeholder="검색어를 입력하세요">
			<button class="table" type="submit">검색</button><br>
		</form>
		</div>
		<small class="warning">*정지회원은 정지, 탈퇴회원은 탈퇴로 검색해주세요.*</small>
		<br>
		<section id="ListArea">

		<% if (memberList != null && listCount > 0) { %>
			<table>
				<tr class="tr1">
					<td>아이디</td>
					<td>비밀번호</td>
					<td>이름</td>
					<td>연락처</td>
					<td>이메일</td>
					<td>주소</td>
					<td>경고횟수</td>
					<td>이용내역</td>
					<td>회원상태</td>
					<td>경고주기</td>
					<td>정지해제</td>
				</tr>
				<%
				for (int i = 0; i < memberList.size(); i++) {
					if (!memberList.get(i).getId().equals("admin")) {
				%>
				<tr>
					<td><%=memberList.get(i).getId()%></td>
					<td><%=memberList.get(i).getPw()%></td>
					<td><%=memberList.get(i).getName()%></td>
					<td><%=memberList.get(i).getTel()%></td>
					<td><%=memberList.get(i).getEmail()%></td>
					<td><%=memberList.get(i).getAddr()%></td>
					<td><%=memberList.get(i).getWar()%></td>
					
					<td>
					<button onclick="location.href='myOrderList.mc?id=<%=memberList.get(i).getId()%>'">내역확인</button>
					</td>
					
					<td>
						<%
						int state = memberList.get(i).getState();
						if (state == 1) {
							out.print("정상 회원");
						} else if (state == 2) {
							out.print("정지");
						} else if (state == 0) {
							out.print("탈퇴");
						} else {
							out.print("해당 없음");
						}
						%>
					</td>
					
					

					<% if (state == 1) { %>
					<td>
						<button onclick="location.href='memberWarningAction.mc?id=<%=memberList.get(i).getId()%>'">경고주기</button>
					</td>
					<% } else { %>
					<td></td>
					<% } %>

					<% if (state == 2) { %>
					<td>
						<button onclick="location.href='memberReleaseAction.mc?id=<%=memberList.get(i).getId()%>'">정지해제</button>
					</td>
					<% } else { %>
					<td></td>
					<% } %>
				</tr>
				<% }

				} %>
			</table>
		</section>

		<section style="text-align: center;">
			<% if (nowPage <= 1) { %>
			[이전]
			<% } else { %>
<%-- 			<a href="memberListAction.mc?page=<%=nowPage - 1%>&search=<%=search%>">[이전]</a>&nbsp; --%>
			<button onclick="location.href = 'memberListAction.mc?page=<%=nowPage - 1%>&search=<%=search%>';">[이전]</button>
			<% } %>

			<% for (int a = startPage; a <= endPage; a++) {
				if (a == nowPage) { %>
			[<%=a%>]
			<% } else { %>
			<a href="memberListAction.mc?page=<%=a%>&search=<%=search%>">[<%=a%>]</a>&nbsp;
			<% } %>
			<% } %>

			<% if (nowPage >= maxPage) { %>
			[다음]
			<% } else { %>
			<a href="memberListAction.mc?page=<%=nowPage + 1%>&search=<%=search%>">[다음]</a>
			<% } %>

		<% } else { %>
		<section id="emptyArea">해당 회원이 없습니다.</section>
		<% } %>
		</section>
	</div>
	<br>
	<br>
</body>
</html>