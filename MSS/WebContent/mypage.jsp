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
						String ctrl = request.getParameter("control");
						String[] reportedRoomNo = request.getParameterValues("reportedRoom");
						String[] bannedRoomNo = request.getParameterValues("bannedRoom");
						
						
						out.println("<form action='mypage.jsp' method='POST'>");
						out.println("<div class='section'>");
						out.println("<h2>개인정보 수정</h2>");
						out.println("<table style='width: 60vw; background: #d2d2d2; color: #222222;'>");
						out.println("	<tr>");
						out.println("		<td>닉네임</td>");
						out.println("		<td>닉네임</td>");
						out.println("	</tr>");
						out.println("	<tr>");
						out.println("		<td>성별</td>");
						out.println("		<td>닉네임</td>");
						out.println("	</tr>");
						out.println("	<tr>");
						out.println("		<td>email</td>");
						out.println("		<td>닉네임</td>");
						out.println("	</tr>");
						out.println("	<tr>");
						out.println("		<td>phone</td>");
						out.println("		<td>닉네임</td>");
						out.println("	</tr>");
						out.println("</table>");
						out.println("</div>");
						out.println("<input type='submit' name='quit' value='탈퇴하기'>");
						out.println("</form>");
					}else{
						out.println("로그인 후 접근 가능한 페이지입니다.");
					}
				%>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>
</html>