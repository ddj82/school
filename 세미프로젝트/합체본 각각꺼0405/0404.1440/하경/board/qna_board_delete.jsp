<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
int nt_no = (Integer) request.getAttribute("nt_no");
String nowPage = (String) request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 삭제확인</title>
<style>
	#passForm {
		width: 250px;
		margin: auto;
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
				<a href="loginForm.jsp">로그인</a>
				<a href="joinForm.jsp">/ 회원가입</a>
			</c:otherwise>
		</c:choose>
	</p>
	<section id="passForm">
		<form name="deleteForm" action="boardDeletePro.mc?nt_no=<%=nt_no%>" method="post">
			<input type="hidden" name="page" value="<%=nowPage%>">
			<table>
				<tr>
					<td><label>삭제하시겠습니까?<br><br></label></td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="삭제">&nbsp;&nbsp;
						<input type="button" value="돌아가기" onClick="javascript:history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<br><br>
	<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>