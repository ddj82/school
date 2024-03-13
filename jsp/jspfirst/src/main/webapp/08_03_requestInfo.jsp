<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); %>
<!-- 인코딩 설정하는 방법이고, -->
<!-- post방식으로 전송할때 요청을 받는곳에서만 인코딩 설정이 필요하다. -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>현재페이지 url : http://localhost:8090/jspfirst/08_03_requestInfo.jsp</h2>
	<h3>프로토콜 : http</h3>
	<h3>ip주소(= 서버이름) : 127.0.0.1(localhost)</h3>
	<h3>포트번호 : 8090</h3>
	<h3>경로(context(root)/path) : /jspfirst/08_03_requestInfo.jsp</h3>
	<dl>
		<dt><strong style="font-weight: bolder">localhost 정보</strong></dt>
		<dd>IPv4 주소 형식 값으로 표시: 127.0.0.1</dd>
	</dl>
	
	<ul>
		<li>요청정보 인코딩 = <%= request.getCharacterEncoding() %> <br>
			<small style="color: red">클라이언트가 전송한 요청 정보의 문자셋을 구함. String으로 반환</small>
		</li>
		<li>
			파라미터 정보1-1 = <%= request.getParameter("id") %><br>
			파라미터 정보1-2 = <%= request.getParameter("ID") %><br> <!-- 대소문자 가림 -->
			파라미터 정보2 = <%= java.net.URLDecoder.decode(request.getParameter("name")) %><br>
			파라미터 정보3 = <%= request.getParameter("name") %><br>
		</li>
	</ul>
</body>
</html>