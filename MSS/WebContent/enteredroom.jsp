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
					String query = "SELECT ROOMNAME, PARTICIPANTSNO FROM ROOM WHERE ROOMNO = 'tc37n'";
					System.out.println(query);
					PreparedStatement pstmt = conn.prepareStatement(query);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()){
						String RoomName = rs.getString(1);
						out.println("<h1>" + RoomName +"</h1>");
						out.println("<h5><h3 style='display: inline;'>"+ rs.getInt(2) + "</h3>명 참가중</h5>");
					}
					out.println("<p/><h2>방의 플레이리스트</h2>");
					query ="SELECT H.ORDERNO, M.MUSICTITLE, S.SNAME, M.LIKES FROM HAS H, MUSIC M, SINGER S, RELEASEMENT R WHERE H.ROOMNO='tc37n' AND H.MUSICID = M.MUSICID AND M.ALBUMID = R.ALBUMID AND R.SINGERID = S.SINGERID";		
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
						out.println("<td>" + rs.getInt(1) + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.println("<td>" + rs.getInt(4) + "</td>");
						out.println("</tr>");
					}
					out.println("</table>");
				%>
				<button class="addMusic" onclick="location.href='selectsonginroom.jsp'"type="button">노래추가</button>
				<%
					query = "SELECT P.NAME, P.MEMBERSHIP, P.SEX FROM PLAYER P WHERE P.ROOMNO='tc37n' ORDER BY P.MEMBERSHIP DESC";
					System.out.println(query);
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					out.println("<h2>방 참가자</h2>");
					out.println("<table border=\"1\">");
					rsmd = rs.getMetaData();
					cnt = rsmd.getColumnCount();
					for(int i = 1; i <= cnt; i++){
						out.println("<th>" + rsmd.getColumnName(i) + "</th>");
					}
					while(rs.next()){
						out.println("<tr>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.println("</tr>");
					}
					out.println("</table>");
				%>
				
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>
</html>