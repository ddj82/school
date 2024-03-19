<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 파비콘(해당 사이트를 나타내는 아이콘) 에러 시 -->
<!-- 기본으로 설정되어있는 파비콘 설정법 -->
<!-- <link rel="shortcut icon" href="data:image/x-icon" type="image/x-icon">  -->
<link rel="shortcut icon" href="./img/globe.png">
<style type="text/css">
	form {width: 60%; margin: 0 auto; padding: 10px; text-align: center;}
	input[type=button] {cursor: pointer;}
</style>
</head>
<body>
	<form action="12_02_validation02.jsp" method="post" name="frm">
		<fieldset>
			<legend>exec()메소드 사용</legend>
			<label for="itt">제목 :  </label>
			<input type="text" name="itt" id="itt" value="java server Pages" required><br><br>
			<input type="button" value="전송" onclick="checkForm()">
		</fieldset>
	</form>
	
	
	<script type="text/javascript">
	/* 
	유효성 검사 : 데이터가 전송되기 전 폼 입력값이 규칙에 맞게 입력되었는지 확인하는 것
	정규 표현식 : 특정한 규칙을 가진 문자열의 집합을 표현하는데 사용하는 형식 언어
	형식:
	1. var 변수명 = /정규표현식/[Flag];
	2. var 변수명 = new RegExp("정규표현식", ["Flag"]);
	flag값 : 
	i - 대소문자 구분없이 검사
	g - 문자열 내의 모든 패턴을 검사
	m - 문자열에 줄바꿈행이 있는지 검사
	
	문자열 판단 메소드
	test() : 매개변수 값으로 전달되는 문자열이 정규표현식에 부합한지 판단하여 boolean판단
	exec() : 매개변수 값으로 전달되는 문자열에서 정규표현식에 문자열을 추출하여 반환함.
	
	
	*/
	
		function checkForm() {
			var regExp = /Java server/i; //Java server문자열이 포함되었는지 여부 판단. i - 대소문자 구분없이
// 			var regExp = new RegExp("Java", "i");
			var str = document.frm.itt.value;
// 			var result = regExp.exec(str);
			var result = regExp.test(str);
			alert(result);
			if (result == false) {
				return false;
			} else {
			document.frm.submit();
			}
		}
	</script>
</body>
</html>