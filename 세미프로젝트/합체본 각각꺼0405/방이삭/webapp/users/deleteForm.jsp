<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#deleteFormArea {
	margin: auto; 
	width: 400px; 
	height: 200px; 
	text-align: center;
}

fieldset {
	text-align: center; 
	border: none;
}

#selectButton {
	margin-top: 10px;
}

table {
	width: 300px; 
	margin: auto;
}

.td_left {
	width: 180px
}

.td_right {
	width: 200px
}
</style>
</head>
<body>
	<%@ include file="../navbar.jsp"%>
	<br>
	<br>
	<section id="deleteFormArea">
		<h1>회원탈퇴</h1>
		<form action="memberDeleteAction.mc" method="POST">
			<fieldset>
				<table>
					<tr>
						<td><label for="id">회원탈퇴를 하시겠습니까 ?</label></td>
					</tr>
				</table>
				<input type="submit" value="네" id="selectButton"> 
				<input type="submit" value="아니요" id="selectButton" formaction="javascript:history.go(-1)">
			</fieldset>
		</form>
	</section>
	<%@ include file="../footer.jsp"%>
</body>
</html>