<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@include file="dbConnect.jsp"%>

<!DOCTYPE html>
<style>

	.music-long{
		width: 100%;
		margin: 5px;
		padding: 10px;
		background: #333333;
		border-radius: 5px;
		transition: 0.4s ease;
		vertical-align: middle;
	
	}
	
	.music-long:hover{
		background: #444444;
	    cursor:pointer;
	}
	
	.music-long img{
		width: 40px;
	    height: 40px;
	    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	}
	
	.music-long img:hover{
    	box-shadow: 10px;
	}
	
	.music-long span{
	    color: rgba(255, 255, 255, 0.787);
	    white-space:nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
	
	.music-long .title{
	    font-size: 20px;
	    font-weight:bold;
	    color: white;
	}

</style>
<%!public void printMusics(JspWriter out, Connection conn, String query) {
	int rowNums = 0;
	try {
		ResultSet result;
		PreparedStatement pstmt = conn.prepareStatement(query);
		result = pstmt.executeQuery();

		while (result.next()) {
			out.println("<div class='music-long' onclick=\"setPlayer('" + result.getString(3) + "', '" + result.getString(1) + "', '" + result.getString(2) + "')\"><table><tr>");
			out.println("<td><img src='src/cover1.jpg'></td>");
			out.println("<td style='padding-left: 10px;'><span class='title'>" + result.getString(1) + "</span>");
			out.println("<span>" + result.getString(2) + "</span></td>");
			out.println("</tr></table></div>");
			rowNums++;
		}
		if(rowNums == 0)
			out.println("검색 결과가 없습니다.");
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
}%>
<html lang="en">
	<%@include file="head.jsp"%>
	<body>
	<script type="text/javascript">
		function openSearchWindow(){
			var searchWin = window.open("selectSong.jsp", "Select Music", "width=570, height=350, resizable = no, scrollbars = no");
		}
		
		function addMusicToList(musicID){
			location.replace("room.jsp?no=<%=request.getParameter("no")%>&addMusic=" + musicID);
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
					query ="SELECT MusicTitle, SName, MusicID FROM ((MUSIC NATURAL JOIN SONG) NATURAL JOIN SINGER) NATURAL JOIN HAS WHERE RoomNo='" + roomNo +"' ORDER BY OrderNo";		
					printMusics(out, conn, query);
				%>
				<a href="#" onclick="openSearchWindow()" style="color: #d2d2d2;"><div class="music-long" style="text-align: center;">+</div></a>
				<%
					query = "SELECT P.NAME FROM PLAYER P WHERE P.ROOMNO='" + roomNo + "' ORDER BY P.MEMBERSHIP DESC";
					System.out.println(query);
					pstmt = conn.prepareStatement(query);
					result = pstmt.executeQuery();
					out.println("<h2>방 참가자</h2>");
					while(result.next()){
						out.println(result.getString(1) + "<br>");
					}
				%>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>
</html>