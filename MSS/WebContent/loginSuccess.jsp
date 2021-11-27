<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	
	if(userid != null && userid.equals(password)){
		session.setAttribute("userid", userid);
	}
	
	response.sendRedirect("index.jsp");
%>