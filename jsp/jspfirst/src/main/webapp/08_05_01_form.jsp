<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<form action="08_05_01_formParameter.jsp" method="post"> -->
<!-- 	<form action="08_03_requestInfo.jsp" method="post"> -->
	<form action="08_03_requestInfo.jsp?id=admin" method="post">
		아이디: <input type="text" name="id" size="30"><br>
		이름: <input type="text" name="name" size="30"><br>
		주소: <input type="text" name="address" size="30"><br>
		좋아하는 동물:
		<input type="checkbox" name="pet" value="dog">강아지
		<input type="checkbox" name="pet" value="cat">고양이
		<input type="checkbox" name="pet" value="pig">돼지
		<br>
		<input type="submit" value="전송">
	</form>
</body>
</html>