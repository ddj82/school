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
	String user_id = request.getParameter("id");
	String user_pw = request.getParameter("passwd");
	
	if (!(user_id == null || user_pw == null)) {
		if (user_id.equals("admin") && user_pw.equals("1234")) {
			// 쿠키 객체 생성
			Cookie cookie_id = new Cookie("userID", user_id);
			Cookie cookie_pw = new Cookie("userPW", user_pw);
			
			// 응답 객체에 쿠키 추가(클라이언트 브라우저에 저장)
			response.addCookie(cookie_id);
			response.addCookie(cookie_pw);
			out.print("쿠키 생성에 성공했습니다.<br>");
			out.print(user_id + "님 환영합니다.");
		} else {
			out.print("쿠키 생성에 실패했습니다.");
		}
	}
	%>
</body>
</html>