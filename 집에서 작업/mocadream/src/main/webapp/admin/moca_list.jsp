<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="vo.Mc_rooms"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<%
	ArrayList<Mc_rooms> roomList = (ArrayList<Mc_rooms>) request.getAttribute("roomList");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css">

<link rel="stylesheet" href="./css/modal.css">
<meta charset="UTF-8" />
<title>MVC 게시판</title>
<style>
#ListArea {
	border-radius: 10px;
	overflow: auto;
}

section.small {
	width: 50%;
	margin: 0 auto;
}

#pageList {
	margin: auto;
	width: 500px;
	text-align: center;
}

#emptyArea {
	margin: auto;
	width: 500px;
	text-align: center;
}

section {
	margin-top: 20px;
}

section.title{
	font-size:25px
}

small.warning {
	font-size: 12px;
	color: red;
	padding: 0 3% 0 0;
}

div.d1 {
	background-color: white;
	width: 80%;
	margin: 0 auto;
	padding: 10px;
}

table {
	width: 100%;
	margin: 0 auto;
	border-collapse: collapse;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	text-align: center;
	margin: 0 auto;
}

td {
	padding: 2px 15px;
	white-space: nowrap;
	height: 50px;
	vertical-align: middle;
	border-top: 1px solid #dee2e6;
}

tr.tr1 {
	background-color: #dee2e6;
	font-size:18px;
	color: #343a40;
	border-top: 1px solid #dee2e6;
}

td.td1 {
	background-color: rgb(242, 231, 220);
	font-size:18px;
}

div.right {
	text-align: right;
}

input {
	width: 300px;
	height: 25px;
	padding: 10px;
	background-color: rgb(250, 240, 230);
	border-radius: 10px;
	border: 1px solid #ccc;
}

input:focus {
	border: 2px solid #000;
}
h1 {
	font-size: 1.6em;
}
</style>
</head>
<body>
<div class="body-wrapper">
    <h1>방 목록</h1>
	<div class="right">
	    <button class="button-link" onclick="window.location.href='addroom.mc'">방 추가</button>
	</div>
    <section id="ListArea">
        <table>
            <% if (roomList != null && listCount > 0) { %>
                <tr class="tr1">
                    <td>방번호</td>
                    <td>방이름</td>
                    <td>이용가능인원</td>
                    <td>소개</td>
                    <td>사진</td>
                    <td>수정</td>
                    <td>삭제</td>
                </tr>
                <% for (int i = 0; i < roomList.size(); i++) { %>
                    <tr>
                        <td><%=roomList.get(i).getR_no()%></td>
                        <td><%=roomList.get(i).getR_name()%></td>
                        <td><%=roomList.get(i).getR_max()%></td>
                        <td><%=roomList.get(i).getR_desc()%></td>
                        <td><%=roomList.get(i).getR_file()%></td>
                        <td><button onclick="window.location.href='mocaModifyForm.mc?r_no=<%=roomList.get(i).getR_no()%>&page=<%=nowPage%>'">수정</button></td>

                        <td><button class="modal_btn" data-rno="<%=roomList.get(i).getR_no()%>">삭제</button></td>
                    </tr>
                <% } %>
        </table>
    </section>
</div>

<% } else { %>
    <section id="emptyArea">
        등록된 방이 없습니다. <br>
    </section>
<%} %>

 <div class="modal" id="myModal">
        <div class="modal-content">
            <form action="mocaDeletePro.mc" method="POST" id="deleteForm">
                <fieldset>
                    <table class="md-table">
                        <tr class="md-tr">
                            <td class="md-title md-td"><label for="id">삭제하시겠습니까?</label></td>
                        </tr>
                        <tr class="md-tr">
                            <td class="md-td" style="text-align: center;">
                                <button class="selectButton md-button" type="submit">네</button>
                                <button class="close_btn md-button" type="button">아니요</button>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const modal = document.getElementById('myModal');
    const modalOpenButtons = document.querySelectorAll('.modal_btn');
    const modalCloseButton = document.querySelector('.close_btn');
    const deleteForm = document.getElementById('deleteForm');
    const deleteButton = document.querySelector('.modal .selectButton[type="submit"]');
    const cancelButton = document.querySelector('.modal .selectButton[type="button"]');

    modalOpenButtons.forEach(button => {
        button.addEventListener('click', function() {
            modal.style.display = 'flex';
            const rNo = this.getAttribute('data-rno');
            deleteForm.action = 'mocaDeletePro.mc?r_no=' + rNo;
        });
    });

    modalCloseButton.addEventListener('click', function() {
        modal.style.display = 'none';
    });

    cancelButton.addEventListener('click', function() {
        modal.style.display = 'none';
    });
});
</script>

<a href="main.jsp">메인으로</a>&nbsp;
</body>
</html>
