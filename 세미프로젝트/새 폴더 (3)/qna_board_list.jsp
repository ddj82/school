<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="vo.Mc_notice"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Mc_notice article = (Mc_notice) request.getAttribute("article");
%>
<%
ArrayList<Mc_notice> articleList = (ArrayList<Mc_notice>) request.getAttribute("articleList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
String search = (String)request.getAttribute("search");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<style>
a {
	text-decoration: none;
	color: black;
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f3f3f3;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}
/* Header 스타일 */
header {
	background-color: #white;
	color: #black;
	padding: 10px 0;
	text-align: center;
}

header h1 {
	margin: 0;
}
/* Navigation 스타일 */
nav a {
	color: #black;
	text-decoration: none;
	padding: 10px 20px;
}

nav a:hover {
	background-color: #777;
}

/* Input ㅅ타일*/
.tit {
	width: 500px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

mark {
  border: 1px solid rgb(242 231 220);
  border-radius: 5px 5px 5px 5px;
  background-color: rgb(242 231 220);
  color: black;
}

/* Table 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}
 td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: rgb(242, 231, 220);
	color: #333;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
/* Pagination 스타일 */
.pagination {
	margin: 20px 0;
	text-align: center;
}

.pagination a {
	color: #333;
	padding: 8px 16px;
	text-decoration: none;
/* 	border: 1px solid #ddd; */
	margin: 0 4px;
}

.pagination a.active {
	background-color: rgb(242, 231, 220);
	color: white;
}

.find {
	text-align: right;
}

#finding:hover {
	background-color: #ddd;
	color: #555;
}

#finding {
	padding: 5px 5px;
	border: 1px solid rgb(242, 231, 220);
	background-color: rgb(242, 231, 220);
	color: #333333;
	border-radius: 5px 5px 5px 5px;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
/* Responsive Styles */
@media only screen and (max-width: 600px) {
	nav {
		text-align: center;
	}
	table {
		font-size: 14px;
	}
	
	.find{
		text-align: left;
	}
	.tit{
		width: 300px;
	}
}
</style>
</head>
<body>
	<%@ include file="../navbar.jsp"%>
	<br><br>
	<header>
		<h1>공지사항</h1>
	</header>
	<div style="background-color: white; width: 80%; margin: 0 auto;">
		<div class="container">

			<section id="listForm">
				<h2>
					<%
					if (session.getAttribute("id") == null) {
					%>
					공지 글 목록<br>
					<%
					} else if (session.getAttribute("id").equals("admin")) {
					%>
					공지 글 목록<br>
					<br> <a href="boardWriteForm.mc">공지사항 글쓰기</a>
					<%
					} else {
					%>
					공지 글 목록
					<%
					}
					%>
				</h2>
				<form class="find" action="boardList.mc">
					<input class="tit" name="search" type="search" id="search"
						placeholder="제목을 입력해주세요"> <label for="search"><input
						id="finding" type="submit" value="검색"></label>
						 <a href="boardList.mc"><input id="finding" type="button"value="목록보기"></a>
				</form>
				<br>
				<br>
				<%
				if (articleList != null && listCount > 0) {
				%>
				<table>
					<tr id="tr_top">
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
					<%
					for (int i = 0; i < articleList.size(); i++) {
					%>
					<tr>
						<td><%=articleList.get(i).getNt_no()%></td>
						<td><a href="boardDetail.mc?nt_no=<%=articleList.get(i).getNt_no()%>&page=<%=nowPage%>"><%=articleList.get(i).getNt_title()%></a>
						</td>
						<td><%=articleList.get(i).getNt_writer()%></td>
						<td><%=articleList.get(i).getNt_date()%></td>
					</tr>
					<%
					}
					%>
				</table>
				<div class="pagination">
					<%
					if (nowPage <= 1) {
					%>
					<mark>이전</mark>
					<%
					} else {
					%>
					<a href="boardList.mc?page=<%=nowPage - 1%>&search=<%=search%>">
						<mark>이전</mark></a>&nbsp;
					<%
					}
					%>
					<%
					for (int a = startPage; a <= endPage; a++) {
						if (a == nowPage) {
					%>
<!-- 					<a href="#" class="active"> -->
					<%=a%>
<!-- 					</a> -->
					<%
					} else {
					%>
					<a href="boardList.mc?page=<%=a%>&search=<%=search%>"><%=a%>
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
					<mark>다음</mark>
					<%
					} else {
					%>
					<a href="boardList.mc?page=<%=nowPage + 1%>&search=<%=search%>"><mark>다음</mark></a>
					<%
					}
					%>
				</div>
				<%
				} else if (request.getParameter("search").equals("nt_title")) {
				%>
				<%
				for (int i = 0; i < articleList.size(); i++) {
				%>
				<tr>
					<td><%=articleList.get(i).getNt_no()%></td>
					<td><a
						href="boardDetail.mc?nt_no=<%=articleList.get(i).getNt_no()%>&page=<%=nowPage%>"><%=articleList.get(i).getNt_title()%></a>
					</td>
					<td><%=articleList.get(i).getNt_writer()%></td>
					<td><%=articleList.get(i).getNt_date()%></td>
				</tr>
				<%
				}
				%>
				<%
				} else {
				%>
				<div id="emptyArea">등록된 글이 없습니다.</div>
				<%
				}
				%>
			</section>
			<br>
			<br> <a href="main.jsp">메인으로</a>&nbsp;
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>

