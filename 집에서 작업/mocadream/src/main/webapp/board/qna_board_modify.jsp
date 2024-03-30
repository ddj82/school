<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.Mc_notice"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Mc_notice article = (Mc_notice) request.getAttribute("article");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript">
	function modifyboard() {
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
	
	p {
        text-align: right;
        margin-right: 20px;
    }
</style>
</head>
<body>
	<p>
		<c:choose>
			<c:when test="${id ne null }">
				[관리자계정]&nbsp; <a href="logout">로그아웃</a>
			</c:when>
			<c:otherwise>
				<a href="loginForm.html" id="log">로그인</a>
			</c:otherwise>
		</c:choose>
	</p>
	<section id="writeForm">
		<h2>공지글수정</h2>
		<form action="boardModifyPro.mc" method="post" name="modifyform">
			<input type="hidden" name="nt_no" value="<%=article.getNt_no()%>">
			<input type="hidden" name="page" value="${page }">
			<table>
				<tr>
					<td class="td_left"><label for="nt_writer">글쓴이</label></td>
					<td class="td_right"><input type="text" name="nt_writer"
						id="nt_writer" value="<%=article.getNt_writer()%>" readonly>
					</td>
				</tr>

				<tr>
					<td class="td_left"><label for="nt_title">제 목</label></td>
					<td class="td_right"><input name="nt_title" type="text"
						id="nt_title" value="<%=article.getNt_title()%>"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="nt_content">내 용</label></td>
					<td><textarea id="nt_content" name="nt_content" cols="40"
							rows="15"><%=article.getNt_content()%></textarea></td>
				</tr>
			</table>
			<section id="commandCell">
				<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp; <a
					href="javascript:history.go(-1)">[뒤로]</a>
			</section>
		</form>
	</section>
	<br><br>
	<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>