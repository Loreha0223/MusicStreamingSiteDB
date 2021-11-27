<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("userid");
	String url = request.getHeader("referer");
	response.sendRedirect(url);
%>
