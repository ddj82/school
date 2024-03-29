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
		ActionForward forward = null;

		if (id == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.mc");
		} else if (!id.equals("admin")) {
			PrintWriter out = response.getWriter();
			System.out.println("흐름확인1");
			out.println("<script>");
			out.println("alert('관리자가 아닙니다.');");
			out.println("location.href='./memberLogin.mc");
			out.println("</script>");
			System.out.println("흐름확인2");
		} else {
			forward = new ActionForward();
			MemberListService memberListService = new MemberListService();
			ArrayList<Mc_users> memberList = memberListService.getMemberList();
			request.setAttribute("memberList", memberList);
			forward.setPath("/users/member_list.jsp");
		}

		return forward;
	}
}