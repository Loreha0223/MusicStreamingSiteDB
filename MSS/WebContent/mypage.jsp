<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@include file="dbConnect.jsp"%>
<!DOCTYPE html>
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
</style>
<html lang="en">
	<%@include file="head.jsp"%>
	<body>
		<script type="text/javascript">
			function updateInfo(){
				document.getElementById('userInfo').submit();
			}
		</script>
		<%@include file="header.jsp"%>
		<%@include file="sideBar.jsp"%>
		<div class="contentBox">
			<div class="container">
				<h1>마이 페이지</h1>
				<%
					if(session.getAttribute("userid") != null){
						String query = "SELECT Name, Sex, Email, PhoneNumber FROM PLAYER WHERE PlayerID='" + session.getAttribute("userid")  + "'";
						ResultSet result = stmt.executeQuery(query);
						result.next();
						
						out.println("<form action='mypageUpdate.jsp' method='POST' id='userInfo'>");
						out.println("<div class='section'>");
						out.println("<h2>개인정보 수정</h2>");
						out.println("<table style='width: 60vw; background: #d2d2d2; color: #222222;'>");
						out.println("	<tr>");
						out.println("		<td>닉네임</td>");
						out.println("		<td><input type='text' name='nickname' value='" + result.getString(1) + "'></td>");
						out.println("	</tr>");
						out.println("	<tr>");
						out.println("		<td>비밀번호</td>");
						out.println("		<td><input type='password' name='password'></td>");
						out.println("	</tr>");
						out.println("	<tr>");
						out.println("		<td>email</td>");
						out.println("		<td><input type='text' name='email' value='" + result.getString(3) + "'></td>");
						out.println("	</tr>");
						out.println("	<tr>");
						out.println("		<td>phone</td>");
						out.println("		<td><input type='text' name='phone' value='" + result.getString(4) + "'></td>");
						out.println("	</tr>");
						out.println("</table>");
						out.println("</div>");
						out.println("</form>");
						out.println("<a href='#' onclick='updateInfo()' style='color: #d2d2d2;'><div class='music-long' style='text-align: center;'>수정하기</div></a>");
						out.println("<a href='quit.jsp' onclick='quit()' style='color: orangered;'><div class='music-long' style='text-align: center;'>탈퇴하기</div></a>");
					}else{
						out.println("로그인 후 접근 가능한 페이지입니다.");
					}
				%>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>
</html>