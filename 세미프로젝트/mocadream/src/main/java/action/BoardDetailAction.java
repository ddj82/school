package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardDetailService;
import vo.ActionForward;
import vo.Mc_notice;

public class BoardDetailAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int nt_no = Integer.parseInt(request.getParameter("nt_no"));
		String page = request.getParameter("page");
		BoardDetailService boardDetailService = new BoardDetailService();
		Mc_notice article = boardDetailService.getArticle(nt_no);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
		request.setAttribute("article", article);
		forward.setPath("/board/qna_board_view.jsp");
		return forward;

	}

}