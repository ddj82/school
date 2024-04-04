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
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript">
	function modifyboard() {
		modifyform.submit();
	}
</script>
<style type="text/css">
	#registForm {
	margin: 20px auto;
    width: 50%;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 100%;
	}
	
	.th_left {
		width: 30%;
        background: rgb(242 231 220);
        padding: 10px;
        color: black;
	}
	
	.td_right {
	    width: 70%;
        background: rgb(255 250 250);
        padding: 10px;
	}
	
	  textarea, input[type="text"] {
        width: calc(100% - 20px); 
        padding: 10px;
        border-radius: 5px;
        border: 3px solid #ccc;
        margin-bottom: 10px;
    }

    textarea {
        height: 150px;
    }
	
	#commandCell {
		text-align: center;
	}
	
form input[type="submit"],
form input[type="button"],
form input[type="reset"] {
   color: black;
   background-color: rgb(232, 221, 210);
   border: none;
   padding: 10px 20px;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px 2px;
   cursor: pointer;
   border-radius: 30px;
}
	
	p {
        text-align: right;
        margin-right: 20px;
    }
</style>
</head>
<body>
<div class="body-wrapper">
		<h2>공지글수정</h2>
	<section id="registForm">
		<form action="boardModifyPro.mc" method="post" name="modifyform">
			<input type="hidden" name="nt_no" value="<%=article.getNt_no()%>">
			<input type="hidden" name="page" value="${page }">
			<table>
				<tr>
					<th class="th_left" style= "border-radius: 20px 0 0 0;"><label for="nt_writer">글쓴이</label></th>
					<td class="td_right"><input type="text" name="nt_writer"
						id="nt_writer" value="<%=article.getNt_writer()%>" readonly>
					</td>
				</tr>

				<tr>
					<th class="th_left"><label for="nt_title">제 목</label></th>
					<td class="td_right"><input name="nt_title" type="text"
						id="nt_title" value="<%=article.getNt_title()%>"></td>
				</tr>
				<tr>
					<th class="th_left" style= "border-radius: 0 0 0 20px;"><label for="nt_content">내 용</label></th>
					<td><textarea id="nt_content" name="nt_content" cols="40"
							rows="15"><%=article.getNt_content()%></textarea></td>
				</tr>
			</table>
			<section id="commandCell">
				<a href="javascript:modifyboard()">수정</a>&nbsp;&nbsp; <a
					href="javascript:history.go(-1)">뒤로</a>
			</section>
		</form>
	</section>
	<br><br>
	</div>
</body>
</html>