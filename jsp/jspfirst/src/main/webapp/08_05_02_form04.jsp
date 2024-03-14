<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h3>회원가입</h3>
<!-- 	<form action="08_05_02_form04_process.jsp" name="member" method="post"> -->
	<form name="member">
		<p>
			아이디 : <input type="text" name="id">
			<input type="button" value="아이디 중복검사">
		</p>
		<p>비밀번호 : <input type="password" name="passwd"></p>
		<p>이름 : <input type="text" name="name"></p>
		<p>
			연락처 : 
			<select name="phone1">
				<option value="010" selected>010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select>
			-
			<input type="text" maxlength="4" size="4" name="phone2">
			-
			<input type="text" maxlength="4" size="4" name="phone3">
		</p>
		<p>
			성별 : 
			<input type="radio" name="gender" value="남성" id="male" checked><label for="male">남성</label>
			<input type="radio" name="gender" value="여성" id="female"><label for="female">여성</label>
		</p>
		<p>
			취미 : 
			<input type="checkbox" value="독서" name="hobby1" id="hobby1" checked><label for="hobby1">독서</label>
			<input type="checkbox" value="운동" name="hobby2" id="hobby2"><label for="hobby2">운동</label>
			<input type="checkbox" value="영화" name="hobby3" id="hobby3"><label for="hobby3">영화</label>
		</p>
		<p>
			<textarea rows="3" cols="30" name="comment" placeholder="가입인사를 입력해주세요"></textarea>
		</p>
		<p>
<!-- 			<input type="submit" value="가입하기"> -->
			<button type="button" id="joinbtn">가입하기</button>
			<input type="reset" value="다시쓰기">
		</p>
	</form>
	
	<script type="text/javascript">
		let btn = document.getElementById("joinbtn");
// 		console.log("btn: ", btn);
		btn.onclick = function(){
			member.action = "08_05_02_form04_process.jsp";
			member.method = "post";
			member.submit();
		}
	</script>
</body>
</html>