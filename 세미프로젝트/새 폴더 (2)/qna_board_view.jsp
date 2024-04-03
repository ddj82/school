<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.Mc_notice"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Mc_notice article = (Mc_notice)request.getAttribute("article");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
	<section id="articleForm">
		<h2>글 내용 상세보기</h2>
		<section id="basicInfoArea">
			제 목 :
			<%=article.getNt_title()%>
		</section>
		<section id="articleContentArea"><%=article.getNt_content() %></section>
	</section>
	<section id="commandList">
		<%if (session.getAttribute("id") == null) {%>
			<a href="boardList.mc?page=${page }"> [목록] </a>&nbsp;&nbsp;
			<%} else if(session.getAttribute("id").equals("admin")){%>
			
			<a href="boardModifyForm.mc?nt_no=<%=article.getNt_no() %>&page=${page }"> [수정] </a>
			<a href="boardDeleteForm.mc?nt_no=<%=article.getNt_no() %>&page=${page }"> [삭제] </a>
			<a href="boardList.mc?page=${page }"> [목록] </a>&nbsp;&nbsp;
		<%} else {%>
			<a href="boardList.mc?page=${page }"> [목록] </a>&nbsp;&nbsp;
		<%} %>
	</section>
	<br><br>
	<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>