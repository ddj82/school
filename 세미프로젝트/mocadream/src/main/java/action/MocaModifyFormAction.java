package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MocaDetailService;
//import svc.MocaDetailService;
import vo.ActionForward;
import vo.Mc_rooms;

public class MocaModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
	 	ActionForward forward = new ActionForward();
		int r_no = Integer.parseInt(request.getParameter("r_no"));
		MocaDetailService mocaDetailService = new MocaDetailService();
		Mc_rooms room = mocaDetailService.getRoom(r_no);
		
	   	request.setAttribute("page", request.getParameter("page"));
	   	request.setAttribute("room", room); //7번방 vo
   		forward.setPath("/room/moca_modify.jsp");
   		
   		return forward;
	   		
	 }
	 
}