<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="dbConnect.jsp"%>
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
			<h2>플레이리스트</h2>
			<hr>
			<ul>
				<%
					if (session.getAttribute("userid") == null) {
						out.println("<li>로그인 후 확인가능합니다</li>");
					} else {
						String userid = (String) session.getAttribute("userid");
						if (session.getAttribute("account") == "admin") {
							out.println("<li>관리자님께는 제공되지 않는 서비스입니다</li>");
						} else {
							ResultSet rs = null;
							String sql = "SELECT PL.ListNo, PL.Name FROM PLAYER P, PLAYLIST PL WHERE P.PlayerID = '" + userid
									+ "' AND P.PlayerID = PL.PlayerID";
							rs = stmt.executeQuery(sql);

							while (rs.next()) {
								// 				out.println("<td>"+rs.getString(1)+"</td>");
								// 				out.println("<li class=\"listno\" onclick=\"printMusicList(this.value)\" value=\""+rs.getString(1)+"\">"+rs.getString(2)+"</li>");
								out.println("<li>" + rs.getString(2) + "</li>");
							}
							rs.close();
						}
					}
				%>
			</ul>
		</ul>
	</div>
</div>