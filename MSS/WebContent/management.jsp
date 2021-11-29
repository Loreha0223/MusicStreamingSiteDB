<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*"%>

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
					for(int i=1; i<=result.getMetaData().getColumnCount(); i++)
						out.println("<td style='border-top: solid 1px black;'>" + result.getString(i) + "</td>");
					out.println("</tr>");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		public void printReportedRoomList(JspWriter out, Connection conn) {
			String query = "SELECT RoomNo, RoomName, RoomMasterID ReportNo FROM ROOM R WHERE ReportNo > 1 AND NOT EXISTS (SELECT * FROM BAN WHERE RoomNo=R.RoomNo) ORDER BY ReportNo DESC";
			try {
				ResultSet result;
				PreparedStatement pstmt = conn.prepareStatement(query);
				result = pstmt.executeQuery();
	
				while (result.next()) {
					out.println("<tr>");
					for(int i=1; i<=result.getMetaData().getColumnCount(); i++)
						out.println("<td style='border-top: solid 1px black;'>" + result.getString(i) + "</td>");
					out.println("<td style='border-top: solid 1px black;'><a href='#' onclick=\"banButton('" + result.getString(1) + "')\"><div class='banButton'>BAN</div></a></td>");
					out.println("<td style='border-top: solid 1px black;'><a href='#' onclick=\"initButton('" + result.getString(1) + "')\"><div class='banButton'>신고 횟수 초기화</div></a></td>");
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
					for(int i=1; i<=result.getMetaData().getColumnCount(); i++)
						out.println("<td style='border-top: solid 1px black;'>" + result.getString(i) + "</td>");
					out.println("<td style='border-top: solid 1px black;'><a href='#' onclick=\"unbanButton('" + result.getString(1) + "')\"><div class='banButton'>BAN 풀기</div></a></td>");
					out.println("</tr>");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		public void ban(Connection conn, String roomNo, String id){
			String query = "INSERT INTO BAN VALUES ('" + id + "', '" + roomNo + "')";
			try {
				PreparedStatement pstmt = conn.prepareStatement(query);
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		public void unban(Connection conn, String roomNo){
			String query = "DELETE FROM BAN WHERE RoomNo='" + roomNo + "'";
			try {
				PreparedStatement pstmt = conn.prepareStatement(query);
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		public void reportNoInitiate(Connection conn, String roomNo){
			String query = "UPDATE ROOM SET ReportNo=0 WHERE RoomNo='" + roomNo + "'";
			try {
				PreparedStatement pstmt = conn.prepareStatement(query);
				pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		%>
		<div class="contentBox">
			<div class="container">
				<h1>관리자 페이지</h1>
				<%
				
					if(session.getAttribute("account") == "admin"){
						String roomNo = request.getParameter("ban");
						String roomNoToUnban = request.getParameter("unban");
						String roomNoToInit = request.getParameter("init");
						
						if(roomNo != null && !roomNo.equals("null")){
							ban(conn, roomNo + "", session.getAttribute("userid") + "");
						}else if(roomNoToUnban != null && !roomNoToUnban.equals("null")){
							unban(conn, roomNoToUnban + "");
						}else if(roomNoToInit != null && !roomNoToInit.equals("null")){
							reportNoInitiate(conn, roomNoToInit + "");
						}
						
						out.println("<h2>회원 목록</h2>");
						out.println("<form action='management.jsp' method='POST' id='manage'>");
						out.println("<input type='hidden' id='ban' name='ban' value='null'><input type='hidden' id='unban' name='unban' value='null'><input type='hidden' id='init' name='init' value='null'>");
						out.println("<table style='width: 60vw; background: #d2d2d2; color: #222222;'>");
						out.println("	<tr>");
						out.println("		<td>ID</td>");
						out.println("		<td>닉네임</td>");
						out.println("		<td>성별</td>");
						out.println("		<td>email</td>");
						out.println("		<td>phone</td>");
						out.println("	</tr>");
						out.println("</table>");
						out.println("<div style='width: 60vw; height: 300px; background: #d2d2d2; overflow: auto;'>");
						out.println("	<table style='width: 100%; background: #d2d2d2; color: #222222; border-callpase: callpase;'>");
						printPlayerList(out, conn);
						out.println("	</table>");
						out.println("</div>");
						out.println("<h2>신고된 방 처리</h2>");
						out.println("<table style='width: 60vw; background: #d2d2d2; color: #222222;'>");
						out.println("	<tr>");
						out.println("		<td>RoomNo</td>");
						out.println("		<td>제목</td>");
						out.println("		<td>개설자</td>");
						out.println("		<td>신고횟수</td>");
						out.println("		<td>BAN</td>");
						out.println("	</tr>");
						out.println("</table>");
						out.println("<div style='width: 60vw; height: 300px; background: #d2d2d2; overflow: auto;'>");
						out.println("	<table style='width: 100%; background: #d2d2d2; color: #222222; border-callpase: callpase;'>");
						printReportedRoomList(out, conn);
						out.println("	</table>");
						out.println("</div>");
						out.println("<h2>밴한 방 관리</h2>");
						out.println("<table style='width: 60vw; background: #d2d2d2; color: #222222;'>");
						out.println("	<tr>");
						out.println("		<td>RoomNo</td>");
						out.println("		<td>제목</td>");
						out.println("		<td>개설자</td>");
						out.println("		<td>신고횟수</td>");
						out.println("	</tr>");
						out.println("</table>");
						out.println("<div style='width: 60vw; height: 300px; background: #d2d2d2; overflow: auto;'>");
						out.println("	<table style='width: 100%; background: #d2d2d2; color: #222222; border-callpase: callpase;'>");
						printBannedRoomList(out, conn);
						out.println("	</table>");
						out.println("</div></form>");
					}else{
						out.println("관리자 계정만 접근 가능한 페이지입니다.");
					}
				%>
				</div>
			</div>
		<%@include file="footer.jsp"%>
	</body>
</html>