<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
	<%@include file="head.jsp"%>
	<body>
		<%@include file="header.jsp"%>
		<%@include file="sideBar.jsp"%>
		<div class="contentBox">
			<div class="container">
				<%
					//String query = "SELECT ROOMNAME, PARTICIPANTSNO FROM ROOM WHERE ROOMNO = '"+ request.getParameter("RoomNo") +"'";
					String query = "SELECT NAME FROM PLAYER WHERE PLAYERID = 'b4f81'";
					System.out.println(query);
					PreparedStatement pstmt = conn.prepareStatement(query);
					ResultSet rs = pstmt.executeQuery();
		
					while(rs.next()){
						out.println(rs.getString(1)+"의 플레이리스트");
					}
		
					query = "SELECT P.NAME, COUNT(M.LISTNO) AS 곡수 FROM PLAYLIST P, MUSICLIST M WHERE P.PLAYERID = 'b4f81' AND M.LISTNO = P.LISTNO GROUP BY M.LISTNO, P.NAME";
					System.out.println(query);
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					out.println("<table border=\"1\">");
					ResultSetMetaData rsmd = rs.getMetaData();
					int cnt = rsmd.getColumnCount();
					for(int i = 1; i <= cnt; i++){
						out.println("<th>" + rsmd.getColumnName(i) + "</th>");
					}
					while(rs.next()){
						out.println("<tr>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td>" + rs.getInt(2) + "</td>");
						out.println("</tr>");
					}
					out.println("</table>");
		
				%>
			</div>
		</div>
	<%@include file="footer.jsp"%>
	</body>
</html>