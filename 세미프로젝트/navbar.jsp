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



.navbar__logo {
  background-image: url("./roompic/Logo 836x690.png"); 
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
</style>
</head>
<body>





	<nav class="navbar">
	
	<ul class="navbar__sign">
      
	      <c:choose>
    <c:when test="${id ne null }">
        <% if (session.getAttribute("id").equals("admin")) { %>
            <li>
                [관리자계정]&nbsp;
                <a href="adminPage.jsp">관리자 페이지</a> <!-- 새로 추가한 부분 -->
                <a href="logout">로그아웃</a>
            </li>
        <% } else { %>
            <li>
                ${id }님, 환영합니다.
                <a href="logout">로그아웃</a>
                <a href="loginMypage.mc">내 정보수정</a>
            </li>
        <% } %>
    </c:when>
    <c:otherwise>
        <li><a href="loginForm.html">로그인</a><a href="#">회원가입</a></li>
        
    </c:otherwise>
</c:choose>

      </ul>

	<div class="navbar__title">
	<div class="navbar__logo">
        <a href="#"></a>
      </div>
      <p>MOCA</p>
	</div>
				<ul class="navbar__menu">
        			<li>
        				<div>
        					<a href="mocaDetail.mc">방정보</a>
        				</div>
       				</li>
        			<li><a href="#">공지사항</a></li>
        			<li><a href="#">예약하기</a></li>
        			<li><a href="./map.jsp">오시는길</a></li>
        			<li><a href="./way_moca.jsp">이용방법</a></li>
      			</ul>
      			
      			
<script>
    $(document).ready(function(){
        $(".menu").click(function(){
            $(this).find("ul").toggleClass("hide");
        });
    });
</script>
				
</nav>
</body>
</html>