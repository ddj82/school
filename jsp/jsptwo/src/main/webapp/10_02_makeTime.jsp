<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%
	Calendar cal = Calendar.getInstance();
	request.setAttribute("time", cal);
%>
<%-- <% response.sendRedirect("10_02_viewTime.jsp"); %> --%>
<jsp:forward page="10_02_viewTime.jsp"></jsp:forward>