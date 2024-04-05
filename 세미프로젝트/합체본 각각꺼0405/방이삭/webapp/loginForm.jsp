<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style>
#loginFormArea {
	width: 20%;
	margin: 50px auto;
	border: none;
	background-color: #fff;
	border-radius: 5px;
}

fieldset {
	border: none;
	height: 100%;
}

table {
	width: 100%;
	margin: auto;
}

td {
	text-align: left;
	padding: 5px;
	width: 100%;
}

label {
	font-weight: bold;
}

input[type="text"], input[type="password"] {
	width: 100%;
	hegiht: 50px;
	padding: 8px;
	background: transparent;
	border: none;
	border-bottom: 2px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

input[type="text"]:focus, input[type="password"]:focus {
	border-bottom: solid 2px rgb(139, 69, 19);
	outline: none;
}

a {
	text-decoration: none;
	color: rgb(139, 69, 19);
	text-align: center;
}

a:hover {
	text-decoration: underline;
}

#selectButton {
	width: 90%;
	height: 30px;
	text-align: center;
	border: none;
	border-radius: 5px;
	background-color: rgb(205, 133, 63);
	color: #fff;
	cursor: pointer;
	font-size: 16px;
}

h1 {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="../navbar.jsp"%>
	<h1 style="font-size: 28px">로그인</h1>
	<section id="loginFormArea">
		<form action="login" onsubmit="return validateForm()" method="POST">
			<fieldset>
				<table>
					<tr>
						<td><br> <br> <strong>아이디 </strong><br>
						<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." style="font-size: 16px;" /><br></td>
					</tr>
					<tr>
						<td><strong>비밀번호 </strong><br><input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요." /><br></td>
					</tr>
					<tr>
						<td style="text-align: center;"><input type="submit" value="로그인" id="selectButton"><br> <br></td>
					</tr>
				</table>
				<a style="margin:0 auto" href="idFindForm.jsp">아이디 찾기</a> <a style="margin:0 auto" href="pwFindForm.jsp">비밀번호 찾기</a>
			</fieldset>
		</form>
		<script>
			function validateForm() {
				const id = document.getElementById("id").value;
				const pw = document.getElementById("pw").value;
				
				let isValid = true; // 모든 조건문이 실행되었는지를 나타내는 변수 -->

				// 아이디 검사 
				if (id == "" || pw == "") {
					alert("아이디 또는 비밀번호가 존재하지 않습니다.");
					document.getElementById("id").focus();
					isValid = false; // 해당 조건문이 실행됨 -->
				}

				return isValid;
			}
		</script>
	</section>
</body>
</html>