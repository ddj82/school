<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    p#log {
        text-align: right;
        margin-right: 20px;
    }

    button.admin {
        display: none;
    }
    p#demo2 {
        display: none;
    }

    div.ddiv {
        display: none;
    }
</style>
<script src="./jquery/jquery-3.6.4.js"></script>
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
	
	<c:choose>
		<c:when test="${id ne null }">
			<% if (session.getAttribute("id").equals("admin")) { %>
				<a href="boardList.mc">소식</a>&nbsp;
				<a href="">이용안내</a>&nbsp;
				<a href="">방정보</a>&nbsp;
				<a href="">오시는길</a>&nbsp;&nbsp; <br><br><br>
				
				<script>
				    $(function(){
				        $(".admin").show();
				    });
				</script>
				
			    <button type="button" id="adminUsers" class="admin">회원 관리</button>
			    <button type="button" id="adminRoom" class="admin">방 관리</button>
			    <button type="button" id="adminNotice" class="admin">소식 관리</button>
				<br>
				<p id="demo"></p>
				<br>
			    <div id="div0" class="ddiv"><a href="memberListAction.mc">회원리스트 조회</a><br></div>
			    <div id="div1" class="ddiv"><a href="nowcheck.mc">실시간예약현황 리스트</a><br></div>
			    <div id="div2" class="ddiv"><a href="mocaList.mc">방 관리</a><br></div>
			    <div id="div3" class="ddiv"><a href="boardList.mc">공지 관리</a><br></div>				
				<br><br>
			    <p id="demo2"><button type="button" id="main" class="admin">메인으로</button></p>		
			    		
			<% } else { %>
				<a href="boardList.mc">소식</a>&nbsp;
				<a href="">이용안내</a>&nbsp;
				<a href="">방정보</a>&nbsp;
				<a href="roomListAction.mc">예약하기</a>&nbsp;
				<a href="myOrderList.mc">예약 내역 확인</a>&nbsp;
				<a href="">오시는길</a>&nbsp;&nbsp; <br><br><br>
			<% } %>
		</c:when>
		<c:otherwise>
			<a href="boardList.mc">소식</a>&nbsp;
			<a href="">이용안내</a>&nbsp;
			<a href="">방정보</a>&nbsp;
			<a href="">오시는길</a> <br><br><br>
		</c:otherwise>
	</c:choose>
<script>
	document.getElementById("adminUsers").addEventListener("click", function(e){
	    document.getElementById("demo").innerHTML = document.getElementById("div0").innerHTML;
	    if ($("#adminUsers").is(":visible")) {
	        $("#adminUsers").hide();
	    }
	    if ($("#adminRoom").is(":hidden")) {
	        $("#adminRoom").show();
	    }
	    if ($("#adminNotice").is(":hidden")) {
	        $("#adminNotice").show();
	    }
	
	    if ($("#demo2").is(":hidden")) {
	        $("#demo2").show();
	    }
	    if ($("#main").is(":hidden")) {
	        $("#main").show();
	    }
	});
	
	document.getElementById("adminRoom").addEventListener("click", function(e){
	    document.getElementById("demo").innerHTML = document.getElementById("div1").innerHTML;
	    document.getElementById("demo").innerHTML += document.getElementById("div2").innerHTML;
	
	    if ($("#adminRoom").is(":visible")) {
	        $("#adminRoom").hide();
	    }
	    if ($("#adminUsers").is(":hidden")) {
	        $("#adminUsers").show();
	    }
	    if ($("#adminNotice").is(":hidden")) {
	        $("#adminNotice").show();
	    }
	
	    if ($("#demo2").is(":hidden")) {
	        $("#demo2").show();
	    }
	    if ($("#main").is(":hidden")) {
	        $("#main").show();
	    }
	});
	
	document.getElementById("adminNotice").addEventListener("click", function(e){
	    document.getElementById("demo").innerHTML = document.getElementById("div3").innerHTML;
	    if ($("#adminNotice").is(":visible")) {
	        $("#adminNotice").hide();
	    }
	    if ($("#adminUsers").is(":hidden")) {
	        $("#adminUsers").show();
	    }
	    if ($("#adminRoom").is(":hidden")) {
	        $("#adminRoom").show();
	    }
	
	    if ($("#demo2").is(":hidden")) {
	        $("#demo2").show();
	    }
	    if ($("#main").is(":hidden")) {
	        $("#main").show();
	    }
	});
	
	document.getElementById("main").addEventListener("click", function(e){
	    $(".admin").filter(function(i, o){
	        let btn = o;
	        if (o.id != "main") {
	            if ($(btn).is(":hidden")) {
	                $(btn).show();
	            }
	        }
	    });
	    if (!(document.getElementById("demo").innerHTML == "")) {
	        document.getElementById("demo").innerHTML = "";
	    }
	    $("#main").hide();
	});
	
	function checkSession() {
		if (sessionStorage.getItem("id") == null) {
			window.location = "main.jsp";
		}
	}
	setInterval(checkSession(), 100);
</script>
</body>
</html>