<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#insertformArea{
		width : 400px;
		margin : auto;
		border : 1px solid gray;
	}
	table{
		width : 380px;
		margin :  auto;
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
				[관리자계정]&nbsp; <a href="logout">로그아웃</a>
			</c:when>
			<c:otherwise>
				<a href="loginForm.jsp" >로그인</a>
			</c:otherwise>
		</c:choose>
	</p>
	<section id="insertformArea">
	<form name="insertRoom" action="insertRoom.mc" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td colspan="2">
					<h1>방 추 가</h1>
				</td>
			</tr>
			<tr>
				<td><label for = "R_NAME">룸 이름 : </label></td>
				<td><input type="text" name="R_NAME" id = "R_NAME"/></td>
			</tr>
			<tr>
				<td><label for = "R_MAX">수용인원 : </label></td>
				<td><input type="text" name="R_MAX" id = "R_MAX"/></td>
			</tr>
			<tr>
				<td><label for = "R_DESC">룸 설명 : </label></td>
				<td><input type="text" name="R_DESC" id = "R_DESC"/></td>
			</tr>
			<tr>
				<td><label for = "R_FILE">룸 사진 : </label></td>
				<td><input type="file" name="R_FILE" id = "R_FILE"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">&nbsp;&nbsp;
					<input type="reset" value="다시쓰기" >
				</td>
			</tr>
		</table>
	</form>
	</section>
	<br><br>
	<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>