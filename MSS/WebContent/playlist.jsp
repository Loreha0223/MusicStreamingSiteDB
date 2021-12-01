<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@include file="dbConnect.jsp"%>
<!DOCTYPE html>
<html lang="en">
<style>
.music-long {
	width: 100%;
	margin: 5px;
	padding: 10px;
	background: #333333;
	border-radius: 5px;
	transition: 0.4s ease;
	vertical-align: middle;
}

.music-long:hover {
	background: #444444;
	cursor: pointer;
}

.music-long img {
	width: 40px;
	height: 40px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.music-long img:hover {
	box-shadow: 10px;
}

.music-long span {
	color: rgba(255, 255, 255, 0.787);
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.music-long .title {
	font-size: 20px;
	font-weight: bold;
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
				out.println("<div class='music-long' onclick=\"setPlayer('" + result.getString(3) + "', '"
						+ result.getString(1) + "', '" + result.getString(2) + "')\"><table><tr>");
				out.println("<td><img src='src/cover1.jpg'></td>");
				out.println("<td style='padding-left: 10px;'><span class='title'>" + result.getString(1) + "</span>");
				out.println("<span>" + result.getString(2) + "</span></td>");
				out.println("</tr></table></div>");
				rowNums++;
			}
			if (rowNums == 0)
				out.println("빈 플레이리스트<br>");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}%>
<%@include file="head.jsp"%>
<body>
	<script type="text/javascript">
		function openSearchw(){
			var searchWin = window.open("selectSong.jsp", "Select Music", "width=570, height=350, resizable=no, scrollbars=no");
			console.log("hi!!!");
		}
		
		function addMusicToList(musicID){
			location.replace("playlist.jsp?playListNo=<%=request.getParameter("playListNo")%>&addMusic="+ musicID);
		}
	</script>
	<%@include file="header.jsp"%>
	<%@include file="sideBar.jsp"%>
	<div class="contentBox">
		<div class="container">
			<%
				if (session.getAttribute("userid") == null) {
					out.println("<li>로그인 후 확인가능합니다.</li>");
				} else if (session.getAttribute("account") == "admin") {
					out.println("<li>일반 사용자 전용 기능입니다.</li>");
				} else {
					String playListNo = request.getParameter("playListNo");
					String addedMusicNo = request.getParameter("addMusic");
					String userid = (String) session.getAttribute("userid");
					String query;
					ResultSet result;

					if (addedMusicNo != null) {
						query = "INSERT INTO MUSICLIST VALUES('" + playListNo + "', '" + addedMusicNo + "')";
						stmt.executeUpdate(query);
					}

					query = "SELECT NAME FROM PLAYLIST WHERE ListNo = '" + playListNo + "'";
					System.out.println(query);
					PreparedStatement pstmt = conn.prepareStatement(query);
					result = pstmt.executeQuery();
					result.next();
					out.println("<h2>" + result.getString(1) + "</h2>");
					out.println("<a href='rename.jsp?playListNo=" + playListNo + "'>플레이리스트 이름 설정</a><br>");
					query = "SELECT MusicTitle, SName, MusicID FROM ((MUSICLIST NATURAL JOIN MUSIC) NATURAL JOIN SONG) NATURAL JOIN SINGER WHERE ListNo='"
							+ playListNo + "'";
					printMusics(out, conn, query);
				}
			%>
			<input class="addMusic" onclick="openSearchw()" type="button"
				value="노래추가">
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>