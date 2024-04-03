package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import action.MemberIdFindAction;
import action.MemberJoinAction;
import action.MemberPwFindAction;
import vo.ActionForward;

@WebServlet("*.mc")
public class MemberFrontController extends javax.servlet.http.HttpServlet {
	static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String RequestURI = request.getRequestURI(); // "/servletprojectmember/memberLoginAction.me"
		String contextPath = request.getContextPath();// "/servletprojectmember"
		String command = RequestURI.substring(contextPath.length()); // 21번 인덱스부터 끝까지 "/memberLoginAction.me"
		ActionForward forward = null;
		Action action = null;

		
		
		if (command.equals("/memberLogin.mc")) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./loginForm.html");
			
		} else if (command.equals("/memberJoin.mc")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./joinForm.jsp");
			
		} else if (command.equals("/idFindForm.mc")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./idFindForm.jsp");
		
		} else if (command.equals("/idFindResult.mc")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./idFindResult.jsp");
			
		} else if (command.equals("/pwFindForm.mc")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./pwFindForm.jsp");
		
		} else if (command.equals("/pwFindResult.mc")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./pwFindResult.jsp");

		} else if (command.equals("/memberJoinAction.mc")) {
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if (command.equals("/memberFindIdAction.mc")) {
			action = new MemberIdFindAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (command.equals("/memberPwFindAction.mc")) {
				System.out.println("pwfind 컨트롤러까지 도착");
				action = new MemberPwFindAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			

		}
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doProcess(request, response);
	}
}