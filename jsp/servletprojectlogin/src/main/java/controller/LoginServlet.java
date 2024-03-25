package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.LoginService;
import vo.Member;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		LoginService loginService = new LoginService();
		Member loginMember = loginService.getLoginMember(id, passwd);
		//로그인에 성공되면 Member객체가 넘어오고 실패하면 null이 넘어옴
		
		if (loginMember != null) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			response.sendRedirect("index.jsp");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인실패');");
			out.println("history.back();");
			out.println("</script>");
		}
		
	}

}
