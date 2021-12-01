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
				if (session.getAttribute("userid") == null) {
					out.println("<li>로그인 후 확인가능합니다.</li>");
				} else if (session.getAttribute("account") == "admin") {
					out.println("<li>일반 사용자 전용 기능입니다.</li>");
				} else {
					String playListNo = request.getParameter("playListNo");
					String newName = request.getParameter("newName");
					String query;
					ResultSet result;
					PreparedStatement pstmt;
					
					query = "SELECT NAME FROM PLAYLIST WHERE ListNo = '" + playListNo + "' AND PlayerID='" + session.getAttribute("userid") + "'";
					System.out.println(query);
					
					result = stmt.executeQuery(query);
					if(!result.next()){
						out.println("본인 소유의 플레이리스트만 이름을 변경할 수 있습니다.");
					}else{
						if(newName == null){
							out.println("<h2>플레이리스트 이름 설정</h2>");
							out.println("기존 이름:" + result.getString(1));
							out.println("<br><form action='rename.jsp' method='get'><input type='hidden' name='playListNo' value='" + playListNo + "'>새 이름: <input type='text' name='newName'><br><br>");
							out.println("<input type='submit' value='변경하기'></form>");
						}else{
							if(playListNo != null){
								query = "UPDATE PLAYLIST SET NAME='" + newName + "' WHERE ListNo='" + playListNo + "'";
								pstmt = conn.prepareStatement(query);
								result = pstmt.executeQuery();
								out.println("변경하였습니다.");
							}
						}
					}
				}
			%>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>