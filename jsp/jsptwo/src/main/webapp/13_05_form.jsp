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
	<form action="13_05_form_process.jsp" name="member" method="post">
		<p>
			아이디 : <input type="text" name="id">
			<input type="button" value="아이디 중복검사">
		</p>
		<p>
			비밀번호 : <input type="password" name="passwd">
		</p>
		<p>
			이름 : <input type="text" name="name">
		</p>
		<p>
			연락처 : 
			<input type="text" name="phone1" value="010" readonly>
			-
			<input type="text" name="phone2" maxlength="4" size="4">
			-
			<input type="text" name="phone3" maxlength="4" size="4">
		</p>
		<p>
			성별 : 
			<label><input type="radio" name="gender" value="남성" id="male" checked>남성</label>
			<label><input type="radio" name="gender" value="여성" id="female">여성</label>
		</p>
		<p>
			취미 : 
			<label><input type="checkbox" value="독서" name="hobby" id="hobby1" checked>독서</label>
			<label><input type="checkbox" value="운동" name="hobby" id="hobby2">운동</label>
			<label><input type="checkbox" value="영화" name="hobby" id="hobby3">영화</label>
		</p>
		<p>
			<textarea rows="3" cols="30" name="comment" placeholder="가입인사를 입력해주세요"></textarea>
		</p>
		<p>
			<input type="submit" value="가입하기">
			<input type="reset" value="다시쓰기">
		</p>
	</form>
</body>
</html>