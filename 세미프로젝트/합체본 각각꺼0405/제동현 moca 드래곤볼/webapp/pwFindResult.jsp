<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
  margin: 0;
  padding: 0;
}

h1{
  text-align: center;
  margin-top: 20px;
}

#pwchangeformArea {
  width:30%;
  margin: 20px auto;
  background-color: #fff;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

form {
  display: flex;
  flex-direction: column;
}

div {
  margin: 15px 0;
}

label {
  font-weight: bold;
  margin: 20px 0;
}

input[type="password"] {
  width: calc(100% - 20px);
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

button {
  width: 30%;
  padding: 10px;
  background-color: rgb(205, 133, 63);
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: rgb(139, 69, 19);
}

.btn {
  display:flex;
  justify-content:space-around;
}

a {
  display: block;
  text-align: center;
}

p {
  font-size: 16px;
}
</style>
</head>
<body>
<section id="pwchangeformArea">
 <h1>비밀번호 변경</h1>
 <form name="pwchangeform" method="post" onsubmit="return validateForm()" action="memberPwChangeAction.mc">
<!--  <form name="pwchangeform" method="post" action="memberPwChangeAction.mc"> -->
<%
String pwValue = (String) request.getAttribute("pwValue");
%>
    <p>본인확인이 완료되었습니다.</p>
    <input type="hidden" name="oldpw" value="<%= pwValue %>">
    <input type="hidden" name="id" value="<%=request.getParameter("id") %>">
    <input type="hidden" name="name" value="<%=request.getParameter("name") %>">
    <input type="hidden" name="email" value="<%=request.getParameter("email") %>">
    	
	<div>
	<label for="newpass">변경할 비밀번호</label>
	<input type="password" name="newpass" id="newpass" pattern="[a-zA-Z0-9!_\-!@#$%^&*]+" minlength="8" maxlength="15" placeholder="새 비밀번호">
	</div>
	<div id="newpwerrorMessages" style="color: red; display: none;"></div>
	<div id="oldpwerrorMessages" style="color: red; display: none;"></div>
	
	<div>
	<label for="newpasscf">변경할 비밀번호 확인</label>
	<input type="password" name="newpasscf" id="newpasscf" pattern="[a-zA-Z0-9!_\-!@#$%^&*]+" minlength="8" maxlength="15" placeholder="새 비밀번호 확인">
	</div>
	<div id="newpwcferrorMessages" style="color: red; display: none;"></div>
 	

 	<div class="btn">
 	<button id="changeBtn" >비밀번호 변경</button>
	<button id="returnBtn" onclick="location.href='./memberLogin.mc'">로그인 페이지</button>
	</div>
	</form>
	<script>
		function validateForm() {
			// 모든 오류 메시지 초기화
			document.getElementById("newpwerrorMessages").innerHTML = "";
			document.getElementById("oldpwerrorMessages").innerHTML = "";
			document.getElementById("newpwcferrorMessages").innerHTML = "";
			
			   // 오류 메시지 영역 숨기기
	        document.getElementById("newpwerrorMessages").style.display = "none";
	        document.getElementById("oldpwerrorMessages").style.display = "none";
	        document.getElementById("newpwcferrorMessages").style.display = "none";
			
			const oldpass = "<%= pwValue %>";
			const newpass = document.getElementById("newpass").value;
			const newpasscf = document.getElementById("newpasscf").value;
			
			let isValid = true; // 모든 조건문이 실행되었는지를 나타내는 변수

			// 비밀번호 검사
			if (newpass === oldpass) {
				document.getElementById("oldpwerrorMessages").innerHTML = "●&nbsp 이전에 사용하던 비밀번호는 사용할 수 없습니다.";
				document.getElementById("oldpwerrorMessages").style.display = "block";
				isValid = false;
			}

			// 새 비밀번호 검사
			if (newpass === "") {
				document.getElementById("newpwerrorMessages").innerHTML = "●&nbsp 새 비밀번호를 입력해주세요.";
				document.getElementById("newpwerrorMessages").style.display = "block";
				isValid = false;
			}
			
			// 비밀번호 확인 검사
			if (newpasscf !== newpass) {
				document.getElementById("newpwcferrorMessages").innerHTML = "●&nbsp 새 비밀번호를 동일하게 입력해주세요.";
				document.getElementById("newpwcferrorMessages").style.display = "block";
				isValid = false;
			}

			// 모든 조건문이 한 번씩 실행되었는지 확인하고 결과 반환
			return isValid;
		}
		
	
	</script>
</section>
	
</body>
</html>
