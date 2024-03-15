<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function addFileFnc() {
		let fileAttr = Number(document.getElementById("addFileBtn").previousSibling.getAttribute("name").replace("filename", "")) + 1;
		/* 
		바디태그를 객체로 해서 
		그 안에 아이디가 addFileBtn인 태그를 가져와서
		이 태그의 바로 형 태그를 가져와서 속성명이 name인 태그의 값을 문자열로 가져오고 
		filename이 있으면 빈문자로 바꿈
		이걸 Number생성자로 숫자화 한 후 + 1
		*/
		let filesLength = document.querySelectorAll("input[type=file]").length;
		/* 
		바디태그를 객체로 해서 
		input[type=file]인 태그를 다 모아서 배열로 가져옴
		해당 배열의 길이
		*/
		let btn = document.getElementById("addFileBtn").cloneNode(true);
		/* 
		바디태그를 객체로 해서 
		그 안에 아이디가 addFileBtn인 태그를 가져와서
		해당 태그를 그대로 복사
		*/
		
		document.getElementById("addFileBtn").remove();
		/* 
		바디태그를 객체로 해서 
		그 안에 아이디가 addFileBtn인 태그를 가져와서
		해당 태그를 삭제, 해당 태그의 자식까지 모두
		*/
		document.getElementById("filesDiv").innerHTML += '<p> 파일 : <input type="file" name="filename' + (fileAttr) + '"><button type="button" id="addFileBtn" onclick="addFileFnc()">버튼 추가</button></p>'
		/* 
		바디태그를 객체로 해서
		그 안에 아이디가 filesDiv인 태그를 가져와서
		자식태그, 텍스트 모두 가져와서 그 뒤에 '<p> 파일 : <input type="file" name="filename' + (fileAttr) + '"><button type="button" id="addFileBtn" onclick="addFileFnc()">버튼 추가</button></p>'를 붙히고 HTML형식으로 넣어라
		*/
		if (filesLength == 4) {
			document.getElementById("addFileBtn").remove();
		}
		/* 
		만약 input[type=file]인 태그를 다 모아서 가져온 배열의 길이가(input[type=file]태그가 4개면)
		바디태그를 객체로 해서 
		그 안에 아이디가 addFileBtn인 태그를 가져와서
		해당 태그를 삭제, 해당 태그의 자식까지 모두
		*/
	}
		
	let extArr = ["jpg", "png", "gif", "jpeg", "svg", "bmp"];
	window.onload = function(){
		/* 바디의 모든 데이터가 로드되면 해당 함수 실행 */
		fileForm.addEventListener("submit", function(e){
			/* 
			form태그의 name속성이나 id속성의 값이 fileForm인 태그한테 이벤트핸들러 속성을 지정함 
			해당 태그가 submit될 때 함수 실행
			*/
			let lenTF = false, extTF = false;
			let imgs = document.querySelector("input[type=file]").files;
			/* 
			바디태그를 객체로 해서
			input[type=file]인 태그를 다 모아서 배열로 가져옴
			해당 인풋요소에 올려놓은 파일들을 가져옴
			*/
			let cnt = 0;
			for (let i = 0; i < imgs.length; i++) {
				let extension = imgs[i].name.substring(imgs[i].name.lastIndexOf(".") + 1);
				/* 
				인풋타입파일에 올려놓은 파일들을 모아둔 객체 imgs의 요소 하나하나를 때와서 
				해당 파일의 이름을 때오고
				해당 파일의 이름에서 .뒤에 오는 확장자명을 변수에 담음
				*/
				extArr.forEach(function(obj){
					/* 
					extension에는 내가 올린 파일의 확장자명만 때서 담아놨고
					extArr배열객체의 요소 하나하나 때서 extension와 비교
					같은게 있으면 cnt++
					*/
					if (obj == extension.toLowerCase()) {
						cnt++;
					}
				});
			}
			if (cnt != imgs.length) {
				/* 올린 파일 중 이미지 파일 확장자명이 아닌게 있다면 cnt != imgs.length 것 임. */
				alert("이미지 파일만 업로드 하실 수 있습니다.");
			} else {
				/* 올린 파일 중 이미지 파일 확장자명이 아닌게 없다면 cnt == imgs.length 것 임. */
				extTF = true;
			}
			
			let filesLength = imgs.length;
			if (filesLength > 5) {
				/* multiple로 다중선택을 할 때 6개 이상 선택했을때 */
				alert("파일은 최대 5개까지만 업로드 할 수 있습니다.");
			} else {
				lenTF = true;
			}
				/* 
				올린 파일 중 이미지 파일 확장자명이 아닌게 없다면 extTF = true 해줬고 
				올린 파일의 개수가 5개 이하일 때 lenTF = true 해줬음
				
				만약 올린 파일 중 이미지 파일이 하나라도 있다면 extTF는 false
				만약 올린 파일의 개수가 5개 초과일 때 lenTF는 false
				
				extTF나 lenTF 둘 중 하나라도 false이면 lenTF && extTF는 false인데
				앞에 !를 해줘서 true가 되고 if문 실행
				e.preventDefault()의 e는 form태그의 name속성이나 id속성의 값이 fileForm인 태그이고
				해당 태그의 preventDefault()는 submit()이고 이걸 막으라고 하니 액션실행 안됨, 데이터 전송 안됨
				*/
			if (!(lenTF && extTF)) {
				e.preventDefault();
			}
		});
	};
</script>
</head>
<body>
	<h2>MultipartRequest를 이용한 파일 업로드</h2>
	<dl>
		<dd>- cos.jar파일 필요: <a href="http://www.servlets.com/cos">다운 받기</a></dd>
	</dl>
	<form action="11_01_fileupload01_process.jsp" method="post" enctype="multipart/form-data" name="fileForm">
		<fieldset name="fld">
			<legend>파일 업로드 폼</legend>
			<p>이 름 : <input type="text" name="name"></p>
			<p>제 목 : <input type="text" name="subject"></p>
			<div id="filesDiv">
<!-- 				<p>파 일 : <input type="file" name="filename" multiple></p>  -->
<!-- 				type="file"에서 multiple키워드가 있으면 다중선택  -->
				<p>
					파 일 : <input type="file" name="filename1"><button type="button" id="addFileBtn" onclick="addFileFnc()">버튼 추가</button>	
				</p>
			</div>
			<p><input type="submit" value="파일 올리기"></p>
		</fieldset>
	</form>
</body>
</html>