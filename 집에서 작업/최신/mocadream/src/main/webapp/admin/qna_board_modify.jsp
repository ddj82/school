<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.Mc_notice"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Mc_notice article = (Mc_notice) request.getAttribute("article");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" href="./css/input.css">
<meta charset="UTF-8">
<title>공지사항</title>
<style>
div.body-wrapper {
    width: 100%;
}
</style>
<script type="text/javascript">
	function modifyboard() {
		modifyform.submit();
	}
</script>
</head>
<body>
<%@ include file="/common/cookies.jsp" %>
<div class="body-wrapper">
	<section id="inputformArea">
		<form action="boardModifyPro.mc" method="post" name="modifyform">
			<input type="hidden" name="nt_no" value="<%=article.getNt_no()%>">
			<input type="hidden" name="page" value="${page }">
			<table>
				<tr>
	        		<td colspan="2" style="padding-left: 10px;">
						<h1 class="h1-title">공지 글수정</h1>
					</td>
				</tr>
				<tr>
					<td class="r_title r_title_top"><label for="nt_writer">글쓴이</label></th>
					<td class="td_padding"><input type="text" name="nt_writer"
						id="nt_writer" value="<%=article.getNt_writer()%>" readonly>
					</td>
				</tr>

				<tr>
					<td class="r_title"><label for="nt_title">제 목</label></th>
					<td class="td_padding"><input name="nt_title" type="text"
						id="nt_title" value="<%=article.getNt_title()%>"></td>
				</tr>
				<tr>
					<td class="r_title r_title_bottom"><label for="nt_content">내 용</label></th>
					<td class="td_padding"><textarea id="nt_content" name="nt_content" cols="40"rows="15"><%=article.getNt_content()%></textarea></td>
				</tr>
				<tr>
	                <td colspan="2" style="padding-top: 10px;">
	                    <input type="button" value="수정" onClick="javascript:modifyboard()">
	                    <input type="reset" value="다시쓰기" >
	                    <input type="button" value="돌아가기" onClick="javascript:history.go(-1)">
	                </td>
	            </tr>
			</table>
		</form>
	</section>
	<br><br>
	</div>
</body>
</html>