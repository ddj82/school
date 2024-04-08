<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#deleteFormArea {
	margin: auto; 
	width: 400px; 
	height: 200px; 

	border-radius: 10px; 
	text-align: center;
}

fieldset {
	text-align: center; border: none;
}

#selectButton {
	margin-top: 10px;
}

table {
	width: 300px; margin: auto;
}

</style>
</head>
<body>
<div class="body-wrapper">
	<section id="deleteFormArea">
		<br><br>
		<form action="logout" method="get">
			<fieldset>
				<table>
					<tr>
						<td><label for="id">회원탈퇴가 되었습니다.</label></td>
					</tr>
				</table>
				<input type="submit" value="메인으로 돌아가기" id="selectButton">
				<!-- 메인으로 돌아가기 -->
			</fieldset>
		</form>
	</section>
</div>
</body>
</html>