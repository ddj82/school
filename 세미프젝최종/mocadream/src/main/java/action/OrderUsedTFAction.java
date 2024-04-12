package action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.OrderUsedTFService;
import vo.ActionForward;

public class OrderUsedTFAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ActionForward forward = null;
		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String command = RequestURI.substring(RequestURI.lastIndexOf("/"));

		String r_no = request.getParameter("r_no");
		String r_cal = request.getParameter("r_cal");
		String r_statime = request.getParameter("r_statime");
		String r_used = request.getParameter("r_used");
		String r_uname = request.getParameter("r_uname");
		
		SimpleDateFormat ddd = new SimpleDateFormat("yyyy-MM-ddHH");
		Date now = new Date();
		String now1 = ddd.format(now);
		String orderD = "";
		
		if (r_statime.equals("9")) {
			orderD = r_cal + "0" + r_statime;
		} else {
			orderD = r_cal + r_statime;
		}
		
		orderD = orderD.replaceAll("-", "");
		now1 = now1.replaceAll("-", "");
		
		
		if (command.equals("/OrderUsedT.mc")) {
			if (r_used.equals("입실")) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('이미 처리되었습니다.');");
				out.println("history.back()");
				out.println("</script>");
			} else if (r_used.equals("입실전")) {
				if (Integer.parseInt(orderD) > Integer.parseInt(now1)) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('입실 처리가 불가한 시간입니다.');");
					out.println("history.back()");
					out.println("</script>");
				} else {
					OrderUsedTFService orderUsedTFService = new OrderUsedTFService();
					boolean orderUsedResult = orderUsedTFService.orderUsedTservice(r_no, r_cal, r_statime);
					if (orderUsedResult) {
						response.setContentType("text/html;charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>");
						out.println("alert('입실 처리가 완료되었습니다.');");
						out.println("history.back()");
						out.println("</script>");
					} else {
						response.setContentType("text/html;charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>");
						out.println("alert('입실 처리에 실패하였습니다.');");
						out.println("history.back()");
						out.println("</script>");
					}
				}
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('취소 또는 미사용 처리 된 내역입니다.');");
				out.println("history.back()");
				out.println("</script>");
			}
		} else if (command.equals("/OrderUsedF.mc")) {
			if (r_used.equals("미사용")) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('이미 처리되었습니다.');");
				out.println("history.back()");
				out.println("</script>");
			} else if (r_used.equals("입실전")) {
				if (Integer.parseInt(orderD) > Integer.parseInt(now1)) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('미사용 처리가 불가한 시간입니다.');");
					out.println("history.back()");
					out.println("</script>");
				} else {
					OrderUsedTFService orderUsedTFService = new OrderUsedTFService();
					boolean orderUsedResult = orderUsedTFService.orderUsedFservice(r_uname, r_no, r_cal, r_statime);
					if (orderUsedResult) {
						response.setContentType("text/html;charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>");
						out.println("alert('미사용 처리가 되었습니다.');");
						out.println("history.back()");
						out.println("</script>");
					} else {
						response.setContentType("text/html;charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.println("<script>");
						out.println("alert('처리에 실패하였습니다.');");
						out.println("history.back()");
						out.println("</script>");
					}
				}
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('취소 또는 입실 처리 된 내역입니다.');");
				out.println("history.back()");
				out.println("</script>");
			} 
		}
		
		return forward;
	}

}
