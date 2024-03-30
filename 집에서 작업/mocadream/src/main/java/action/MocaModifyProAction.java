//package action;
//
//import java.io.PrintWriter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import svc.MocaModifyProService;
//import vo.ActionForward;
//import vo.Mc_rooms;
//
//public class MocaModifyProAction implements Action {
//
//	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
//			throws Exception{
//
//		ActionForward forward = null;
//		boolean isModifySuccess = false;
//		int r_no=Integer.parseInt(request.getParameter("R_NO"));
//		Mc_rooms room=new Mc_rooms();
//		MocaModifyProService mocaModifyProService = new MocaModifyProService();
//		boolean isRightUser=mocaModifyProService.isRoomWriter(r_no, request.getParameter("MOCA_PASS"));
//
//		if(!isRightUser){
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out=response.getWriter();
//			out.println("<script>");
//			out.println("alert('수정할 권한이 없습니다.');");
//			out.println("history.back();");
//			out.println("</script>");
//		}
//		else{
//			room.setR_no(r_no);
//			room.setR_name(request.getParameter("R_NAME"));
//			room.setR_desc(request.getParameter("R_DESC")); 
//			isModifySuccess = mocaModifyProService.modifyRoom(room);
//
//			if(!isModifySuccess){
//				response.setContentType("text/html;charset=UTF-8");
//				PrintWriter out=response.getWriter();
//				out.println("<script>");
//				out.println("alert('수정실패');");
//				out.println("history.back()");
//				out.println("</script>");
//			}
//
//			else{
//				forward = new ActionForward();
//				forward.setRedirect(true);
//				forward.setPath("mocaList.bo?r_no="+room.getR_no()+"&page="+request.getParameter("page")); 
//			}
//
//		}
//
//		return forward;
//	}
//
//}


package action;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.MocaModifyProService;
import vo.ActionForward;
import vo.Mc_rooms;
import vo.PageInfo;

public class MocaModifyProAction implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = null;
        Mc_rooms room = null;
        String realFolder = "";
        String saveFolder = "/roomUpload";
        int fileSize = 5 * 1024 * 1024;
//        realFolder = "C:/jspwork/mocadream/src/main/webapp" + saveFolder;
        realFolder = "C:/Users/KDJ/IdeaProjects/eclipsejava/mocadream/src/main/webapp" + saveFolder;
        File f = new File(realFolder);
        
        if (!f.exists()) {
        	f.mkdirs();
        }
        
        MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
        int r_no = Integer.parseInt(multi.getParameter("R_NO"));
        
        room = new Mc_rooms();

    	room.setR_no(r_no);
		room.setR_name(multi.getParameter("R_NAME"));
		room.setR_max(Integer.parseInt(multi.getParameter("R_MAX")));
		room.setR_desc(multi.getParameter("R_DESC"));
		room.setR_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		
		MocaModifyProService mocaModifyProService = new MocaModifyProService();
		boolean isModifySuccess = mocaModifyProService.modifyRoom(room);

        if (!isModifySuccess) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('수정실패');");
            out.println("history.back()");
            out.println("</script>");
        } else {
            forward = new ActionForward();
//            forward.setRedirect(true);
            forward.setPath("mocaList.mc");
        }

        return forward;
    }

}


