//package filter;
//
//import java.io.IOException;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//@WebFilter(
//		urlPatterns = { 
//				"*.jsp", 
//				"*.html", 
//				"*.mc"
//		}, 
//		servletNames = { "MocaController", "LoginServlet" })
//public class logFilter extends HttpFilter implements Filter {
//
//	public void init(FilterConfig fConfig) throws ServletException {
//		System.out.println("logFilter 초기화...");
//	}
//
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//		System.out.println("logFilter 실행...");
//		
//		HttpServletRequest httpRequest = (HttpServletRequest) request;
//		HttpSession session = httpRequest.getSession();
//		request.setCharacterEncoding("UTF-8");
//		String RequestURI = httpRequest.getRequestURI();
//		String contextPath = httpRequest.getContextPath();
//		String command = RequestURI.substring(contextPath.length());
//		
//		if (session.getAttribute("id") == null) {
//			if (command.equals("/boardList.mc")) {
//				System.out.println("1");
//				chain.doFilter(request, response);
//			} else if (command.contains("joinForm")) {
//				System.out.println("2");
//				chain.doFilter(request, response);
//			} else if (command.contains("loginForm")) {
//				System.out.println("3");
//				chain.doFilter(request, response);
//			} else if (command.contains("FindForm")) {
//				System.out.println("4");
//				chain.doFilter(request, response);
//			} else if (command.contains("FindResult")) {
//				System.out.println("5");
//				chain.doFilter(request, response);
//			} else {
//				System.out.println("필터 else문...");
//				RequestDispatcher dispatcher = request.getRequestDispatcher("/main.jsp");
//				dispatcher.forward(request, response);
//			}
//		} else {
//			System.out.println("세션id있음");
//			chain.doFilter(request, response);
//		}
//	}
//
//	public void destroy() {
//		System.out.println("logFilter 해제...");
//	}
//
//}
