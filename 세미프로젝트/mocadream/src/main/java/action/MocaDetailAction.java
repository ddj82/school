package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.MocaDetailService;
import vo.ActionForward;
import vo.Mc_rooms;

 public class MocaDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int r_no = Integer.parseInt(request.getParameter("r_no"));
		String page = request.getParameter("page");
		MocaDetailService roomDetailService = new MocaDetailService();
		Mc_rooms room = roomDetailService.getRoom(r_no);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("room", room);
   		forward.setPath("/moca_view.jsp");
   		
   		return forward;

	 }
	 
}