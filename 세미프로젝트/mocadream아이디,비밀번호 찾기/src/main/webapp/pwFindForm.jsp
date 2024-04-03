<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<h3>비밀번호 찾기</h3>
<section id="pwfindformArea">
<form name="pwfindform" action="./memberPwFindAction.mc" method="post" >

<div>
<label for="name">아이디</label>
<input type="text" name="id">
</div>


<div>
<label for="name">이름</label>
<input type="text" name="name">
</div>

<div>
<label for="email">이메일주소</label>
<input type="text" name="email">
</div>




<button id="findBtn">비밀번호 찾기</button>
</form>
</section>
</body>
</html>