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
					String query = "SELECT ROOMNO, ROOMNAME, PARTICIPANTSNO, IS_ADULT, REPORTNO FROM ROOM WHERE ROOMTYPE='g' ORDER BY PARTICIPANTSNO DESC";
					System.out.println(query);
					PreparedStatement pstmt = conn.prepareStatement(query);
					ResultSet rs = pstmt.executeQuery();
					out.println("<h2>장르방 목록</h2>");
					out.println("<table border=\"1\">");
					ResultSetMetaData rsmd = rs.getMetaData();
					int cnt = rsmd.getColumnCount();
					out.println("<th>ENTER</th>");
					for(int i = 1; i <= cnt; i++){
						out.println("<th>" + rsmd.getColumnName(i) + "</th>");
					}
					while(rs.next()){
						out.println("<tr>");
						out.println("<td><input type=\"radio\" name =\"selectRoom\" value = \""+rs.getString(1)+"\"></td>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getInt(3) + "</td>");
						out.println("<td>" + rs.getString(4) + "</td>");
						out.println("<td>" + rs.getInt(5) + "</td>");
						out.println("</tr>");
					}
					out.println("</table>");
				%>
					<button class="goingGenre" onclick="location.href='enteredroom.jsp'"type="button">입장하기</button>
				<%
					query = "SELECT ROOMNO, ROOMNAME, PARTICIPANTSNO, IS_ADULT, REPORTNO FROM ROOM "
							+"MINUS "
							+"SELECT ROOMNO, ROOMNAME, PARTICIPANTSNO, IS_ADULT, REPORTNO FROM ROOM WHERE ROOMTYPE = 'g' ORDER BY PARTICIPANTSNO DESC";
					System.out.println(query);
					pstmt = conn.prepareStatement(query);
					rs = pstmt.executeQuery();
					out.println("<h2>일반방 목록</h2>");
					out.println("<table border=\"1\">");
					rsmd = rs.getMetaData();
					cnt = rsmd.getColumnCount();
					out.println("<th>ENTER</th>");
					for(int i = 1; i <= cnt; i++){
						out.println("<th>" + rsmd.getColumnName(i) + "</th>");
					}
					while(rs.next()){
						out.println("<tr>");
						out.println("<td><input type=\"radio\" name =\"selectRoom\" value = \""+rs.getString(1)+"\"></td>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getInt(3) + "</td>");
						out.println("<td>" + rs.getString(4) + "</td>");
						out.println("<td>" + rs.getInt(5) + "</td>");
						out.println("</tr>");
					}
					out.println("</table>");
				%>
				<button class="goingNormal" onclick="location.href='enteredroom.jsp'"type="button">입장하기</button>

			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>
</html>