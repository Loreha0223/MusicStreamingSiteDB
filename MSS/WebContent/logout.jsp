<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("userid");
	session.removeAttribute("account");
	String url = request.getHeader("referer");
	response.sendRedirect(url);
%>
