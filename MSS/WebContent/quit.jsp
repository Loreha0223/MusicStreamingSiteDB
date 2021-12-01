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
				<h1>마이 페이지</h1>
				<%
					if(session.getAttribute("userid") != null){
						String query = " DELETE FROM PLAYER WHERE PLAYERID='" + session.getAttribute("userid") + "'";
						stmt.executeUpdate(query);
						out.println("탈퇴하였습니다.");
						response.sendRedirect("logout.jsp");
					}else{
						out.println("로그인 후 접근 가능한 페이지입니다.");
					}
				%>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>
</html>