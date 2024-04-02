<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.Mc_users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<%
Mc_users article = (Mc_users) request.getAttribute("myPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<script type="text/javascript">
	function modifyboard() {
		modifyform.submit();
	}
	function deleteboard() {
		modifyform.submit();
	}
</script>
<style type="text/css">
	#registForm {
		width: 500px;
		height: 600px;
		border: 1px solid red;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 450px;
	}
	
	.td_left {
		width: 150px;
		background: orange;
	}
	
	.td_right {
		width: 300px;
		background: skyblue;
	}
	
	#commandCell {
		text-align: center;
	}
	p#log {
	    text-align: right;
	    margin-right: 20px;
	}
</style>
</head>
<body>
	<p id="log">
		<c:choose>
			<c:when test="${id ne null }">
				<% if (session.getAttribute("id").equals("admin")) { %>
					[관리자계정]&nbsp; <a href="logout">로그아웃</a>
				<% } else { %>
					${id }님, 환영합니다. <a href="logout">로그아웃</a>
					<a href="loginMypage.mc">내 정보수정</a>
				<% } %>
			</c:when>
			<c:otherwise>
				<a href="loginForm.html">로그인</a>
				<a href="joinForm.jsp">/ 회원가입</a>
			</c:otherwise>
		</c:choose>
	</p>
	<section id="registForm">
		<h2>내 정보수정</h2>
		<form action="myPageModifyProAction.mc" method="post" name="modifyform">
			<table>
				<tr>
					<td class="td_left"><label for="ID">아이디</label></td>
					<td class="td_right"><input type="text" name="ID" id="ID" value="<%=article.getId()%>" readonly></td>
				</tr>
				<!-- 	<tr> -->
				<!-- 		<td class="td_left"> -->
				<!-- 			<label for = "pw">현재 비밀번호</label> -->
				<!-- 		</td> -->
				<!-- 		<td class="td_right"> -->
				<%-- 			<input name="pw" type="password" id = "pw" value = "<%=article.getPw()%>"> --%>
				<!-- 		</td> -->
				<!-- 	</tr> -->
				<tr>
					<td class="td_left"><label for="pw">변경할 비밀번호</label></td>
					<td class="td_right"><input name="pw" type="password" id="pw" value="<%=article.getPw()%>"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="name">이름</label></td>
					<td class="td_right"><input name="name" type="text" id="name" value="<%=article.getName()%>"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="tel">휴대전화번호</label></td>
					<td class="td_right"><input name="tel" type="text" id="tel" value="<%=article.getTel()%>"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="email">이메일</label></td>
					<td class="td_right"><input name="email" type="email" id="email" value="<%=article.getEmail()%>"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="addr">주소</label></td>
					<td class="td_right"><input name="addr" type="text" id="addr" value="<%=article.getAddr()%>"></td>
				</tr>
			</table>
			<section id="commandCell">
				<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp; 
				<a href="javascript:history.go(-1)">[취소]</a>&nbsp;&nbsp; 
			</section>
			<table>
				<tr>
					<td class="td_left"><label for="delete">회원탈퇴</label></td>
					<td class="td_right"><input name="delete" type="submit" id="delete" value="회원탈퇴" formaction="./deleteForm.html"></td>
				</tr>
			</table>
		</form>
	</section>
	<br><br>
	<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>