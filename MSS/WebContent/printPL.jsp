<%-- <%@include file="dbConnect.jsp"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String userid = (String)session.getAttribute("userid");
	String listno = request.getParameter("listno");
	
	ResultSet rs = null;
	String sql = "SELECT M.MusicID, S.SName, M.MusicTitle, G.Genre FROM MUSIC M, PLAYER P, PLAYLIST PL, MUSICLIST ML, GENRE G, SONG SO, SINGER S WHERE P.PlayerID = '" + userid + "' AND P.PlayerID = PL.PlayerID AND ML.ListNo = '" + listno + "' AND ML.MusicID = M.MusicID AND M.GenreID = G.GenreID AND SO.MusicId = M.MusicID AND SO.SingerID = S.SingerID";
	rs = stmt.executeQuery(sql);
	out.println("<ul>");
	while(rs.next()){
		out.println("<li>"+rs.getString(3)+"</li>");
	} 
	rs.close();
	out.println("<ul>");
%>