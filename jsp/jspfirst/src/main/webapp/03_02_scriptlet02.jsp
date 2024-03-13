<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border-collapse: collapse;
	width: 50%;
}
td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<%
	for (int i = 0; i <= 10; i++) {
		if (i % 2 == 0) {
			out.print(i + "<br>");
		}
	}
	%>
	<table>
		<%
		for (int i = 0; i <= 10; i++) {
		%>
		<tr id="tr<%= i %>">
			<td><%= i %></td>
			<td><%= i %></td>
			<td><%= i %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>