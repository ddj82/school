<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page buffer="1kb" %>     --%>
<%-- <%@ page buffer="1kb" autoFlush="true" %>     --%>
<%-- <%@ page buffer="1kb" autoFlush="false" %>     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>out객체와 buffer속성</h2>
	<p>buffer속성을 사용하여 buffer를 지정하면 out객체는 기본적으로 설정한 값의 크기의 버퍼를 내부적으로 사용한다.</p>
	<p>autoFlush속성은 버퍼가 가득차면 비울지(브라우저로 출력 결과를 전송함)의 여부를 지정하는 속성인데, 기본값은 true이다.</p>
	<% for (int i = 0; i < 1000; i++) { %>
	1234
	<%
// 	out.flush(); // 버퍼를 내보내라(비워라), 출력해라
// 	out.clear(); // 버퍼를 삭제해라, 지울게 없으면 에러(오류: 이미 배출되어 버린 버퍼를 폐기하려는 시도)
// 	out.clearBuffer(); // 버퍼에 삭제할게 있으면 삭제하고, 없으면 그냥 넘어가라
	}%>
</body>
</html>