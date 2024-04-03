package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.RoomListService;
import vo.ActionForward;
import vo.Mc_rooms;

public class RoomListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		 	HttpSession session=request.getSession();
//	   		String id=(String)session.getAttribute("id");
		ActionForward forward = null;

//	   		if(id==null){
//	   			forward = new ActionForward();
//				forward.setRedirect(true);
//				forward.setPath("./memberLogin.me"); 로그인 페이지로 이동하기 
//	   		} else {
		// 로그인 안하고 예약하기 클릭 시 로그인 페이지로 이동하게 해야함

		forward = new ActionForward();
		RoomListService roomListService = new RoomListService();
		ArrayList<Mc_rooms> mc_rooms = roomListService.getRoomsList();
		request.setAttribute("mc_rooms", mc_rooms);
		forward.setRedirect(false);
		forward.setPath("/users/user_OrderForm.jsp");
//	   		}
		return forward;
	}
}