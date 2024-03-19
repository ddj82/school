<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Part를 이용한 파일 업로드</h2>
	<p>별도의 라이브러리가 필요없다.(서블릿 3.0버전 이상부터 가능)</p>
	<p>톰캣의 context.xml파일에 설정 필요</p>
	<small style="color: red">Multipart 처리를 위해서는 allowCasualMultipartParsing 옵션을 꼭 추가 해주어야 한다.</small><br>
	<small style="color: red">xml파일이나 java파일을 수정하는 경우는 꼭 톰캣 서버를 종료한 후에 수정해야한다.</small>
	<pre style="border: 1px solid #555"><br>
		<code>
			&lt;Context allowCasualMultipartParsing="true" path="/"&gt;
				&lt;Resources cachingAllowed="true" cacheMaxSize="100000" /&gt;
				...  그 외의 기존 내용들
				
			&lt;/Context&gt;
		</code>
	</pre>
	<form action="11_05_fileupload05_process.jsp" method="post" enctype="multipart/form-data" name="fileForm">
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