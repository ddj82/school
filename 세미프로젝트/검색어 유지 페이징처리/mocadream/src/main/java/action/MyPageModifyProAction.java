package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MyPageModifyProService;
import vo.ActionForward;
import vo.Mc_users;

public class MyPageModifyProAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pw = request.getParameter("pw"); // 수정할 비밀번호 추가
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");

		// 회원 객체 생성 및 정보 설정
		Mc_users member = new Mc_users();
		member.setId(id);
		member.setPw(pw); // 수정할 비밀번호 설정
		member.setName(name);
		member.setTel(tel);
		member.setEmail(email);
		member.setAddr(addr);

		// 회원 정보 수정 서비스 호출하여 회원 정보 업데이트
		MyPageModifyProService memberModifyService = new MyPageModifyProService();
		boolean isSuccess = memberModifyService.updateMember(member);

		ActionForward forward = new ActionForward();
		if (isSuccess) {
			// 회원 정보 업데이트 성공 시 메인 페이지로 리다이렉트
			forward.setPath("main.jsp");
		} else {
			// 회원 정보 업데이트 실패 시 에러 페이지로 리다이렉트
			try {
				System.out.println("에러 : ");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return forward;
	}
}
