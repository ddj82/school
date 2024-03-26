<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="vo.BoardBean"%>
<%
	BoardBean article = (BoardBean)request.getAttribute("article");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style>
#articleForm {
	width: 500px;
	height: 500px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

#basicInfoArea {
	position: relative;
	height: 40px;
	text-align: center;
}

#articleContentArea {
	background: orange;
	margin-top: 20px;
	height: 350px;
	text-align: center;
	overflow: auto;
}

#commandList {
	margin: auto;
	width: 500px;
	text-align: center;
}

#imgDiv {
	display: none;
	position: absolute;
	top:0;
	left: 20px;
	width: 90%;
	height: 250px;
	border: 1px solid #ccc;
	border-radius: 8px;
	overflow : hidden;
	padding: 0px;
	background-size: cover;
	background-repeat : no-repeat;
	background-image : url(/servletproject/boardUpload/<%=article.getBOARD_FILE()%>);
}
</style>
<script>
function showDiv(){
	document.getElementById("imgDiv").style.display = "block";
}

function hideDive(){
	document.getElementById("imgDiv").style.display = "none";
}
</script>
</head>

<body>
	<!-- 게시판 수정 -->
	<section id="articleForm">
		<h2>글 내용 상세보기</h2>
		<section id="basicInfoArea">
			제 목 :
			<%=article.getBOARD_SUBJECT()%>
			첨부파일 :
			<%if(!(article.getBOARD_FILE()==null)){ %>
				<a href="filedown.bo?fname=<%=article.getBOARD_FILE()%>"><%=article.getBOARD_FILE() %></a>
			
			<br>
			<a href="javascript:showDiv();">이미지 보기</a>
			<div id="imgDiv" onclick="hideDive()"></div>
			<%} %>
		</section>
		<section id="articleContentArea"><%=article.getBOARD_CONTENT() %></section>
	</section>
	<section id="commandList">
		<a href="boardReplyForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=${page }"> [답변] </a>
		<a href="boardModifyForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=${page }"> [수정] </a>
		<a href="boardDeleteForm.bo?board_num=<%=article.getBOARD_NUM() %>&page=${page }"> [삭제] </a>
		<a href="boardList.bo?page=${page }"> [목록] </a>&nbsp;&nbsp;
	</section>
</body>
</html>