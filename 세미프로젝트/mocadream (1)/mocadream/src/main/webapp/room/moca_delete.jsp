<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	int r_no=(Integer)request.getAttribute("r_no");
    String nowPage = (String)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>MVC 게시판</title>
<style>

	#passForm{
		width:400px;
		margin:auto;
		border : 1px solid orange;
	}
	
</style>
</head>
<body>
<section id = "passForm">
<form name="deleteForm" action="mocaDeletePro.mc?r_no=<%=r_no %>" method="post">
	<input type = "hidden" name = "page" value = "<%=nowPage %>">
	<table>
	<tr>
		<td>
			<label>삭제하시겠습니까? </label>
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value = "삭제">&nbsp;&nbsp;
			<input type = "button" value = "Yes" onClick ="javascript:history.go(-1)">
		</td>
	</tr>
	</table>
</form>
</section>
</body>
</html>