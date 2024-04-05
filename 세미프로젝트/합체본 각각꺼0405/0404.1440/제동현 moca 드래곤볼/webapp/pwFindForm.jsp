<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
  margin: 0;
  padding: 0;
}

h1,h3 {
  text-align: center;
  margin-top: 20px;
}

#pwfindformArea {
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
  margin: 15px 0 ;
}

div:last-child {
display:flex;
justify-content:center;}

label {
  font-weight: bold;
    margin: 20px 0;
}

input[type="text"] {
  width: calc(100% - 20px);
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

button#findBtn {
  width: 30%;
  padding: 10px;
  background-color: rgb(205, 133, 63);;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button#findBtn:hover {
  background-color: rgb(139, 69, 19);
}
</style>
</head>
<body>

<section id="pwfindformArea">
<h1>비밀번호 찾기</h1>
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



<div>
<button id="findBtn">비밀번호 찾기</button>
</div>
</form>
</section>
</body>
</html>