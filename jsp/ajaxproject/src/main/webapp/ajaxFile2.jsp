<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Test</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script>
$(function() {
	$("button").click(function() {
		let idval = {"id" : document.frm.id.value};
		$.ajax({
			url : "loginCheck", 
			type : "post",
			data : { id: document.frm.id.value }, //json형식으로 보낼땐 19번줄처럼 contentType을 기술해야함, 그 전에 18번줄
// 			data : idval, //form태그의 Parameter, idval의 키=> 파라미터의 name, 벨류=> 파라미터의 value
// 			contentType: 'application/x-www-form-urlencoded; charset=utf-8', //보내는 데이터 타입, form데이터의 타입(디폴트)이다.
			data : JSON.stringify(idval), //15번줄 object형식을 json형식으로 바꾸는 식
			contentType: 'application/json; charset=utf-8', //보내는 데이터 타입
// 			dataType : "json", //서버에서 받는 데이터타입, 기술 안하면 알아서 인식해서 받아와줌
			cache : false,			
			success : function(res) { //해당 실행 함수의 매개변수 data는 내가 지어준 이름, response로 받은 데이터들을 받음
				/*
				res => {map : {str : "사용할수없는~~~", id : "admin"}}
				*/
				console.log('success');
				alert(res.map.id +'는 '+ res.map.str); 
			},
			errer : function() {
				alert('errer');
			}
		});
	});
});

// window.onload = function(){
// 	document.getElementsByTagName("button")[0].onclick = function(){
// 		alert('클릭');
// 		var xhttp = new XMLHttpRequest();
		
// 		xhttp.responseType ="json";
// 		xhttp.onreadystatechange = function() {
// 			if (this.readyState == 4 && this.status == 200) {
// 				console.log('response: ',xhttp.response);
// 				let res = xhttp.response;
// 				alert(res.map.id +'는 '+ res.map.str);
// 			}
// 		};
		
// 		xhttp.open("POST", "loginCheck", true);
		
// 		var formElement = document.getElementsByName("frm")[0];
// 		var formdata = new FormData(formElement);
// 		xhttp.send(formdata);
		
// // 		xhttp.setRequestHeader('content-type', 'json');
// // 		var formdata = {"id" : document.frm.id.value};
// // 		xhttp.send(JSON.stringify(formdata));
// 	};
// };
</script>
	
</head>
<body>
	<form name="frm">
		<input type="text" name="id"> <button type="button">아이디 중복체크</button>
	</form>
	

</body>
</html>
