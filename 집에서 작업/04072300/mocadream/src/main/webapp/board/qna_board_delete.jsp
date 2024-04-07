<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
int nt_no = (Integer) request.getAttribute("nt_no");
String nowPage = (String) request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<meta charset="UTF-8">
<title>공지 삭제확인</title>
<style>
   body {
    font-family: Arial, sans-serif;
    background-color: rgb(242 231 220);
    margin: 0;
    padding: 0;
}

p {
    text-align: right;
    margin-right: 20px;
}

textarea {
		resize: none;
		height: 300px;
}


#insertformArea {
    margin: 20px auto;
    width: 50%;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: left;
    padding-left: 20%;
    margin-bottom: 20px;
}

form table {
    margin: auto;
    width: 80%;
}

form table tr td {
    padding: 10px 0;
}

form table tr td label {
    display: inline-block;
    width: 150px;
    font-weight: bold;
}

form table tr td input[type="text"],
form table tr td input[type="file"],
form table tr td textarea {
    width: 80%;
    padding: 8px;
    border: 1px solid green;
    border-radius: 5px;
}

form table tr td input[type="submit"],
form table tr td input[type="button"] {
    width: 100px;
    padding: 10px;
    background-color: pink;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

form table tr td input[type="submit"]:hover,
form table tr td input[type="button"]:hover {
    background-color: orange;
}

section {
    text-align: center;
    margin-top: 20px;
}

a {
    text-decoration: none;
    color: brown;
}

a:hover {
    text-decoration: underline;
}
.main_div {
	width: 80%;
	margin: 0 auto;
}
</style>
</head>
<body>
<div class="body-wrapper">
	<section id="passForm">
		<form name="deleteForm" action="boardDeletePro.mc?nt_no=<%=nt_no%>" method="post">
			<input type="hidden" name="page" value="<%=nowPage%>">
			<table>
				<tr>
					<td><label>삭제하시겠습니까?<br><br></label></td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="삭제">&nbsp;&nbsp;
						<input type="button" value="돌아가기" onClick="javascript:history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
	</section>
</div>
</body>
</html>