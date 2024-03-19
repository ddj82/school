<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>    
<%@ page import="java.util.*, java.io.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	String path = "C:\\upload";
	
	//파일 업로드를 위해 객체 생성
	DiskFileUpload upload = new DiskFileUpload();
	
	//파일최대크기 용량제한. 최대로 업로드 할 수 있는 파일의 크기를 바이트 단위로 지정(하나만 올릴땐 하나의 사이즈 제한, 여러개를 올릴땐 합친 사이즈 제한)
	upload.setSizeMax(2 * 1024 * 1024); //2MB정도 => byte * 1024 * 1024
	
	//폼페이지에서 전송된 요청 파라미터를 가져오기
	List items = upload.parseRequest(request);
	
	//요청 파라미터를 모아놓은 items배열객체를 가져오기 쉽게 iterator객체로 변환함.
	Iterator params = items.iterator();
	
	while(params.hasNext()){
		FileItem item =(FileItem) params.next();
		
		if (item.isFormField()) {
			String name = item.getFieldName();
			String value = item.getString("utf-8");
			out.print(name + " = " + value + "<br>");
		} else {
			String fileFieldName = item.getFieldName(); //해당 파일의 파라미터네임
			String fileName = item.getName(); //해당 파일 이름
			String contentType = item.getContentType(); //해당 파일 확장자
			
			fileName = fileName.substring(fileName.lastIndexOf("\\") + 1); //해당 파일의 경로 때기
			long fileSize = item.getSize(); //해당 파일 용량
			
			File file = new File(path + "/" + fileName); //해당파일의 저장경로 설정
			item.write(file); //설정한 경로대로 실행, 폴더가 없으면 생성
			
			out.println("-------------------------------------------<br>");
			out.println("요청 파라미터 이름 : " + fileFieldName + "<br>");
			out.println("저장 파일 이름 : " + fileName + "<br>");
			out.println("파일 콘텐츠 타입 : " + contentType + "<br>");
			out.println("파일 크기 : " + fileSize + "<br>");
		}
	}
	%>
</body>
</html>