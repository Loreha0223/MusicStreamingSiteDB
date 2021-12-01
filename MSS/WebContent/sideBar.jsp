<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<style>
#sidebar .side-enteredRoom h2 {
	padding: 10px 0 0 0;
	color: white;
	font-size: 20px;
}

#sidebar .side-enteredRoom li {
	padding: 6px 8px 6px 5px;
	font-size: 16px;
}
</style>
<div id="sidebar">
	<div class="container">
		<ul>
			<li><i class="fa fa-home" aria-hidden="true"></i> <a
				href="index.jsp">홈</a></li>
			<li><i class="fa fa-bookmark" aria-hidden="true"></i> <a
				href="#">내 라이브러리</a></li>
			<li><i class="fa fa-heart heart-icon" aria-hidden="true"></i> <a
				href="#">좋아요 표시한 곡</a></li>
		</ul>
		<ul class="side-playlist">
			<h2>나의 플레이리스트</h2>
			<hr>
			<%
				if (session.getAttribute("userid") == null) {
					out.println("<li>로그인 후 확인가능합니다</li>");
				} else if (session.getAttribute("account") == "admin") {
					out.println("<li>일반 사용자 전용 기능입니다.</li>");
				} else {
					String userid = (String) session.getAttribute("userid");
					ResultSet rs = null;
					String sql = "SELECT ListNo, Name FROM PLAYLIST WHERE PlayerID = '" + userid + "'";
					rs = stmt.executeQuery(sql);
					while (rs.next())
						out.println("<li><a href='playlist.jsp?playListNo=" + rs.getString(1) + "'>" + rs.getString(2) + "</a></li>");
					rs.close();
					out.println("<li><a href='addPlayList.jsp'>추가하기</a></li>");
				}
			%>
		</ul>
		<ul class="side-enteredRoom">
			<h2>참여중인 방</h2>
			<hr>
			<%
				if (session.getAttribute("userid") == null) {
					out.println("<li>로그인 후 확인가능합니다</li>");
				} else {
					String userid = (String) session.getAttribute("userid");
					if (session.getAttribute("account") == "admin") {
						out.println("<li>일반 사용자 전용 기능입니다.</li>");
					} else {
						ResultSet rs = null;
						String sql = "SELECT RoomNo, RoomName FROM PLAYER NATURAL JOIN ROOM WHERE PlayerID='"
								+ session.getAttribute("userid") + "'";
						rs = stmt.executeQuery(sql);

						while (rs.next()) {
							out.println("<li><a href='room.jsp?no=" + rs.getString(1) + "'>" + rs.getString(2)
									+ "</a></li>");
						}
						rs.close();
					}
				}
			%>
		</ul>
	</div>
</div>