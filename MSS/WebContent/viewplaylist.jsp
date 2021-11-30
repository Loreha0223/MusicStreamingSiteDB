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
		<div class="contentBox">
			<div class="container">
				<%
					if(session.getAttribute("userid")==null){
						out.println("<li>로그인 후 확인가능합니다</li>");
					}else{
						String userid = (String)session.getAttribute("userid");
					if(session.getAttribute("account") == "admin"){
						out.println("<li>관리자님께는 제공되지 않는 서비스입니다</li>");
					}else{
						String query = "SELECT NAME FROM PLAYER WHERE PLAYERID = 'b4f81'";
						System.out.println(query);
						PreparedStatement pstmt = conn.prepareStatement(query);
						ResultSet rs = pstmt.executeQuery();
		
						while(rs.next()){
							out.println(rs.getString(1)+"의 플레이리스트");
						}
		
						query = "SELECT P.NAME, COUNT(M.LISTNO) AS 곡수 FROM PLAYLIST P, MUSICLIST M WHERE P.PLAYERID = 'b4f81' AND M.LISTNO = P.LISTNO GROUP BY M.LISTNO, P.NAME";
						System.out.println(query);
						pstmt = conn.prepareStatement(query);
						rs = pstmt.executeQuery();
						out.println("<table border=\"1\">");
						ResultSetMetaData rsmd = rs.getMetaData();
						int cnt = rsmd.getColumnCount();
						out.println("<th>SELECT</th>");
						for(int i = 1; i <= cnt; i++){
						out.println("<th>" + rsmd.getColumnName(i) + "</th>");
						}
						while(rs.next()){
							out.println("<tr>");
							out.println("<td><input type=\"radio\" name =\"selectplaylist\" value = \""+rs.getString(1)+"\"></td>");
							out.println("<td>" + rs.getString(1) + "</td>");
							out.println("<td>" + rs.getInt(2) + "</td>");
							out.println("</tr>");
						}
						out.println("</table>");
					}
				%>
				<button class="goingGenre" onclick="location.href='printPL.jsp'"type="button">플리듣기</button>
			</div>
		</div>
	<%@include file="footer.jsp"%>
	</body>
</html>