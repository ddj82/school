<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
  }

  .container {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

  h1 {
    text-align: center;
    color: #333;
  }

  .id-list {
  	border : 1px solid #007bff;
  	overflow: auto;
  	height: 160px;
  }

  .id-box {
    padding: 0px;
    border-radius: 5px;
    
  }
	
  .id-box p {
    padding-left: 20px;
    font-size : 18px;
    
  }
  
  .btn1 {
  	margin: 20px 30px;
	width: 160px;
	padding: 8px;
	border: none;
	border-radius: 5px;
	background-color: #007bff;
	color: #fff;
	cursor: pointer;
		margin-top:15px;
}
	.btn {
	display:flex;
		justify-content : center;
	}

</style>
</head>
<body>
<div class="container">
 <%
        // 전달받은 아이디 리스트 가져오기
        List<String> idList = (List<String>) request.getAttribute("idList");
        int size = (idList != null) ? idList.size() : 0;

        if (size > 0) {
    %>
    <h1>아이디 찾기 결과</h1>
    
    <p>아이디 찾기가 완료되었습니다.</p>
    <p>가입된 아이디가 <span style="color:#007bff"><%= size %></span>개 있습니다.</p>
    <div class="id-list">
   
    
    <%
            for (int i = 0; i < size; i++) {
                String id = idList.get(i);
             // 아이디의 세 번째 글자까지 '*'로 변경
                String maskedId = id.substring(0, 2) + "***";
    %>
   
    <div class="id-box">
        <p><%=maskedId%></p>
    </div>
    
    <%
            }
    %>
    <%
        } else {
    %>
    <p>일치하는 회원 정보가 없습니다. <br> 이름과 이메일을 확인해주세요.</p>
    <%
        }
    %>
    </div>
 	
 	
 	<div class="btn">
 	<a href="./memberLogin.mc"><button id="returnBtn" class="btn1">로그인 페이지로<br>돌아가기</button></a>
 		<a href="./memberLogin.mc"><button id="returnBtn" class="btn1">비밀번호 변경<br> 페이지로 가기</button></a>
	</div>
</div>

</body>
</html>
