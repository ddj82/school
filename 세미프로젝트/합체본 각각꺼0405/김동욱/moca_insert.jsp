<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   body {
    font-family: Arial, sans-serif;
    background-color: rgb(242 231 220);
    margin: 0;
    padding: 0;
}

p {
    text-align: right;
    margin-right: 20px;
}

textarea {
		resize: none;
		height: 300px;
}


#insertformArea {
    margin: 20px auto;
    width: 50%;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: left;
    padding-left: 20%;
    margin-bottom: 20px;
}

form table {
    margin: auto;
    width: 80%;
}

form table tr td {
    padding: 10px 0;
}

form table tr td label {
    display: inline-block;
    width: 150px;
    font-weight: bold;
}

form table tr td input[type="text"],
form table tr td input[type="file"],
form table tr td textarea {
    width: 80%;
    padding: 8px;
    border: 4px solid rgba(0,0,0,0.5);
    border-radius: 5px;
}

form table tr td input[type="submit"],
form table tr td input[type="button"],
form table tr td input[type="reset"] {
    color: black;
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

form table tr td input[type="submit"]:hover,
form table tr td input[type="button"]:hover,
form table tr td input[type="reset"]:hover {
    opacity: 0.8;
}

section {
    text-align: center;
    margin-top: 20px;
}

a {
    text-decoration: none;
    color: brown;
}

a:hover {
    text-decoration: underline;
}
.r_title {
	background-color: rgb(242 231 220);
	border: 3px solid white;
	border-radius: 20px;
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
				<a href="loginForm.html" >로그인</a>
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
				<td class="r_title"><label for = "R_NAME">룸 이름 : </label></td>
				<td><input type="text" name="R_NAME" id = "R_NAME"/></td>
			</tr>
			<tr>
				<td class="r_title"><label for = "R_MAX">수용인원 : </label></td>
				<td><input type="text" name="R_MAX" id = "R_MAX"/></td>
			</tr>
			<tr>
				<td class="r_title"><label for = "R_DESC">룸 설명 : </label></td>
				<td><textarea name="R_DESC" id = "R_DESC"></textarea></td>
			</tr>
			<tr>
				<td class="r_title"><label for = "R_FILE">룸 사진 : </label></td>
				<td><input type="file" name="R_FILE" id = "R_FILE"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">&nbsp;&nbsp;
					<input type="reset" value="다시쓰기" >
				</td>
			</tr>
			<tr>
	                <td colspan="2">
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