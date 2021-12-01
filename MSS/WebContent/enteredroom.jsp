<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@include file="dbConnect.jsp"%>

<!DOCTYPE html>
<html lang="en">
	<%@include file="head.jsp"%>
	<body>
	<script type="text/javascript">
		function openSearchWindow(){
			var searchWin = window.open("selectsonginroom.jsp", "Select Music", "width=570, height=350, resizable = no, scrollbars = no");
		}
		
		function addMusicToList(musicID){
			location.replace("enteredroom.jsp?no=<%=request.getParameter("no")%>&addMusic=" + musicID);
		}
	</script>
	<%
	String roomNo = request.getParameter("no");
	String addMusic = request.getParameter("addMusic");
	String query;
	PreparedStatement pstmt;
	ResultSet result;
	if(addMusic != null){
		query = "SELECT COUNT(*) FROM HAS WHERE RoomNo='" + roomNo + "'";
		pstmt = conn.prepareStatement(query);
		result = pstmt.executeQuery();
		result.next();
		query = "INSERT INTO HAS VALUES('" + roomNo + "', '" + addMusic + "', " + result.getInt(1) + 1 + ")";
		pstmt = conn.prepareStatement(query);
		pstmt.executeUpdate();
	}
	if(session.getAttribute("enteredRoom") != roomNo){
		if(session.getAttribute("enteredRoom") != null){
			query = "UPDATE PLAYER SET RoomNo='' WHERE PlayerID='" + session.getAttribute("userid") + "'";
			pstmt = conn.prepareStatement(query);
			pstmt.executeUpdate();
			query = "UPDATE ROOM SET ParticipantsNo=ParticipantsNo-1 WHERE RoomNo='" + session.getAttribute("enteredRoom") + "'";
			pstmt = conn.prepareStatement(query);
			pstmt.executeUpdate();
		}
		query = "UPDATE PLAYER SET RoomNo='" + roomNo + "' WHERE PlayerID='" + session.getAttribute("userid") + "'";
		pstmt = conn.prepareStatement(query);
		System.out.println(query);
		pstmt.executeUpdate();
		query = "UPDATE ROOM SET ParticipantsNo=ParticipantsNo+1 WHERE RoomNo='" + roomNo + "'";
		pstmt = conn.prepareStatement(query);
		pstmt.executeUpdate();
		session.setAttribute("enteredRoom", roomNo);
	}
	%>
		<%@include file="header.jsp"%>
		<%@include file="sideBar.jsp"%>
		<div class="contentBox">
			<div class="container">
				<%
					query = "SELECT ROOMNAME, PARTICIPANTSNO FROM ROOM WHERE ROOMNO = '" + roomNo + "'";
					pstmt = conn.prepareStatement(query);
					result = pstmt.executeQuery();
					while(result.next()){
						String RoomName = result.getString(1);
						out.println("<h1>" + RoomName +"</h1>");
						out.println("<h5><h3 style='display: inline;'>"+ result.getInt(2) + "</h3>명 참가중</h5>");
					}
					out.println("<p/><h2>방의 플레이리스트</h2>");
					query ="SELECT H.ORDERNO, M.MUSICTITLE, S.SNAME, M.LIKES FROM HAS H, MUSIC M, SINGER S, RELEASEMENT R WHERE H.ROOMNO='" + roomNo + "' AND H.MUSICID = M.MUSICID AND M.ALBUMID = R.ALBUMID AND R.SINGERID = S.SINGERID";		
					pstmt = conn.prepareStatement(query);
					result = pstmt.executeQuery();		
					out.println("<table border=\"1\">");
					ResultSetMetaData rsmd = result.getMetaData();
					int cnt = rsmd.getColumnCount();
					for(int i = 1; i <= cnt; i++){
						out.println("<th>" + rsmd.getColumnName(i) + "</th>");
					}
					while(result.next()){
						out.println("<tr>");
						out.println("<td>" + result.getInt(1) + "</td>");
						out.println("<td>" + result.getString(2) + "</td>");
						out.println("<td>" + result.getString(3) + "</td>");
						out.println("<td>" + result.getInt(4) + "</td>");
						out.println("</tr>");
					}
					out.println("</table>");
				%>
				<input class="addMusic" onclick="openSearchWindow()" type="button" value="노래추가">
				<%
					query = "SELECT P.NAME, P.MEMBERSHIP, P.SEX FROM PLAYER P WHERE P.ROOMNO='" + roomNo + "' ORDER BY P.MEMBERSHIP DESC";
					System.out.println(query);
					pstmt = conn.prepareStatement(query);
					result = pstmt.executeQuery();
					out.println("<h2>방 참가자</h2>");
					out.println("<table border=\"1\">");
					rsmd = result.getMetaData();
					cnt = rsmd.getColumnCount();
					for(int i = 1; i <= cnt; i++){
						out.println("<th>" + rsmd.getColumnName(i) + "</th>");
					}
					while(result.next()){
						out.println("<tr>");
						out.println("<td>" + result.getString(1) + "</td>");
						out.println("<td>" + result.getString(2) + "</td>");
						out.println("<td>" + result.getString(3) + "</td>");
						out.println("</tr>");
					}
					out.println("</table>");
				%>
				
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>
</html>