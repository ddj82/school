<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="vo.Mc_users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Mc_users mcuser = (Mc_users) request.getAttribute("myPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<style type="text/css">
	body {
		font-family: Arial, sans-serif; background-color: #f9f9f9;
	}
	
	#joinformArea {
		width: 30%; margin: 50px auto; padding: 20px; border: 1px solid #ccc; 
		background-color: #fff;
	}
	
	table {
		width: 80%; margin: auto;
	}
	
	td {
		text-align: left; padding: 10px;
	}
	
	label {
		font-weight: bold;
	}
	
	input[type="text"],input[type="password"] {
		width: calc(100% - 20px); padding: 8px; margin-top: 5px; 
		border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box;
	}
	
	input[type="button"] {
		width: 150px; padding: 8px; border: none; border-radius: 5px; 
		background-color: #007bff; color: #fff; cursor: pointer;
	}
	
	input[type="button"]:hover {
		background-color: #0056b3;
	}
	
	a {
		text-decoration: none; color: #007bff; font-weight: bold;
	}
	
	a:hover {
		text-decoration: underline;
	}
	
	#idbox {
		position: relative;
	}
	
	.btn1 {
		width: 150px; padding: 8px; border: none; border-radius: 5px; 
		background-color: #007bff; color: #fff; cursor: pointer;
	}
	
	#idchkbtn {
		position: absolute; width: 80px; height: 33px; 
		top: 6px; bottom: 0; right: 20px; 
		margin: auto 0; border-radius: 3px; border: none; 
		background-color: #007bff; color: #fff; cursor: pointer; font-size: 12px;
	}
	
	#btns {
		text-align: center;
	}
	
	#hiddenDiv {
		display: none; /* 초기에는 숨겨진 상태로 설정 */ 
		width: 200px; height: 100px; background-color: lightblue; 
		position: absolute; 
		top: 50%; left: 50%; transform: translate(-50%, -50%);
	}
	
	#errorMessages, #iderrorMessages, #pwerrorMessages, 
	#pwcferrorMessages, #nameerrorMessages, #emailerrorMessages, 
	#addrerrorMessages, #telerrorMessages, #postcodeerrorMessages {
		color: red; font-size: 12px; margin: 10px 0; 
		display: none; 
		padding-left: 30px; font-weight: bold;
	}
</style>
</head>
<body>
	<section id="registForm">
		<p id="log">
			<c:choose>
				<c:when test="${id ne null }">
					<%
					if (session.getAttribute("id").equals("admin")) {
					%>
					[관리자계정]&nbsp; <a href="logout">로그아웃</a>
					<%
					} else {
					%>
					${id }님, 환영합니다. <a href="logout">로그아웃</a>
					<a href="loginMypage.mc">내 정보수정</a>
					<%
					}
					%>
				</c:when>
				<c:otherwise>
					<a href="loginForm.html">로그인</a>
				</c:otherwise>
			</c:choose>
		</p>
	</section>
	<section id="joinformArea">
		<h2>내 정보수정</h2>
		<form action="myPageModifyProAction.mc" onsubmit="return validateForm()" method="post" name="modifyform">
			<table>
				<tr>
					<td><label for="id">아이디</label>
					<br> 
					<input type="text" class="id" pattern="[a-zA-Z0-9]+" name="id" id="id" value="<%=mcuser.getId()%>" readonly></td>
				</tr>
				<tr>
					<td><label for="pw">비밀번호</label> 
					<br> 
					<input name="pw" type="password" class="pw" pattern="[a-zA-Z0-9!_\-!@#$%^&*]+" id="pw" value="<%=mcuser.getPw()%>"></td>
				</tr>
				<tr>
					<td><label for="name">이름</label> 
					<br>
					<input name="name" type="text" class="name" pattern="[가-힣a-zA-Z\s]+" maxlength="6" id="name" value="<%=mcuser.getName()%>"></td>
				</tr>
				<tr>
					<td><label for="tel">휴대전화번호</label><br>
					<input name="tel" type="text" class="tel" pattern="(010)-[0-9]{4}-[0-9]{4}" id="tel" value="<%=mcuser.getTel()%>"></td>
				</tr>
				<tr>
					<td><label for="email">이메일</label><br>
					<input name="email" type="email" class="email" pattern="[a-zA-Z0-9_]+[@][a-zA-Z]+[.][a-zA-Z]+[.]*[a-zA-Z]*" id="email" value="<%=mcuser.getEmail()%>"></td>
				</tr>
				<section>
					<tr id="nameerrorMessages">
						<td colspan="2" style="color: red"></td>
					</tr>
					<tr id="telerrorMessages">
						<td colspan="2" style="color: red"></td>
					</tr>
					<tr id="emailerrorMessages">
						<td colspan="2" style="color: red"></td>
					</tr>
					<tr id="errorMessages">
						<td colspan="2" style="color: red"></td>
					</tr>
				</section>
				<tr>
					<td><label for="myaddr">현 주소</label><br>
					<input name="myaddr" type="text" class="myaddr" id="myaddr" value="<%=mcuser.getAddr()%>" readonly></td>
				</tr>
				<section id="addr">
					<td><b>주소</b></td>
					<tr>
						<td><input type="button" name="adrbtn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" /><br>
						<input type="text" class="addNum" name="addNum" id="sample6_postcode" placeholder="우편번호" readonly /></td>
					</tr>
					<tr>
						<td><label for="addr1"></label> 
						<input type="text" class="addr1" name="addr1" id="sample6_address" placeholder="주소" readonly /></td>
					</tr>
					<tr>
						<td><input type="text" name="addr2" class="addr2" id="sample6_detailAddress" placeholder="상세주소" /></td>
					</tr>
					<tr>
						<td><input type="text" name="cmt" id="sample6_extraAddress" placeholder="참고항목" readonly /></td>
					</tr>
				</section>
				<tr id="postcodeerrorMessages">
					<td colspan="2" style="color: red"></td>
				</tr>
				<tr>
					<td id="btns">
						<button id="registerBtn" class="btn1" type="submit" onclick="addrwhere()">수정</button>
					</td>
				</tr>
			</table>
		</form>
		<table>
			<tr>
				<td><a href="javascript:history.go(-1)">[취소]</a> <a href="/users/deleteForm.html">[회원탈퇴]</a></td>
			</tr>
		</table>
		<br> <br> <a href="main.jsp">메인으로</a>&nbsp;
		<script>
			function validateForm() {
				// 모든 오류 메시지 숨기기
				document.getElementById("errorMessages").style.display = "none";
				document.getElementById("nameerrorMessages").style.display = "none";
				document.getElementById("telerrorMessages").style.display = "none";
				document.getElementById("emailerrorMessages").style.display = "none";
				document.getElementById("postcodeerrorMessages").style.display = "none";

				const name = document.getElementById("name").value;
				const tel = document.getElementById("tel").value;
				const email = document.getElementById("email").value;
				const postcode = document.getElementById("sample6_postcode").value;
				const address = document.getElementById("sample6_address").value;

				let isValid = true; // 모든 조건문이 실행되었는지를 나타내는 변수

				// 이름 검사
				if (name == "") {
					document.getElementById("nameerrorMessages").innerHTML = "●&nbsp 이름을 입력해주세요.";
					document.getElementById("nameerrorMessages").style.display = "block";
					isValid = false; // 해당 조건문이 실행됨
				}

				// 전화번호 검사
				if (tel == "") {
					document.getElementById("telerrorMessages").innerHTML = "●&nbsp 전화번호를 입력해주세요.";
					document.getElementById("telerrorMessages").style.display = "block";
					isValid = false; // 해당 조건문이 실행됨
				}

				// 이메일 검사
				if (email == "") {
					document.getElementById("emailerrorMessages").innerHTML = "●&nbsp 이메일을 입력해주세요.";
					document.getElementById("emailerrorMessages").style.display = "block";
					isValid = false; // 해당 조건문이 실행됨
				}

				// 주소 검사
// 				if (postcode == "") {
// 					document.getElementById("postcodeerrorMessages").innerHTML = "●&nbsp 주소를 입력해주세요.";
// 					document.getElementById("postcodeerrorMessages").style.display = "block";
// 					isValid = false; // 해당 조건문이 실행됨
// 				}

				// 모든 조건문이 한 번씩 실행되었는지 확인하고 결과 반환
				return isValid;
			}
		</script>
	</section>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var addr = "";
							var extraAddr = "";

							if (data.userSelectedType === "R") {
								addr = data.roadAddress;
							} else {
								addr = data.jibunAddress;
							}

							if (data.userSelectedType === "R") {
								if (data.bname !== ""
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								if (data.buildingName !== ""
										&& data.apartment === "Y") {
									extraAddr += extraAddr !== "" ? ", "+ data.buildingName: data.buildingName;
								}
								if (extraAddr !== "") {
									extraAddr = " (" + extraAddr + ")";
								}
								document.getElementById("sample6_extraAddress").value = extraAddr;
							} else {
								document.getElementById("sample6_extraAddress").value = "";
							}

							document.getElementById("sample6_postcode").value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							document.getElementById("sample6_detailAddressInfo").focus();
						},
					}).open();
		}
		
	</script>
</body>
</html>