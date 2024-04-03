package controller;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.LogManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.LoginService;
import vo.Mc_users;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		LoginService loginService = new LoginService();
		Mc_users loginMember = loginService.getLoginMember(id, pw);
		// 로그인이 성공되면 Member객체가 넘어오고 실패하면 null이 넘어옴
		/*
		 * if (loginMember == null || id != loginMember.getId() || pw !=
		 * loginMember.getPw()) { response.setContentType("text/html; charset=UTF-8");
		 * PrintWriter out = response.getWriter(); out.println("<script>");
		 * out.println("alert('로그인실패');"); out.println("history.back();");
		 * out.println("</script>");
		 * 
		 * } else { HttpSession session = request.getSession();
		 * session.setAttribute("id", id); response.sendRedirect("index.jsp"); }
		 */
		if(loginMember != null) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			response.sendRedirect("main.jsp");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인실패');");
			out.println("history.back();");
			out.println("</script>");
		}
		

	}

}
