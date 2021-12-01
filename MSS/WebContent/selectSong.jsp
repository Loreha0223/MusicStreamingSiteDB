<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@include file="dbConnect.jsp"%>
<!DOCTYPE html>

<script type="text/javascript">
	function addMusic(musicID) {
		window.opener.addMusicToList(musicID);
		self.close();
	}
</script>

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
		display: inline-block;
		width: 30%;
	    color: rgba(255, 255, 255, 0.787);
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
	
	.music-long .title{
		width: 50%;
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
			out.println("<div class='music-long' onclick=\"addMusic('" + result.getString(1) + "')\"><table><tr>");
			out.println("<td><img src='src/cover1.jpg'></td>");
			out.println("<td style='padding-left: 10px;'><span class='title'>" + result.getString(2) + "</span>");
			out.println("<span>" + result.getString(3) + "</span></td>");
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
<body style="margin: 0; padding: 0;">
	<div style="margin: 0; box-sizing: content-box; background: #222222; padding: 5vh 5vw 15vh 5vw; color: #d2d2d2; min-height: 100vh;">
		<form action="selectSong.jsp" method="get">
			<h2>곡 검색</h2>
			<input type="text" name="title" style="border: 0; width: 70vw; height: 20px; padding: 0;">
			<input type="submit" value="검색" style="border: 0; padding: 0; width: 10vw; height: 20px;"><br><br>
			<%
				String title = request.getParameter("title");
				printMusics(out, conn, "SELECT MusicID, MusicTitle, SName FROM (MUSIC NATURAL JOIN SONG) NATURAL JOIN SINGER WHERE MusicTitle LIKE '%" + title + "%'");
			%>
		</form>
	</div>
</body>
</html>