<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    body {
        margin: 0;
        padding: 0;
		background-color: #f0f0f0;
    }

    .map {
        width: 750px;
        height: 750px;
        margin: 50px auto;
        background-color: white;
        text-align: center;
        padding: 25px;
    }


		



    h2 {
        color: #333; /* 변경된 헤더 폰트 색상 */
        padding-left: 30%;
    }

    .map_cont {
        margin: 0 auto;
        width: 700px; /* 수정된 너비 */
        height: 450px; /* 수정된 높이 */
    }

    table {
        text-align: left;
        padding: 50px;
        border: 1px solid black;
        box-sizing: border-box;
        text-indent: initial;
        border-collapse: collapse;
        border-spacing: 0;
        width: 100%;
        margin-bottom: 50px;
        background-color: #ffffff; /* 테이블 배경색 */
    }

    thead {
        font-size: 20px;
        font-weight: bolder;
    }

    table th {
        text-align: center;
        width: 20%;
        font-weight: 600;
        color: #222222;
        padding: 8px 0;
        border-bottom: 2px solid floralwhite;
    }

    th, td {
        border-collapse: collapse;
    }

    th {
        vertical-align: middle;
        margin: 0;
        padding: 0;
        font-family: 'Nanum Gothic', dotum, sans-serif;
        unicode-bidi: isolate;
    }

    div.map_cont h2 {
        font-size: 16px;
        color: #222222;
        font-weight: 600;
        padding-bottom: 10px;
    }

    div.footer {
        width: 750px;
        margin: 0 auto;
    }

    .sub_container .sub_cont div.sub_map div.map_cont table tr:first-child td {
        border-top: 2px solid #d3d3d3;
    }

    table td {
        font-weight: 100;
        color: #666666;
        line-height: 20px;
        padding: 8px 40px;
        border-bottom: 1px solid #d3d3d3;
    }

    td {
        border-collapse: collapse;
    }

</style>


</head>
<body>
<div class="body-wrapper">
<section style="border: 1px solid white;">
  <article>
    <h2>오시는 길</h2>
  </article>
</section>



<main style="border: 1px solid white;">
  <!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div class="map">
<div id="daumRoughmapContainer1711698072462" class="root_daum_roughmap root_daum_roughmap_landing" style="display: inline-block;"></div>
</div>
<!--
    2. 설치 스크립트
    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
    new daum.roughmap.Lander({
        "timestamp" : "1711698072462",
        "key" : "2iqdo",
        "mapWidth" : "700",
        "mapHeight" : "700"
    }).render();
</script>
<div class="footer">
            <div class="map_cont">
                        <h2>회사정보</h2>
                        <table>
                            <tbody><tr>
                                <th>회사명</th>
                                <td>MOCA 스터디룸</td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td>경기도 안양시 안양역긑처</td>
                            </tr>
                            <tr>
                                <th>대표번호</th>
                                <td>010-3308-XXXX</td>
                            </tr>
                            <tr>
                                <th>팩스번호</th>
                                <td>014-221-156</td>
                            </tr>
                        </tbody></table>
                        <h2>교통정보</h2>
                        <table>
                            <tbody><tr>
                                <th>지하철 이용시</th>
                                <td>안양역 1번출구로 나오신 후 보도 약 16분 소요</td>
                            </tr>
                            <tr>
                                <th>자가용 이용시</th>
                                <td>맥도날드 드라이브스루에서 빅맥 구입 후, 고가도로 근처에서 감자튀김을 먹은 후<br>
                                대충 보이는 길을 따라 이동</td>
                            </tr>
                        </tbody></table>
                    </div>
        </div>

  <article style="border: 1px solid white;">
    <h2>MOCA STUDY ROOM</h2>
    <p>These juicy, green apples make a great filling for
    apple pies.</p>
    <p>... </p>
    <p>... </p>
  </article>

</main>
</div>



</body>
</html>
