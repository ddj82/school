<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.Mc_rooms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
%>
<%
ArrayList<Mc_rooms> mc_rooms = (ArrayList<Mc_rooms>) request.getAttribute("mc_rooms");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOCA DREAM 예약하기 페이지</title>
<style>
	.input {
		width: 400px;
		height: 30px;
	}
	
	table {
		margin: auto;
		text-align: center;
	}
	
	#order, #reset {
		width: 30px border
	}
	
    p#log {
        text-align: right;
        margin-right: 20px;
    }
    
    select#selectT option {
    	display: none;
    }
    
    select#selectUseT option {
    	display: none;
    }
    
    option#none {
    	display: none;
    }
</style>
<script>
	function sYesTime() {
		let rname = document.getElementById("rname").value;
		let rcal = document.getElementById("r_cal").value;
		let runame = document.getElementById("r_uname").value;
		if (rname != "" && rcal != "") {
			location.href = "selectYesTime.mc?r_name=" + rname + "&r_cal=" + rcal + "&r_uname=" + runame;
		} else if (rname == "") {
			alert("방을 선택해 주세요");
		} else if (rcal == "") {
			alert("날짜를 선택해 주세요");
		} else {
			alert("방이나 날짜를 선택해 주세요");
		}
	}
	
	function optshow() {
		for (let i = 0; i < document.getElementById("selectT").children.length; i++) {
	        let a = document.getElementById("selectT").children[i];
	        a.style.display = 'inline-block';
	    }
	}
	
	function optNoTimeHide(noTime) {
		for (let i = 0; i < document.getElementById("selectT").children.length; i++) {
	        let a = document.getElementById("selectT").children[i];
	        let a2 = a.value;
	        if (a2.includes(noTime)) {
		        a.style.display = 'none';
	        }
	    }
	}
	
	function setUserVal(rna, rca, runm) {
		document.getElementById("rname").value = rna;
		document.getElementById("r_cal").value = rca;
		document.getElementById("r_uname").value = runm;
		
	}
	
    function optUseTshow() {
        for (let i = 0; i < document.getElementById("selectUseT").children.length; i++) {
            let a = document.getElementById("selectUseT").children[i];
            a.style.display = 'inline-block';
        }
        optUseHide();
	}
    
    function optUseHide() {
        let z = document.getElementById("selectT");
        let z1 = z.options[z.selectedIndex].value; //선택한 시작시간
        let z2;
        let z3;
        
        if (parseInt(z1) == 20) {
        	let a = document.getElementById("selectUseT").children[1];
        	a.style.display = 'none';
        	a = document.getElementById("selectUseT").children[2];
        	a.style.display = 'none';
        } else {
	        main:
	        for (let i = z.selectedIndex + 1; i < z.children.length; i++) { // z1 - 19:00, z2 - 20:00
	            if (z.children[i].style.display == "inline-block") {
	            	z2 = z.options[i].value;
	                if (parseInt(z2) == (parseInt(z1) + 1)) {
	                	if (parseInt(z1) == 19 && parseInt(z2) == 20) {
		                	let a = document.getElementById("selectUseT").children[2];
		                	a.style.display = 'none';
	                		break main;
	                	} else {
							for (let j = i + 1; j < z.children.length; j++) {
								if (z.children[j].style.display == "inline-block") {
									z3 = z.options[j].value;
				                	if (parseInt(z3) == (parseInt(z2) + 1)) {
				                		//1,2,3시간 이용 보이게
				                		break main;
				                	} else {
					                	//1,2시간 이용 보이게
					                	let a = document.getElementById("selectUseT").children[2];
					                	a.style.display = 'none';
				                		break main;
				                	}
								}
							}
	                	}
	                } else {
	                	//1시간 이용만 보이게
	                	let a = document.getElementById("selectUseT").children[1];
	                	a.style.display = 'none';
	                	a = document.getElementById("selectUseT").children[2];
	                	a.style.display = 'none';
	                	break;
	                }
	            }
	        }
        }
    }
        
</script>
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
	
<%
ArrayList<Integer> noTimeList = (ArrayList<Integer>) request.getAttribute("noTimeList");
%>
	
	<form name="orderform" action="userOrderAction.mc" method="post" id="orderform">
		<section id="orderformArea">
			<table>
				<tr>
					<td colspan="2"><h1>예약 하기</h1></td>
				</tr>

				<tr>
					<td><label for="r_name">방 이름 : </label></td>
					<td>
					<select name="r_name" id="rname" class="input">
						<% for (int i = 0; i < mc_rooms.size(); i++) { %>
							<option value="<%=mc_rooms.get(i).getR_name()%>"><%=mc_rooms.get(i).getR_name()%></option>
						<% } %>
					</select>
					</td>
				</tr>
				<tr>
					<td><label for="r_uname">예약자 이름 : </label></td>
					<td><input type="text" name="r_uname" class="input" id="r_uname" value="${id }" readonly></td>
				</tr>
				<tr>
					<td><label for="r_cal">예약 날짜 : </label></td>
					<td><input type="date" name="r_cal" class="input" id="r_cal" /></td>
				</tr>
				<tr>
					<td><label for="yestime"></label></td>
					<td><button type="button" name="yestime" class="input" onclick="sYesTime()">예약가능 시간 검색</button></td>
				</tr>
				<tr>
					<td><label for="r_statime">예약 시간 : </label></td>
					<td>
					<select name="r_statime" class="input" id="selectT">
						<option id="none">시간을 선택해주세요.</option>
						<option>09:00</option>
						<option>10:00</option>
						<option>11:00</option>
						<option>12:00</option>
						<option>13:00</option>
						<option>14:00</option>
						<option>15:00</option>
						<option>16:00</option>
						<option>17:00</option>
						<option>18:00</option>
						<option>19:00</option>
						<option>20:00</option>
					</select>
					</td>
					<%
					 if (!(noTimeList != null)) {
						out.println("<script>");
						out.println("optshow();");
						out.println("</script>");
					}
					if (noTimeList != null) {
						String rna = (String) request.getAttribute("r_name");
						String rca = (String) request.getAttribute("r_cal");
						String runm = (String) request.getAttribute("r_uname");
						out.println("<script>");
						out.println("setUserVal('" + rna + "', '" + rca + "', '" + runm + "');");
						out.println("optshow();");
						out.println("</script>");
						for (int i = 0; i < noTimeList.size(); i++) {
							out.println("<script>");
							out.println("optNoTimeHide(" + noTimeList.get(i) + ");");
							out.println("</script>");
						}
					}
					%>
				</tr>
				<tr>
					<td><label for="usetime"></label></td>
					<td><button type="button" name="usetime" class="input" onclick="optUseTshow()">이용가능 시간 검색</button></td>
				</tr>
				<tr>
					<td><label for="r_time">이용 시간 : </label></td>
					<td>
					<select name="r_time" class="input" id="selectUseT">
						<option>1시간 이용</option>
						<option>2시간 이용</option>
						<option>3시간 이용</option>
					</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" id="order" value="예약 신청" onclick="orderbtn()">&nbsp;&nbsp;
					<input type="reset" id="reset" value="다시 예약하기">
					</td>
				</tr>
			</table>
		</section>
	</form>
	<br><br>
	<a href="main.jsp">메인으로</a>&nbsp;
<script>
	document.getElementById("order").addEventListener("click", function(e){
	    if (orderform.selectT.value == '시간을 선택해주세요.') {
	        e.preventDefault();
	        alert("시간을 선택해주세요.");
	    }
	});
</script>
</body>
</html>