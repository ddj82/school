<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>

<style>
body {
	margin: 0;
	padding: 0;
}

body>div {
	width: 80%;
	margin: 0 auto;
}

/*  slide- image style  */
.slide {
	/* layout */
	display: flex;
	flex-wrap: nowrap;
	/* 컨테이너의 내용물이 컨테이너 크기(width, height)를 넘어설 때 보이지 않도록 하기 위해 hidden을 준다. */
	overflow: hidden;
	/* position */
	/* slide_button의 position absolute가 컨테이너 안쪽에서 top, left, right offset이 적용될 수 있도록 relative를 준다. (기본값이 static인데, static인 경우 그 상위 컨테이너로 나가면서 현재 코드에선 html을 기준으로 offset을 적용시키기 때문) */
	position: relative;
	/* size */
	width: 100%;
	/* slide drag를 위해 DOM요소가 드래그로 선택되는것을 방지 */
	user-select: none;
}

.slide_item {
	/* layout */
	display: flex;
	align-items: center;
	justify-content: center;
	opacity: 0.8;
	/* position - 버튼 클릭시 left offset값을 적용시키기 위해 */
	position: relative;
	left: 0px;
	/* size */
	width: 100%;
	height: 600px;
	/* flex item의 flex-shrink는 기본값이 1이므로 컨테이너 크기에 맞게 줄어드는데, 슬라이드를 구현할 것이므로 줄어들지 않도록 0을 준다. */
	flex-shrink: 0;
	/* transition */
	transition: left 0.15s;
}

slide_item {
	/* layout */
	display: flex;
	align-items: center;
	justify-content: center;
	opacity: 0.7;
	/* position - 버튼 클릭시 left offset값을 적용시키기 위해 */
	position: relative;
	left: 0px;
	/* size */
	width: 100%;
	height: 600px;
	/* flex item의 flex-shrink는 기본값이 1이므로 컨테이너 크기에 맞게 줄어드는데, 슬라이드를 구현할 것이므로 줄어들지 않도록 0을 준다. */
	flex-shrink: 0;
	/* transition */
	transition: left 0.15s;
}

.booking_button {
	/* layout */
	display: flex;
	justify-content: center;
	align-items: center;
	/* position */
	position: absolute;
	/* button-size */
	width: 300px;
	height: 60px;
	/* button-style */
	border-radius: 10%;
	background-color: orange;
	cursor: pointer;
	/* 버튼 가운데 정렬 */
	top: 50%;
	left: 50%;
	top: calc(70%);
	transform: translate(-50%, -50%);
	/* font */
	font-size: 20px;
	font-weight: border;
	color: black;
}

.slide_button {
	/* layout */
	display: flex;
	justify-content: center;
	align-items: center;
	/* position */
	position: absolute;
	/* 버튼이 중앙에 위치하게 하기위해 계산 */
	top: calc(50% - 16px);
	/* size */
	width: 32px;
	height: 32px;
	/* style */
	border-radius: 100%;
	background-color: #cccc;
	cursor: pointer;
}

.slide_prev_button {
	left: 10px;
}

.slide_next_button {
	right: 10px;
}

/* 각 슬라이드가 변경되는 것을 시각적으로 확인하기 쉽도록 각 슬라이드별 색상 적용 */

















.slide_item.item1 {
	background-image: url("./roompic/1.jpg");
	background-size: 100% 100%;
}

.slide_item.item2 {
	background-image: url("./roompic/2.jpg");
	background-size: 100% 100%;
}

.slide_item.item3 {
	background-image: url("./roompic/3.jpg");
	background-size: 100% 100%;
}

.slide_item.item4 {
	background-image: url("./roompic/4.jpg");
	background-size: 100% 100%;
}

.slide_item.item5 {
	background-image: url("./roompic/5.jpg");
	background-size: 100% 100%;
}

.slide_item.item6 {
	background-image: url("./roompic/6.jpg");
	background-size: 100% 100%;
}

.slide_item.item7 {
	background-image: url("./roompic/7.jpg");
	background-size: 100% 100%;
}

.slide_item.item8 {
	background-image: url("./roompic/8.jpg");
	background-size: 100% 100%;
}

/* 페이지네이션 스타일 */
ul, li {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.slide_pagination {
	/* layout */
	display: flex;
	gap: 5px;
	/* position */
	position: absolute;
	bottom: 0;
	/* left:50%, translateX(-50%)를 하면 가로 가운데로 위치시킬 수 있다. */
	left: 50%;
	transform: translateX(-50%);
}

.slide_pagination>li {
	/* 현재 슬라이드가 아닌 것은 투명도 부여 */
	color: #7fb5ff88;
	cursor: pointer;
	font-size: 25px;
}

.slide_pagination>li.active {
	/* 현재 슬라이드 색상은 투명도 없이 */
	color: #7fb5ff;
}

.slide_item_duplicate {
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	left: 0px;
	width: 100%;
	height: 600px;
	flex-shrink: 0;
	transition: left 0.15s;
}

.text_1 {
	/* layout */
	display: flex;
	justify-content: center;
	align-items: center;
	/* position */
	position: absolute;
	/* button-style */
	/*     border-radius: 10%;
    background-color: orange; */
	cursor: pointer;
	color: orange;
	/* 버튼 가운데 정렬 */
	top: 50%;
	left: 50%;
	top: calc(30%);
	transform: translate(-50%, -50%);
	/* font */
	font-weight: border;
}

.text_box {
	background-color: rgba(0, 0, 0, 0.8);
	width: 800px;
	height: 350px;
	border: 5px solid orange;
	border-radius: 5%;
}

.manual {
	padding: 40px 100px;
	margin: 0 auto;
	text-align: center;
}

.manual_bigbox {
	display: flex;
	justify-content: space-around;
}

.manual img {
	width: 80px;
}

.manual_box {
	width: 25%;
	padding: 20px;
	padding-top: 40px;
	background-color: white;
	margin-top: 40px;
	text-align: center;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

.manual_box_p {
	margin-top: 40px;
	font-size: 12px;
	font-weight: bold;
}

.manual_box p:first-child {
	font-size: 18px;
	font-wieght: bold;
}

.staff {
	background-color: white;
	margin: 0 auto;
	padding: 40px 100px;
	text-align: center;
}

.staff_box1 {
	display: flex;
	justify-content: space-around;
}

.swiper-container-title {
	display: flex;
	justify-content: center;
	font-size: 1.5em;
	font-weight: bold;
	align-items: center;
	padding-bottom: 40px;
}

.swiper-slide {
	display: flex;
	position: relative;
	align-items: center;
	justify-content: center;
	text-align: center;
}

.swiper-slide img {
	box-shadow: 0 0 5px #555;
	height: 100%;
	width: 100%;
	max-width: 100%;
}

.swiper-slide-content {
	position: relative;
	width: 100%;
	height: 0;
	padding-bottom: 100%; /* 1:1 비율을 위해 높이를 너비의 100%로 설정 */
}

.image-wrapper {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.image-wrapper img {
	width: 100%;
	height: 100%;
	object-fit: cover; /* 이미지가 잘리지 않고 적절하게 보이도록 설정 */
}

.text-overlay {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 80%;
	max-width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	background: rgba(0, 0, 0, 0.5);
	background: linear-gradient(0deg, rgba(0, 0, 0, 0.9) 0%,
		rgba(103, 103, 103, 0.8) 72%, rgba(255, 255, 255, 0) 100%);
	opacity: 0;
	transition: opacity 0.3s ease;
}

.swiper-slide:hover .text-overlay {
	opacity: 1;
}

.text-overlay p {
	color: white;
	font-size: 18px;
	text-align: center;
	padding: 10px;
}

.introduce-container{
}

.introduce-content {
	display: flex;
	
}

.introduce-title{
margin-top:40px;
font-size:4em;
}

.introduce-text{
position:relative;
}

.introduce-maintext{
font-size:2em;
color:#000;  
}


.introduce-subtext{
text-align:end;
width:100%;
position:absolute;
bottom:40%;
right:10%;
font-size:1.5em;
font-weight:bold;
border-bottom:4px solid rgb(242, 231, 220);
}

.introduce-subtext2{
position:absolute;
bottom:20%;
right:10%;
font-size:1em;
font-weight:bold;
color:orange;

}


.introduce-text {
	flex: 1; /* 자동으로 확장되도록 설정합니다. */
	padding-right: 20px;
}



.introduce-img {
	flex: 1; /* 자동으로 확장되도록 설정합니다. */
	text-align: center; /* 이미지를 가운데로 정렬합니다. */
	align-items: center; /* 수직 정렬을 위해 아이템들을 센터로 정렬합니다. */
	justify-content: center; /* 수평 정렬을 위해 아이템들을 가운데로 정렬합니다. */
}

.introduce-img img {
	width: 100%;
	height:auto;
}
</style>
<script src="./jquery/jquery-3.6.4.js"></script>
</head>
<body>
	<%@ include file="./navbar.jsp"%>

	<div class="slide slide_wrap">
		<div class="slide_item item1">1</div>
		<div class="slide_item item2">2</div>
		<div class="slide_item item3">3</div>
		<div class="slide_item item4">4</div>
		<div class="slide_item item5">5</div>
		<div class="slide_prev_button slide_button">◀</div>
		<div class="slide_next_button slide_button">▶</div>
		<ul class="slide_pagination"></ul>
		<div class="booking_button" onclick="location.href='#'">예약하기</div>
	</div>


<div class="introduce-container">
    <div class="introduce-title">
        <span>Special Study<br> Environment</span>
    </div>
    <div class="introduce-content">
        <div class="introduce-text">
            <div class="introduce-maintext">
                <span>특별한 학습 환경을 제공해드립니다.</span>
            </div>

            <div class="introduce-subtext">
                <span>STUDY / MEET / CO-Work <br>총 8개 단독룸으로 구성된 프리미엄 모임공간</span>
            </div>
            <div class="introduce-subtext2">
            <span>창이있어 답답하지 않은 편안한 공간 모든공간(룸) 열리는 외창 설계 <br>시간에 제약이 없는 무인 24시간 체계<br>부담없는 비용으로
만날 수 있습니다.</span>
            </div>
        </div>
        <div class="introduce-img">
            <img src="./roompic/2.jpg">
        </div>
    </div>
</div>










	<!-- 클래스명은 변경하면 안 됨 -->
	<div class="swiper-container">
		<div class="swiper-container-title">
			<p>편의 시설</p>
		</div>
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<div class="swiper-slide-content">
					<div class="image-wrapper">
						<img src="./roompic/2.jpg">
						<div class="text-overlay">
							<p>
								<span style="color: orange; font-size: 12px">시설명</span><br>
								<br>소개
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="swiper-slide">
				<div class="swiper-slide-content">
					<div class="image-wrapper">
						<img src="./roompic/2.jpg">
						<div class="text-overlay">
							<p>
								<span style="color: orange; font-size: 12px">시설명</span><br>
								<br>소개
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="swiper-slide">
				<div class="swiper-slide-content">
					<div class="image-wrapper">
						<img src="./roompic/2.jpg">
						<div class="text-overlay">
							<p>
								<span style="color: orange; font-size: 12px">시설명</span><br>
								<br>소개
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="swiper-slide">
				<div class="swiper-slide-content">
					<div class="image-wrapper">
						<img src="./roompic/2.jpg">
						<div class="text-overlay">
							<p>
								<span style="color: orange; font-size: 12px">시설명</span><br>
								<br>소개
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="swiper-slide">
				<div class="swiper-slide-content">
					<div class="image-wrapper">
						<img src="./roompic/2.jpg">
						<div class="text-overlay">
							<p>
								<span style="color: orange; font-size: 12px">시설명</span><br>
								<br>소개
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="swiper-slide">
				<div class="swiper-slide-content">
					<div class="image-wrapper">
						<img src="./roompic/2.jpg">
						<div class="text-overlay">
							<p>
								<span style="color: orange; font-size: 12px">시설명</span><br>
								<br>소개
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<div class="manual">
		<h2>이용안내</h2>
		<div class="manual_bigbox">

			<div class="manual_box">
				<img src="./manualpic/clock_black.png">
				<div class="manual_box_p">
					<p>이용시간
					<p>
					<p>AM 09:00 ~ PM 09:00</p>
					<p>연중무휴</p>
				</div>
			</div>


			<div class="manual_box">
				<img src="./manualpic/chair_black2.png">
				<div class="manual_box_p">
					<p>넉넉한 공간
					<p>
					<p>900~1,000mm 의 폭넓은 책상
					<p>
					<p>최대 12인실까지 구비된 스터디룸</p>
				</div>
			</div>


			<div class="manual_box">
				<img src="./manualpic/caution_notice.png">
				<div class="manual_box_p">
					<p>주의사항
					<p>
					<p>함께 사용하는 공간이에요! 정숙!</p>
					<p>타인의 소지품을 손대면 안되요!</p>
					<p>전 구역 CCTV 작동중</p>
				</div>
			</div>
		</div>
	</div>

	<div class="staff">

		<div>
			<h2>STAFF</h2>
		</div>

		<div class="staff_box1">
			<div>
				<img src="">
				<p>Dongjun Kim</p>
			</div>


			<div>
				<img src="">
				<p>Byeon Yurim</p>
			</div>

			<div>
				<img src="">
				<p>Lee Hwanseok</p>
			</div>


			<div>
				<img src="">
				<p>Jung Hakyung</p>
			</div>

		</div>

		<div class="staff_box1">
			<div>
				<img src="">
				<p>Kim Dongwook</p>
			</div>


			<div>
				<img src="">
				<p>Bang Yisak</p>
			</div>

			<div>
				<img src="">
				<p>Je Donghyeon</p>
			</div>
		</div>
	</div>




	<script src="./slide.js"></script>
	<script src="./slide2.js"></script>
</body>


</html>