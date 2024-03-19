<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL fmt태그 사용</h3>
<!-- 	참고사이트: http://usefultoknow.tistory.com/entry/JSTLJSP-Standard-Tag-Library%EC%9D%B4%EB%9E%80 -->
	<span style="color: red">파라미터의 인코딩 설정하기</span><br>
	<fmt:requestEncoding value="utf-8"/>
<%-- 	<% request.setCharacterEncoding("utf-8"); %> --%>
	요청 파라미터 : 
	<%= request.getParameter("name") %>
	<form action="#" method="post">
		<p>이름: <input type="text" name="name" value="김마리"></p>
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>