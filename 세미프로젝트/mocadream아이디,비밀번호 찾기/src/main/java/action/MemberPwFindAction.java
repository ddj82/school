package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberPwFindService;

import vo.ActionForward;
import vo.Mc_users;


public class MemberPwFindAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    Mc_users member = new Mc_users();
	    member.setId(request.getParameter("id")); // setId 메서드 사용
	    member.setName(request.getParameter("name"));
	    member.setEmail(request.getParameter("email"));

	    System.out.println("MemberPwFindAction까진 왔음");

	    MemberPwFindService memberFindPwService = new MemberPwFindService();
	    Mc_users pw = memberFindPwService.findMember(member);

	    System.out.println("쿼리문 수행하고 돌아옴 ");
	    ActionForward forward = null;

	    if (pw == null) {
	        System.out.println("해당정보 없으므로 if문 타겠음");
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        forward = new ActionForward();
	        out.println("<script>");
	        out.println("alert('비밀번호 조회실패\\n 입력하신 정보를 확인해주세요.')");
	        out.println("history.back()");
	        out.println("</script>");
	        forward.setRedirect(true);
	        forward.setPath("./memberLogin.mc");
	    } else {
	        System.out.println("해당정보 있으므로 else문 타겠음");
	        // 검색 결과가 있을 경우
	        System.out.println("idFindReulst페이지에 결과 출력");
	        request.setAttribute("pw", pw); // 전체 객체를 저장
	        String pwValue = pw.getPw();
	        System.out.println(pwValue);
	        request.setAttribute("pwValue", pwValue);
	        forward = new ActionForward();
	        forward.setRedirect(false); // 리다이렉트 방식을 사용하지 않음
	        forward.setPath("/pwFindResult.mc"); // 결과 페이지로 이동
	    }
	    return forward;
	}
}