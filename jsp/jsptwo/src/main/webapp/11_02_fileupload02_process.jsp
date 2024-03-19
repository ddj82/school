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
// 	현재 파일 위치의 상대경로 지정가능
// 	String savePath = application.getRealPath("파일을 저장할 폴더");
// 	예시: String savePath = application.getContextPath("\product");
	String fileUploadPath = "C:\\uploadts";
	
	//파일 업로드를 위해 객체 생성
	DiskFileUpload upload = new DiskFileUpload();
	
	//폼페이지에서 전송된 요청 파라미터를 가져오기
	List items = upload.parseRequest(request);
	
	//요청 파라미터를 모아놓은 items배열객체를 가져오기 쉽게 iterator객체로 변환함.
	Iterator params = items.iterator();
	
	while(params.hasNext()){
		FileItem fileItem =(FileItem) params.next();
		if (fileItem.isFormField()) {
			//필드 이름
			String name = fileItem.getFieldName();
			//필드 값, 한글 인코딩
			String value = new String((fileItem.getString()).getBytes("8859_1"), "utf-8");
			out.print(name + ": " + value + "<br>");
		} else {
			String fileName = fileItem.getName();
			out.print("originfileName: " + fileName + "<br>");
			fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
			File file = new File(fileUploadPath + "/" + fileName);
			String orginName = fileName;
			
			//동일한 파일명이 존재하는 경우 파일명 변경하기
			if (file.exists()) {
				Timestamp ts = new Timestamp(System.currentTimeMillis());
				long tsl = ts.getTime();
				fileName = tsl + fileName.substring(fileName.lastIndexOf("."));
				file = new File(fileUploadPath + "/" + fileName);
			}
			
// 			if(file.exists()){
// 				file.mkdirs();
// 			}
			out.print("newfileName : " + fileName + "<br>");
			out.print("경로: "+fileUploadPath + "/" + fileName);
			
			//파일이 실제로 업로드 되는 시점
			fileItem.write(file);
		}
	}
	%>
</body>
</html>