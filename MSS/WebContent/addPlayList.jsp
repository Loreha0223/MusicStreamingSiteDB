<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@include file="dbConnect.jsp"%>
<%
	String query = "SELECT ListNo FROM PLAYLIST ORDER BY ListNo DESC";
	ResultSet result = stmt.executeQuery(query);
	result.next();
	int currentListNo = Integer.parseInt(result.getString(1).substring(2));
	query = "INSERT INTO PLAYLIST VALUES ('" + session.getAttribute("userid") + "', 'PL" + (currentListNo + 1) + "', 'Untitled')";
	stmt.executeUpdate(query);
	response.sendRedirect("playlist.jsp?playListNo="+ "PL" + (currentListNo + 1));
%>