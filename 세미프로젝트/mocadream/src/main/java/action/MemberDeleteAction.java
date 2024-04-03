package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberDeleteService;
import vo.ActionForward;
import vo.Mc_users;

public class MemberDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println("세션아이디 : " + id);
		MemberDeleteService selectMypageService = new MemberDeleteService();
		Mc_users myPage = selectMypageService.deleteMember(id);

		ActionForward forward = new ActionForward();
		request.setAttribute("myPage", myPage);
		forward.setPath("/users/delete_commit.jsp");
		
		session = request.getSession(false);
		session.invalidate();
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires","0");
		response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");

		return forward;

	}
}