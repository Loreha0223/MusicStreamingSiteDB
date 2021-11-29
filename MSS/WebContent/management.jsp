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
		<%!public void printResultLine(JspWriter out, Connection conn, String query) {
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
		}%>
		<div class="contentBox">
			<div class="container">
				<h1>관리자 페이지</h1>
				<%
				
					if(session.getAttribute("account") == "admin"){
						out.println("<h2>회원 목록</h2>");
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
						printResultLine(out, conn, "SELECT PlayerID, Name, Sex, Email, PhoneNumber FROM PLAYER");
						out.println("	</table>");
						out.println("</div>");
						out.println("<h2>신고된 방 처리</h2>");
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
						printResultLine(out, conn, "SELECT RoomNo, RoomName, ReportNo FROM ROOM WHERE ReportNo > 1 ORDER BY ReportNo DESC");
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
						printResultLine(out, conn, "SELECT RoomNo, RoomName, ReportNo FROM ROOM WHERE ReportNo > 1 ORDER BY ReportNo DESC");
						out.println("	</table>");
						out.println("</div>");
					}else{
						out.println("관리자 계정만 접근 가능한 페이지입니다.");
					}
				%>
				</div>
			</div>
		<%@include file="footer.jsp"%>
	</body>
</html>