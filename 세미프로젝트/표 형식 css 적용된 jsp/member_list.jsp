<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.Mc_users, vo.PageInfo"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setContentType("text/html;charset=UTF-8");

Mc_users article = (Mc_users) request.getAttribute("article");
ArrayList<Mc_users> memberList = (ArrayList<Mc_users>) request.getAttribute("memberList");;
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

a {
	color: #007bff;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
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
	<div
		style="background-color: white; width: 80%; margin: 0 auto; padding: 10px;">
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

		<h1>회원 목록</h1>

		<form action="memberListAction.mc" method="POST" class="input">
			<input type="text" id="search" name="search" placeholder="검색어를 입력하세요">
			<button type="submit">검색</button><br>
		</form>
		<small style="color:red; float: right; width: 25%;">*정지회원은 정지, 탈퇴회원은 탈퇴로 검색해주세요.*</small>
		<br>
		<section id="ListArea">

			<%
			if (memberList != null && listCount > 0) {
			%>
			<table>
				<tr class="tr1">
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
				for (int i = 0; i < memberList.size(); i++) {
					System.out.println(memberList.get(i).getId());
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

					<%
					if (state == 1) {
					%>
					<td>
						<button class="button-link"
							onclick="location.href='memberWarningAction.mc?id=<%=memberList.get(i).getId()%>'">경고주기</button>
					</td>
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
					<td>
						<button class="button-link"
							onclick="location.href='memberReleaseAction.mc?id=<%=memberList.get(i).getId()%>'">정지해제</button>
					</td>
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
		</section>

		<section style="text-align: center;">
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

	</div>
	<br>
	<br>
	<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>