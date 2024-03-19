<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="11_03_fileupload03_process.jsp" method="post" name="fileForm" enctype="multipart/form-data">
		<fieldset>
			<legend>파일 업로드 폼</legend>
			<p>이 름 : <input type="text" name="name"></p>
			<p>제 목 : <input type="text" name="subject"></p>
			<p>파 일 : <input type="file" name="filename" multiple="multiple"></p>
			<p><input type="submit" value="파일 올리기"></p>
		</fieldset>
	</form>
</body>
</html>