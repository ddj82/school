package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.MemberListService;
import vo.ActionForward;
import vo.Mc_users;

public class MemberListAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String search = request.getParameter("search");
		ActionForward forward = null;

		if (id == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.mc");
		} else if (!id.equals("admin")) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자가 아닙니다.');");
			out.println("location.href='./memberLogin.mc");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			MemberListService memberListService = new MemberListService();
			ArrayList<Mc_users> memberList;

			if (search == null) {
				memberList = memberListService.getMemberList();
			} else {
				memberList = memberListService.getMemberList(search);
			}
			request.setAttribute("memberList", memberList);
			forward.setPath("/users/member_list.jsp");

		}

		return forward;
	}
}