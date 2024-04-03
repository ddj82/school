<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#loginFormArea {
	width: 50%; 
	margin: 50px auto; 
	padding: 20px; 
	border: 1px solid #ccc; 
	background-color: #fff;
}

table {
	width: 100%; 
	margin: auto;
}

td {
	text-align: left; 
	padding: 10px;
}

label {
	font-weight: bold;
}

input[type="text"],input[type="password"] {
	width: calc(100% - 20px); 
	padding: 8px; 
	margin-top: 5px; 
	border: 1px solid #ccc; 
	border-radius: 5px;
}

input[type="button"]:hover {
	background-color: rgb(139, 69, 19);
}

a {
	text-decoration: none; 
	color: rgb(139, 69, 19); 
	display: inline-block;
 	text-align: center; 
	font-size: 12px;
}

a:hover {
	text-decoration: underline;
}

#idbox {
	position: relative;
}

#selectButton {
	width: 85px; 
	height: 85px; 
	text-align:center;
	padding: 8px; 
	border: none; 
	border-radius: 5px; 
	background-color: rgb(205, 133, 63); 
	color: #fff; 
	cursor: pointer;
}

#btns {
	text-align: center;
}

h1 {
	text-align: center;
}
</style>
</head>
<body>
<%-- 	<%@ include file="../navbar.jsp"%> --%>
	<h1>로그인</h1>
	<section id="loginFormArea">
		<form action="login" method="POST">
			<fieldset>
				<table>
					<tr>
						<td><label for="id">아이디 : </label></td>
						<td><input type="text" name="id" id="id" /></td>
						<td rowspan="2" style="text-align: center;"><input type="submit" value="로그인" id="selectButton"></td>
					</tr>
					<tr>
						<td><label for="pw">비밀번호 : </label></td>
						<td><input type="password" name="pw" id="pw" /></td>
					</tr>
				</table>
				<a href="idFindForm.jsp">아이디 찾기</a>
				<a href="pwFindForm.jsp">비밀번호 찾기</a>
			</fieldset>
		</form>
	</section>
<%-- 	<%@ include file="../footer.jsp"%> --%>
</body>
</html>