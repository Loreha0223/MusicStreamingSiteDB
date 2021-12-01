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
						out.println("본인 소유의 플레이리스트만 삭제할 수 있습니다.");
					}else{
						out.println("<h2>" + result.getString(1) + "</h2>");
						int deletedRow = stmt.executeUpdate("DELETE FROM PLAYLIST WHERE  ListNo = '" + playListNo + "' AND PlayerID='" + session.getAttribute("userid") + "'");
						if(deletedRow == 1) out.println("삭제되었습니다.");
					}
				}
			%>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>