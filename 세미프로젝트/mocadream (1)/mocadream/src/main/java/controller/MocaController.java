package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MocaDeleteProAction;
//import action.MocaDetailAction;
import action.MocaListAction;
import action.MocaModifyFormAction;
import action.MocaModifyProAction;
import action.RoomInsertAction;
import vo.ActionForward;

@WebServlet("*.mc")
public class MocaController extends javax.servlet.http.HttpServlet 
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
		
		//리스트 보기
		if(command.equals("/mocaList.mc")){
			action = new MocaListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		
		// 방 추가
		} else if (command.equals("/addroom.mc")) {
			forward = new ActionForward();
			forward.setPath("/room/qna_room_insert.jsp");
		
		// 방 추가
		} else if (command.equals("/insertRoom.mc")){
			action = new RoomInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
//		else if (command.equals("/nowcheck.mc")) {
//			action = new BoardListAction();
//			try{
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		else if(command.equals("/mocaDetail.mc")){
//			action = new MocaDetailAction();
//			try{
//				forward=action.execute(request, response);
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//		}
		
		// 방 수정
		else if(command.equals("/mocaModifyForm.mc")){
			action = new MocaModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		// 방 수정
		else if(command.equals("/mocaModifyPro.mc")){
			action = new MocaModifyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/mocaDeleteForm.mc")){
			String nowPage = request.getParameter("page");
			request.setAttribute("page", nowPage);
			int r_no=Integer.parseInt(request.getParameter("r_no"));
			request.setAttribute("r_no",r_no);
			forward=new ActionForward();
			forward.setPath("/room/moca_delete.jsp");
		}
		else if(command.equals("/mocaDeletePro.mc")){
			action = new MocaDeleteProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else {
			//파일 다운로드 하기
			 try {
		            // fileName 파라미터로 파일명을 가져온다.
		            String fileName = request.getParameter("fname");

		            // 파일이 실제 업로드 되어있는(파일이 존재하는) 경로를 지정한다.
		            String filePath = "C:\\jspwork\\mocaproject\\src\\main\\webapp\\boardUpload\\";

		            // 경로와 파일명으로 파일 객체를 생성한다.
		            File dFile = new File(filePath, fileName);

		            // 파일 길이를 가져온다.
		            int fSize = (int) dFile.length();

		            // 파일이 존재
		            if (fSize > 0) {

		                // 파일명을 URLEncoder 하여 attachment, Content-Disposition Header로 설정
		                String encodedFilename = "attachment; filename*=" + "UTF-8" + "''" + URLEncoder.encode(fileName, "UTF-8");

		                // ContentType 설정 (8비트로 된 데이터라는 의미임. 1바이트 단위의 데이터들을 핸들링하는 타입을 의미함.)
		                response.setContentType("application/octet-stream; charset=utf-8");

		                // Header 설정
		                response.setHeader("Content-Disposition", encodedFilename);

		                // ContentLength 설정
		                response.setContentLengthLong(fSize);

		                BufferedInputStream in = null;
		                BufferedOutputStream out = null;

		                in = new BufferedInputStream(new FileInputStream(dFile));
		                out = new BufferedOutputStream(response.getOutputStream());

		                try {
		                    byte[] buffer = new byte[4096];
		                    int bytesRead = 0;

		                    /*
		                    모두 현재 파일 포인터 위치를 기준으로 함 (파일 포인터 앞의 내용은 없는 것처럼 작동)
		                    int read() : 1byte씩 내용을 읽어 정수로 반환
		                    int read(byte[] b) : 파일 내용을 한번에 모두 읽어서 배열에 저장
		                    int read(byte[] b. int off, int len) : 'len'길이만큼만 읽어서 배열의 'off'번째 위치부터 저장
		                    */
		                    while ((bytesRead = in .read(buffer)) != -1) {
		                        out.write(buffer, 0, bytesRead);
		                    }

		                    // 버퍼에 남은 내용이 있다면, 모두 파일에 출력
		                    out.flush();
		                } finally {
		                    /*
		                    현재 열려 in,out 스트림을 닫음
		                    메모리 누수를 방지하고 다른 곳에서 리소스 사용이 가능하게 만듬
		                    */
		                    in.close();
		                    out.close();
		                }
		            } else {
		                throw new FileNotFoundException("파일이 없습니다.");
		            }
		        } catch (Exception e) {
		            e.getMessage();
		        }
		}
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher= request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doProcess(request,response);
	}   
	
}