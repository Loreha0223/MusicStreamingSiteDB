<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@include file="dbConnect.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<%@include file="head.jsp"%>
	<link rel="stylesheet" href="buttonStyle.css">
	<body>
		<%@include file="header.jsp"%>
		<%@include file="sideBar.jsp"%>
		<%!public void printPlayerList(JspWriter out, Connection conn) {
			String query = "SELECT PlayerID, Name, Sex, Email, PhoneNumber FROM PLAYER";
			try {
				ResultSet result;
				PreparedStatement pstmt = conn.prepareStatement(query);
				result = pstmt.executeQuery();
	
				while (result.next()) {
					out.println("<tr>");
					out.println("<td style='border-top: solid 1px black; width: 10%;'>" + result.getString(1) + "</td>");
					out.println("<td style='border-top: solid 1px black; width: 15%;'>" + result.getString(2) + "</td>");
					out.println("<td style='border-top: solid 1px black; width: 5%;'>" + result.getString(3) + "</td>");
					out.println("<td style='border-top: solid 1px black; width: 40%;'>" + result.getString(4) + "</td>");
					out.println("<td style='border-top: solid 1px black; width: 30%;'>" + result.getString(5) + "</td>");
					out.println("</tr>");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		public void printReportedRoomList(JspWriter out, Connection conn) {
			String query = "SELECT RoomNo, RoomName, RoomMasterID, ReportNo FROM ROOM R WHERE ReportNo > 1 AND NOT EXISTS (SELECT * FROM BAN WHERE RoomNo=R.RoomNo) ORDER BY ReportNo DESC";
			try {
				ResultSet result;
				PreparedStatement pstmt = conn.prepareStatement(query);
				result = pstmt.executeQuery();
	
				while (result.next()) {
					out.println("<tr>");
					out.println("<td style='border-top: solid 1px black; width: 15%;'>" + result.getString(1) + "</td>");
					out.println("<td style='border-top: solid 1px black; width: 50%;'>" + result.getString(2) + "</td>");
					out.println("<td style='border-top: solid 1px black; width: 15%;'>" + result.getString(3) + "</td>");
					out.println("<td style='border-top: solid 1px black; width: 15%;'>" + result.getString(4) + "</td>");
					out.println("<td style='border-top: solid 1px black; width: 5%;'><label><input type='checkbox' name='reportedRoom' value='" + result.getString(1) + "'></label></td>");
					out.println("</tr>");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		public void printBannedRoomList(JspWriter out, Connection conn) {
			String query = "SELECT RoomNo, RoomName, ReportNo FROM ROOM NATURAL JOIN BAN WHERE ReportNo > 1 ORDER BY ReportNo DESC";
			try {
				ResultSet result;
				PreparedStatement pstmt = conn.prepareStatement(query);
				result = pstmt.executeQuery();
	
				while (result.next()) {
					out.println("<tr>");
					out.println("<td style='border-top: solid 1px black; width: 15%;'>" + result.getString(1) + "</td>");
					out.println("<td style='border-top: solid 1px black; width: 50%;'>" + result.getString(2) + "</td>");
					out.println("<td style='border-top: solid 1px black; width: 30%;'>" + result.getString(3) + "</td>");
					out.println("<td style='border-top: solid 1px black; width: 5%;'><label><input type='checkbox' name='bannedRoom' value='" + result.getString(1) + "'></label></td>");
					out.println("</tr>");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		public void ban(Connection conn, String[] roomNo, String id){
			String query;
			PreparedStatement pstmt;
			try {
				for(int i=0; i<roomNo.length; i++){
					query = "INSERT INTO BAN VALUES ('" + id + "', '" + roomNo[i] + "')";
					pstmt = conn.prepareStatement(query);
					pstmt.executeUpdate();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		public void unban(Connection conn, String[] roomNo){
			String query;
			PreparedStatement pstmt;
			try {
				for(int i=0; i<roomNo.length; i++){
					query = "DELETE FROM BAN WHERE RoomNo='" + roomNo[i] + "'";
					pstmt = conn.prepareStatement(query);
					pstmt.executeUpdate();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		public void reportNoInitiate(Connection conn, String[] roomNo){
			String query;
			PreparedStatement pstmt;
			try {
				for(int i=0; i<roomNo.length; i++){
					query = "UPDATE ROOM SET ReportNo=0 WHERE RoomNo='" + roomNo[i] + "'";
					pstmt = conn.prepareStatement(query);
					pstmt.executeUpdate();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		%>
		<div class="contentBox">
			<div class="container">
				<h1>????????? ?????????</h1>
				<%
				
					if(session.getAttribute("account") == "admin"){
						String ctrl = request.getParameter("control");
						String[] reportedRoomNo = request.getParameterValues("reportedRoom");
						String[] bannedRoomNo = request.getParameterValues("bannedRoom");
						
						if(ctrl != null){
							if(ctrl.equals("BAN")){
								ban(conn, reportedRoomNo, session.getAttribute("userid") + "");
							}else if(ctrl.equals("Clear")){
								reportNoInitiate(conn, reportedRoomNo);
							}else if(ctrl.equals("un-Ban")){
								unban(conn, bannedRoomNo);
							}
						}
						
						out.println("<form action='management.jsp' method='POST' id='manage'>");
						out.println("<div class='section'>");
						out.println("<h2>?????? ??????</h2>");
						out.println("<input type='hidden' id='unban' name='unban' value='null'><input type='hidden' id='init' name='init' value='null'>");
						out.println("<table style='width: 60vw; background: #d2d2d2; color: #222222;'>");
						out.println("	<tr>");
						out.println("		<td style='width: 10%;'>ID</td>");
						out.println("		<td style='width: 15%;'>?????????</td>");
						out.println("		<td style='width: 5%;'>??????</td>");
						out.println("		<td style='width: 40%;'>email</td>");
						out.println("		<td style='width: 30%;'>phone</td>");
						out.println("	</tr>");
						out.println("</table>");
						out.println("<div style='width: 60vw; height: 300px; background: #d2d2d2; overflow: auto;'>");
						out.println("	<table style='width: 100%; background: #d2d2d2; color: #222222; border-callpase: callpase;'>");
						printPlayerList(out, conn);
						out.println("	</table>");
						out.println("</div>");
						out.println("</div>");
						out.println("<div class='section'>");
						out.println("<h2>????????? ??? ??????</h2>");
						out.println("<table style='width: 60vw; background: #d2d2d2; color: #222222;'>");
						out.println("	<tr>");
						out.println("		<td style='width: 15%;'>RoomNo</td>");
						out.println("		<td style='width: 50%;'>??????</td>");
						out.println("		<td style='width: 15%;'>?????????</td>");
						out.println("		<td style='width: 15%;'>????????????</td>");
						out.println("		<td style='width: 5%;'></td>");
						out.println("	</tr>");
						out.println("</table>");
						out.println("<div style='width: 60vw; height: 300px; background: #d2d2d2; overflow: auto;'>");
						out.println("	<table style='width: 100%; background: #d2d2d2; color: #222222; border-callpase: callpase;'>");
						printReportedRoomList(out, conn);
						out.println("	</table>");
						out.println("</div>");
						out.println("<input type='submit' name='control' value='BAN'>");
						out.println("<input type='submit' name='control' value='Clear'>");
						out.println("</div>");
						out.println("<div class='section'>");
						out.println("<h2>?????? ??? ??????</h2>");
						out.println("<table style='width: 60vw; background: #d2d2d2; color: #222222;'>");
						out.println("	<tr>");
						out.println("		<td style='width: 15%;'>RoomNo</td>");
						out.println("		<td style='width: 50%;'>??????</td>");
						out.println("		<td style='width: 30%;'>????????????</td>");
						out.println("		<td style='width: 5%;'></td>");
						out.println("	</tr>");
						out.println("</table>");
						out.println("<div style='width: 60vw; height: 300px; background: #d2d2d2; overflow: auto;'>");
						out.println("	<table style='width: 100%; background: #d2d2d2; color: #222222; border-callpase: callpase;'>");
						printBannedRoomList(out, conn);
						out.println("	</table>");
						out.println("</div>");
						out.println("<input type='submit' name='control' value='un-Ban'>");
						out.println("</div>");
						out.println("</form>");
					}else{
						out.println("????????? ????????? ?????? ????????? ??????????????????.");
					}
				%>
				</div>
			</div>
		<%@include file="footer.jsp"%>
	</body>
</html>