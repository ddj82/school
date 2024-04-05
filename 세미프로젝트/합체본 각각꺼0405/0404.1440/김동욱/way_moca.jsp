<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style>

.way_moca {
    width: 100%;
    max-width: 800px; /* 이미지 최대 너비 제한 */
    margin: 80px auto;
    overflow: hidden; /* 이미지를 요소의 영역 안에 보이도록 설정 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
}

.way_moca img {
    display: block; /* 이미지를 블록 레벨 요소로 설정하여 여백을 자동으로 추가 */
    width: 100%;
    height: auto; /* 이미지 비율 유지 */
}

.main_div {
	width: 80%;
	margin: 0 auto;
	background-color: white;
	padding: 20px; /* 컨텐츠 영역에 여백 추가 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
}

footer {
    border-top: 1px solid #ccc;
    padding: 20px;
    text-align: center;
    background-color: #f9f9f9;
/*     position: fixed; */
    left: 0;
    bottom: 0;
    width: 100%;
}

footer small {
    display: block;
    margin-top: 10px;
}

/* 타이포그래피 개선을 위한 스타일 추가 */
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
}

h1, h2, h3 {
    margin-top: 0;
}

p {
    margin-bottom: 20px;
}

/* 반응형 디자인을 위한 미디어 쿼리 추가 */
@media (max-width: 768px) {
    .main_div {
        width: 90%; /* 작은 화면에서 컨텐츠 영역의 너비 조정 */
    }
}

/* 애니메이션 및 인터랙티브 요소 추가를 위한 스타일 */
.button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.button:hover {
    background-color: #0056b3;
}

</style>
</head>

<body>
<%@ include file="./navbar.jsp" %>

<div class="main_div">
    <h1>MOCA 스터디룸에 오신것을 환영합니다</h1>
    <p>최고의 스터디 공간대여를 제공하는 MocaDream입니다</p>
    <div class="way_moca">
    <img src="./roompic/way_how_to_use_moca.jpg" alt="MOCA Usage Instructions">
</div>
    <button class="button" onclick="showInstructions()">Show Instructions</button> <!-- 애니메이션 및 인터랙티브 요소 추가 -->
    <div id="instructions" style="display: none;">
        <h2>Instructions</h2>
        <ol>
            <li>First step...</li>
            <li>Second step...</li>
            <li>Third step...</li>
        </ol>
    </div>
</div>

<footer>
  <address>  
    연락처 : <a href="mailto:webmaster@somedomain.com">help@example.com</a>.<br>  
    모질라 재단, 1981 Landings Drive Building K Mountain View, CA 94043-0801 USA  
  </address>
  <small>Copyright &copy; <%= new java.util.Date().getYear() + 1900 %> Mozilla</small>
</footer>

</body>
</html>
