<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// HTTP 1.0.
response.setHeader("Pragma", "no-cache"); 
/* 캐시를 담아놓는 속성, 캐시지움 */

// Proxy : Client와 Server 사이에 위치하여 요청을 중계하는 역할을 하는 서버
response.setHeader("Expires", "0"); 
/* 쌓이는 데이터 유효기간 지정 속성, 만료처리 */

// HTTP 1.1.
response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate"); 
/* 전반적인 캐시의 내용을 관리하는 속성, 저장안함 캐시지움 유효성다시체크 */

String id = (String) session.getAttribute("id");

if (id != null) {
	if (request.getRequestURI().contains("/member") && !id.equals("admin")) {
		out.println("<script>");
		out.print("location.href='" + request.getContextPath() + "/loginForm.jsp';");
		out.println("</script>");
	}
	
} else {
	/* 로그인하지 않은 상태로 로그인이 필요한 페이지를 열었을때 막아주기 위함 */
	out.println("<script>");
	out.print("location.href='" + request.getContextPath() + "/loginForm.jsp';");
	out.println("</script>");
}
%>
</body>
</html>