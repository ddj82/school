package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		session.invalidate();
		
		// HTTP 1.0.
		response.setHeader("Pragma","no-cache");
		// Proxy : Client와 Server 사이에 위치하여 요청을 중계하는 역할을 하는 서버
		response.setHeader("Expires","0");
		// HTTP 1.1.
		response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");

		
		response.sendRedirect("main.jsp");
	
	}
}
