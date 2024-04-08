<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.Mc_rooms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% Mc_rooms room = (Mc_rooms)request.getAttribute("room"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<link rel="stylesheet" href="./css/input.css">
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style>
div.body-wrapper {
    width: 100%;
}
</style>
</head>
<body>
<%@ include file="/common/cookies.jsp" %>
<div class="body-wrapper">
	<section id="inputformArea">
	    <form name="insertRoom" action="mocaModifyPro.mc" method="post" enctype="multipart/form-data">
	        <input type = "hidden" name = "page" value = "${page }">
	        <table>
	        	<tr>
	        		<td colspan="2" style="padding-left: 10px;">
						<h1 class="h1-title">방 수정</h1>
					</td>
				</tr>	
	            <tr>
	                <td class="r_title r_title_top"><label for="R_NO">룸 번호 : </label></td>
	                <td class="td_padding"><input type="text" name="R_NO" id="R_NO" value="<%= room.getR_no() %>" readonly/></td>
	            </tr>
	            <tr>
	                <td class="r_title"><label for="R_NAME">룸 이름 : </label></td>
	                <td class="td_padding"><input type="text" name="R_NAME" id="R_NAME" value="<%= room.getR_name() %>"/></td>
	            </tr>
	            <tr>
	                <td class="r_title"><label for="R_MAX">수용인원 : </label></td>
	                <td class="td_padding"><input type="text" name="R_MAX" id="R_MAX" value="<%= room.getR_max() %>"/></td>
	            </tr>
	            <tr>
	                <td class="r_title"><label for="R_DESC">룸 설명 : </label></td>
	                <td class="td_padding"><textarea name="R_DESC" id="R_DESC" value="<%= room.getR_desc() %>"></textarea></td>
	            </tr>
	            <tr>
	                <td class="r_title r_title_bottom"><label for="R_FILE">룸 사진 : </label></td>
	                <td class="td_padding"><input type="file" name="R_FILE" id = "R_FILE" value="<%= room.getR_file() %>"/></td>
	            </tr>
	            <tr>
	                <td colspan="2" style="padding-top: 10px;">
	                    <input type="submit" value="수정">
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