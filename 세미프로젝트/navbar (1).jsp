<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
	/* background-color: rgb(242 231 220); */
 margin: 0;
    padding: 0;
}
div.ddiv {
        display: none;
}
		
/*  nav-var style  */		
.navbar__title{
display: flex; 
justify-content:center;
padding:20px 0;
  background-color: rgb(242 231 220);  
}

.navbar__title > p{
display: inline-block;
  margin:auto 20px;
  font-size:40px;
  font-weight:bold;
}



.navbar__img {
  background-image: url("./roompic/logo1.png"); 
  color: black;
  padding-left: 0;
    width: 100px;
  	height: 80px;
  background-size: 100% 100%;
  display: inline-block;
  
}
a {
  text-decoration: none;
  color: black;
}


a:hover {
		color:rgb(205,133,63)
}

/* navbar__menu 메뉴창 */
.navbar__menu {
  list-style: none;
  display: flex;
  margin: 0;
  justify-content:center;
/*   background-color:white;  */
  border-top:1px solid #e1e1e1;
  border-bottom:1px solid #e1e1e1;
  height:80px;
  align-items:center;	
}

/* menu list */
.navbar__menu li {
  padding: 10px 40px;
  font-size: 18px;
  border-right:1px solid #e1e1e1;
}
.navbar__menu li > p {
height:40%

}

.navbar__menu li a{
	color:#333;
}
.navbar__menu li a:hover{
		color:rgb(205,133,63)
}



/* navbar__sign 로그인 */
.navbar__sign {
justify-content:end;
  list-style: none;
  display: flex;
  margin: 0; 
background-color:rgb(245,238,225)

}

/* sign list */
.navbar__sign li {
/* 	border-radius:5px; */
/*   background-color:black; */
  padding: 8px 18px;
  text-align:center;
}
.navbar__sign li a{
	color:black;
/*   color:white; */
  padding:10px;
}




  .menu {cursor: pointer;}
    .menu .hide {display: none;}
    
 .ad_li {
 	font-size: 12px;
 	padding: 8px 10px;
 	
 }  
 .navbar__title:hover{
 	cursor: pointer;
 }
 
</style>
</head>
<body>
	<nav class="navbar">

	<ul class="navbar__sign">
      	<li><c:choose>
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
			</c:otherwise>
		</c:choose></li>
      	<li><a href="joinForm.jsp">회원가입</a></li>
      </ul>
      
      
	<div class="navbar__title" onclick="location.href='./main.jsp';">
	
	
	<div class="navbar__img" onclick="location.href='./main.jsp';"></div>

      <p>MOCA</p>
      
     </div>




	<c:choose>
		<c:when test="${id ne null }">
			<% if (session.getAttribute("id").equals("admin")) { %>
				<ul class="navbar__menu">
        			<li><a href="boardList.mc">공지사항</a></li>
        			<li><a href="./way_moca.jsp">이용방법</a></li>
        			<li><a href="mocaDetail.mc">방정보</a></li>
<!--         			<li><a href="myOrderList.mc">예약 내역 확인</a></li> -->
<!--         			<li><a href="roomListAction.mc">예약하기</a></li> -->
        			<li><a href="./map.jsp">오시는길</a></li>
<!--         			<li class="admin"><a href="memberListAction.mc">회원리스트 조회</a></li> -->
<!--         			<li class="admin"><a href="nowcheck.mc">실시간예약현황 리스트</a></li> -->
<!--         			<li class="admin"><a href="mocaList.mc">방 관리</a></li> -->
<!--         			<li class="admin"><a href="boardList.mc">공지 관리</a></li> -->
      			</ul>
				
				<ul  class="navbar__menu">
					<li class="admin"><a href="memberListAction.mc">회원리스트 조회</a></li>
        			<li class="admin"><a href="nowcheck.mc">실시간예약현황 리스트</a></li>
        			<li class="admin"><a href="mocaList.mc">방 관리</a></li>
        			<li class="admin"><a href="boardList.mc">공지 관리</a></li>
      			</ul>
      			
      			
<!--     <ul class="navbar__menu"> -->
<!--         <li class="admin menu">회원 관리 -->
<!--             <ul class="hide"> -->
<!--                 <li class="ad_li" style="margin-left: -30px; padding: 0;"><a href="memberListAction.mc">회원리스트 조회</a></li> -->
<!--             </ul> -->
<!--         </li> -->
<!--         <li class="admin menu">방 관리 -->
<!--             <ul class="hide"> -->
<!--                 <li class="ad_li"><a href="nowcheck.mc">실시간예약현황 리스트</a></li> -->
<!--                 <li class="ad_li"><a href="mocaList.mc">방 관리</a></li> -->
<!--             </ul> -->
<!--         </li> -->
<!--         <li class="admin menu">소식 관리 -->
<!--             <ul class="hide"> -->
<!--                 <li class="ad_li"><a href="boardList.mc">공지 관리</a></li> -->
<!--             </ul> -->
<!--         </li> -->
<!--     </ul> -->

				<script>
    $(document).ready(function(){
        $(".menu").click(function(){
            $(this).find("ul").toggleClass("hide");
        });
    });
</script>
				
				<script>
				    $(function(){
				        $(".admin").show();
				    });
				</script>

				
<!-- 			    <button type="button" id="adminUsers" class="admin">회원 관리</button> -->
<!-- 			    <button type="button" id="adminRoom" class="admin">방 관리</button> -->
<!-- 			    <button type="button" id="adminNotice" class="admin">소식 관리</button> -->
<!-- 				<br> -->
<!-- 				<p id="demo"></p> -->
<!-- 				<br> -->
<!-- 			    <div id="div0" class="ddiv"><a href="memberListAction.mc">회원리스트 조회</a><br></div> -->
<!-- 			    <div id="div1" class="ddiv"><a href="nowcheck.mc">실시간예약현황 리스트</a><br></div> -->
<!-- 			    <div id="div2" class="ddiv"><a href="mocaList.mc">방 관리</a><br></div> -->
<!-- 			    <div id="div3" class="ddiv"><a href="boardList.mc">공지 관리</a><br></div>				 -->
<!-- 				<br><br> -->
<!-- 			    <p id="demo2"><button type="button" id="main" class="admin">메인으로</button></p>		 -->
			    		
			<% } else { %>
				<ul class="navbar__menu">
        			<li><a href="boardList.mc">소식</a></li>
        			<li><a href="./way_moca.jsp">이용방법</a></li>
        			<li><a href="mocaDetail.mc">방정보</a></li>
        			<li><a href="roomListAction.mc">예약하기</a></li>
        			<li><a href="myOrderList.mc">예약 내역 확인</a></li>
        			<li><a href="./map.jsp">오시는길</a></li>
      			</ul>
			<% } %>
		</c:when>
		<c:otherwise>
				<ul class="navbar__menu">
        			<li><a href="boardList.mc">소식</a></li>
        			<li><a href="./way_moca.jsp">이용방법</a></li>
        			<li><a href="mocaDetail.mc">방정보</a></li>
        			<li><a href="roomListAction.mc">예약하기</a></li>
<!--         			<li><a href="myOrderList.mc">예약 내역 확인</a></li> -->
        			<li><a href="./map.jsp">오시는길</a></li>
      			</ul>
		</c:otherwise>
	</c:choose>
</nav>
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
</script>
</body>
</html>