package action;

import static util.JdbcUtil.*;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MocaDAO;
import svc.RoomListService;
import vo.ActionForward;
import vo.Mc_rooms;
import vo.Mc_users;

public class SelectYesTimeAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		String rname = request.getParameter("r_name");
		String rcal = request.getParameter("r_cal");
		String runame = request.getParameter("r_uname");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(rcal);

		ArrayList<Integer> noTimeList = mocaDAO.selectYesTime(rname, date);
		
		//영미 추가
		RoomListService roomListService = new RoomListService();
		ArrayList<Mc_rooms> mc_rooms = roomListService.getRoomsList();
		request.setAttribute("mc_rooms", mc_rooms);
		//영미 추가 끝
		
		request.setAttribute("noTimeList", noTimeList);
		request.setAttribute("r_name", rname);
		request.setAttribute("r_cal", rcal);
		request.setAttribute("r_uname", runame);
		ActionForward forward = new ActionForward();
		forward.setPath("/users/user_OrderForm.jsp");

		return forward;

	}

}