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
import vo.ActionForward;
import vo.Mc_users;

public class SelectYesTimeAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		String rname = request.getParameter("r_name");
		String rcal = request.getParameter("r_cal");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(rcal);

		ArrayList<Integer> noTimeList = mocaDAO.selectYesTime(rname, date);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("다시 유저_오더폼.jsp실행하는데 쿼리스트링으로 인티저리스트 보내기 내일 학원에서");

		return forward;

	}

}