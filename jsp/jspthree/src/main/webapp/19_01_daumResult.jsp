<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="addrVO" class="com.dto.AddrVO"/>
	<jsp:setProperty property="*" name="addrVO"/>
	<!-- 해당 addrVO객체의 멤버필드명과 input요소네임값이 같으면 *로 모든 멤버필드의 setter메소드를 파라미터를 매개변수로 호출함 -->
	<!-- jsp:setProperty는 빈문자열값을 받게되면 값이 설정되지 않음. -->
	
	우편번호: <jsp:getProperty property="addrNum" name="addrVO"/><br>
	주소: <jsp:getProperty property="addr1" name="addrVO"/>
		 <jsp:getProperty property="addr2" name="addrVO"/><br>
	참고: <jsp:getProperty property="cmt" name="addrVO"/><br>
</body>
</html>