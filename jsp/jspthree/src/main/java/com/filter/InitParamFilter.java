package com.filter;

import java.io.*;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

//@WebFilter(
//		filterName = "Filter02", 
//		urlPatterns = { "/18_01_filter02_process.jsp" }, 
//		initParams = { 
//				@WebInitParam(name = "param1", value = "admin"), 
//				@WebInitParam(name = "param2", value = "1234")
//		})
public class InitParamFilter implements Filter {
	private FilterConfig filterConfig = null;

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("Filter02 초기화...");
		this.filterConfig = fConfig;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
		System.out.println("Filter02 수행...");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String param1 = filterConfig.getInitParameter("param1");
		String param2 = filterConfig.getInitParameter("param2");
		
		String message;
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter(); // PrintWriter객체에 response.getWriter()를 주면 body에 써라는 의미
		
		if (id.equals(param1) && passwd.equals(param2)) {
			message = "로그인 성공했습니다.";
		} else {
			message = "로그인 실패했습니다.";
		}
		writer.println(message);
		filterChain.doFilter(request, response);
	}

	public void destroy() {
		System.out.println("Filter02 해제...");
		this.filterConfig = null;
	}

}
