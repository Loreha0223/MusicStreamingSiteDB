<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@include file="dbConnect.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<%@include file="head.jsp"%>
	<body>
		<%@include file="header.jsp"%>
		<%@include file="sideBar.jsp"%>
		<div class="contentBox">
			<div class="container">
				<%
					String playListNo = request.getParameter("playListNo");
				
					if(session.getAttribute("userid")==null){
						out.println("<li>로그인 후 확인가능합니다.</li>");
					}else{
						String userid = (String)session.getAttribute("userid");
					if(session.getAttribute("account") == "admin"){
						out.println("<li>일반 사용자 전용 기능입니다.</li>");
					}else{
						String query = "SELECT NAME FROM PLAYLIST WHERE ListNo = '" + playListNo + "'";
						System.out.println(query);
						PreparedStatement pstmt = conn.prepareStatement(query);
						ResultSet rs = pstmt.executeQuery();
						rs.next();
						out.println("<h2>" + rs.getString(1) + "</h2>");
		
						query = "SELECT MusicTitle FROM MUSICLIST NATURAL JOIN MUSIC WHERE ListNo='" + playListNo + "'";
						System.out.println(query);
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						while(rs.next()){
							out.println(rs.getString(1));
						}
					}
				%>
				<button class="goingGenre" onclick="location.href='printPL.jsp'"type="button">플리듣기</button>
			</div>
		</div>
	<%@include file="footer.jsp"%>
	</body>
</html>