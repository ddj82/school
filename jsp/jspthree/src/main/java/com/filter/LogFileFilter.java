package com.filter;

import java.io.*;
import java.text.*;
import java.util.*;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

//@WebFilter(
//		filterName = "Filter02_2", 
//		urlPatterns = { "/18_01_filter02_process.jsp" }, 
//		initParams = { 
//				@WebInitParam(name = "filename", value = "monitor.log"), 
//		})
public class LogFileFilter implements Filter {
	PrintWriter writer;
	
	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.S");
		Calendar calendar = Calendar.getInstance(); // 현재시간의 전반적인 정보를 가져와라, Calendar는 객체생성이 안되기 때문에 스태틱메소드를 호출해서 만듬
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("Filter02_2 초기화...");
		String realpath = "C:\\log\\";
		File f = new File(realpath);
		if (!f.exists()) {
			f.mkdir();
		}
		String filename = fConfig.getInitParameter("filename");
		if (filename == null) {
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		}
		try {
			writer = new PrintWriter(new FileWriter(realpath + filename, true), true);
		} catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("Filter02_2 doFilter()...");
		writer.printf("현재일시 : %s %n", getCurrentTime());
		String clientAddr = request.getRemoteAddr();
//		request.getRemoteAddr() =>  IPv6를 발급 (IPv4(127.0.0.1)) 
		writer.printf("클라이언트 주소 : %s %n", clientAddr);
		
		chain.doFilter(request, response);
		
		writer.printf("현재일시 : %s %n", getCurrentTime());
		String contentType = response.getContentType();
		writer.printf("문서의 콘텐츠 유형 : %s %n", contentType);
		writer.println("----------------------------------------------------");
	}

	public void destroy() {
		System.out.println("Filter02_2 해제...");
		writer.println("destroy()메소드 호출. 강제 해제");
		writer.close();
	}

}
