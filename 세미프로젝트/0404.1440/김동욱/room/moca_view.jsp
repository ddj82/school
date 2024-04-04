<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.Mc_rooms"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	ArrayList<Mc_rooms> roomList=(ArrayList<Mc_rooms>)request.getAttribute("roomList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>
<%
	Mc_rooms room = (Mc_rooms)request.getAttribute("room");
%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모임공간 리스트</title>
	<!-- js 필요하면 가져올것 -->   

    
   	<style type="text/css">
   	
   	body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.facility {
    margin-bottom: 30px;
}

.facility h2 {
    font-size: 24px;
    color: #333;
    margin-bottom: 10px;
}

.facility-details {
    background-color: rgb(242 231 220);
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.image-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center; 
    margin: 0 auto; 
}

.image-box {
    width: calc(27%);
    margin: 20px;
    position: relative;
}

.image-text {
    position: absolute;
    background-color: rgba(0, 0, 0, 0.7); /* 투명한 배경색 */
    padding: 15px;
    color: white;
    bottom: 0;
    left: 0;
/*     width: 100%; */
    border-radius: 8px; /* 텍스트 박스의 왼쪽 하단 모서리를 둥글게 */
    margin: 15px;
}

.image {
    width: 100%;
    height: 300px; 
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
	background-size: cover;
}

   	
   	
   	
   	.room {
   	width: 1000px;
   	margin: 0 auto;
    display: flex; /* 안에 내용들 일자정령 */
    margin-bottom: 20px;
    padding: 10px; 
    background-color: rgb(242 231 220);
    border-radius: 8px;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1); /* 있어보이게 그림자 */
}

/* 이미지 스타일 */
.room-image {
    flex: 0 0 300px; 
    height: 300px; 
    background-size: cover;
    background-position: center;
    margin-right: 20px;
}

.content {
	width: 300px;
	margin-left: 20%;
}

/* 텍스트 스타일링 */
.room-info {
    flex: 1;
}

.room h2 {
    font-size: 25px;
    color: black;
    margin: 0;
    padding-top: 10px;
}
.room small {
	font-size: 14px;
	color: gray;
}

.room p {
    font-size: 20px;
    color: black;
    margin: 10px 0;
}

/* 호버 효과 */
.room:hover {
    background-color: rgb(222 211 200);
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}
.image-box:hover {
    background-color: rgb(222 211 200);
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.5);
}
.main_div {
	width: 80%; 
	margin: 0 auto;
	background-color: white;
}

   	</style>
</head>
<body>
<%@ include file="../navbar.jsp" %>
<div class="main_div">
	<!-- 내부 기본시설(3장정도) -->
    <div class="facility">
        <h2>내부 기본시설(전룸 공통)</h2>
        <div class="facility-details">

        </div>
    </div>
    
    <!-- 사진, 설명 -->
    <div class="image-container">
        <div class="image-box">
            <div class="image" style="background-image: url('./roompic/1.jpg');"></div>
            <div class="image-text">크고 편안한 색상의 유리 화이트 보드
(보드마카/지우개 제공)</div>
        </div>
         <!-- 사진들 3 -->
        <div class="image-box">
            <div class="image" style="background-image: url('./roompic/2.jpg');"></div>
            <div class="image-text">넉넉한 테이블 공간을 위한
900~1,000mm 의 폭넓은 책상</div>
        </div>
		<!-- 사진들 3 -->
        <div class="image-box">
            <div class="image" style="background-image: url('./roompic/3.jpg');"></div>
            <div class="image-text">장시간 이용에도 불편함이 없는
최고급 가변형 등받이 메쉬의자</div>
        </div>
    </div>
    
    
    

    <!-- 뭔가 있어보이게 -->
    <div class="facility">
        <h2>기타시설</h2>
        <div class="facility-details">
            <!-- 기타시설에 대한 설명을 추가하세요 -->
        </div>
    </div>

    <!-- ** -->
    <div class="image-container">
        <div class="image-box">
            <div class="image" style="background-image: url('./roompic/4.jpg');"></div>
            <div class="image-text">천장형 시스템 냉난방기(개별)</div>
        </div>
         <!-- sm -->
        <div class="image-box">
            <div class="image" style="background-image: url('./roompic/5.jpg');"></div>
            <div class="image-text">기가급 와이파이 (KT 광기가) 음영지대 없이
빵빵한 4채널(5G 2채널 포함) 와이파이</div>
        </div>
		<!-- sm -->
        <div class="image-box">
            <div class="image" style="background-image: url('./roompic/6.jpg');"></div>
            <div class="image-text">CCTV보안시설이 완비되어 있습니다</div>
        </div>
    </div>


    <!-- 리스트를 표시할 부분 -->
    <div id="content" class='content'>
        <!-- 모임공간 리스트의 제목 -->
        <h1>모임공간 리스트</h1>
        
        <!-- 모임공간 리스트 -->
        <div class="room-list">
            <!-- 방들 for문으로 가져오기 -->
            <% if(roomList != null && listCount > 0){ %>
                <% for(int i=0; i<roomList.size(); i++){ %>
                    <div class="room">
                        <!-- 모임공간 이미지 -->
                        <div class="room-image" style="background-image: url('./roomUpload/<%=roomList.get(i).getR_file()%>');"></div>
                        <!-- 모임공간 정보 -->
                        <div class="room-info">
                            <h2><%= roomList.get(i).getR_name()%></h2>
                            <small class="max"> 정원 : <%=roomList.get(i).getR_max()%>명</small>
                            <p class="room_text"><%= roomList.get(i).getR_desc()%></p>
                            <!-- 기타 모임공간 정보를 나타내는 요소 추가 -->
                        </div>
                    </div>
                <% } %>
            <% } else { %>
                <!-- null or 방 없을때 -->
                <p>등록된 모임공간이 없습니다.</p>
            <% } %>
        </div>
    </div>

    <!-- 필요한 JavaScript 코드를 로드하는 부분 -->
    </div>
</body>
</html>