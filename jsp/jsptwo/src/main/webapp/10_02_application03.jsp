<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String resourcePath = "/message/notice.txt"; %>
	자원의 실제 경로 : <br>
	<%=application.getRealPath(resourcePath) %><br>
<!-- 	getRealPath(매개변수) => 매개변수의 물리적 주소, 실제위치  -->
<!-- 	예: C:\jspwork\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jsptwo\message\notice.txt  -->
	<br> ----------- <br>
	<%=resourcePath %>의 내용
	<br> ----------- <br>
	<%
	char[] buff = new char[128];
	int len = -1;
	
	try {
		InputStreamReader br = new InputStreamReader(application.getResourceAsStream(resourcePath), "utf-8");
		while ((len = br.read(buff)) != -1) {
			out.print(new String(buff, 0, len));
		}
		out.print("<br>");
	} catch (IOException ex) {
		out.println("익셉션 발생: " + ex.getMessage());
	}
	%>
</body>
</html>