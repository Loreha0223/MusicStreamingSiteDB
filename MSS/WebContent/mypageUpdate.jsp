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
						request.setCharacterEncoding("UTF-8");
						String newName = request.getParameter("nickname") + "";
						String newPassword = request.getParameter("password") + "";
						String newEmail = request.getParameter("email") + "";
						String newPhone = request.getParameter("phone") + "";
						
						if(newName.equals("")){
							out.println("닉네임을 입력해주세요.");
						}else if(newPassword.equals("")){
							out.println("비밀번호를 입력해주세요");
						}else if(newEmail.equals("")){
							out.println("이메일을 입력해주세요");
						}else if(newPhone.equals("")){
							out.println("전화번호를 입력해주세요");
						}else{
							String query = "UPDATE PLAYER SET NAME='" + newName + "', PASSWORD='" + newPassword + "', EMAIL='" + newEmail + "', PHONENUMBER='" + newPhone + "' WHERE PLAYERID='" + session.getAttribute("userid") + "'";
							stmt.executeUpdate(query);
							out.println("수정하였습니다!");
						}

					}else{
						out.println("로그인 후 접근 가능한 페이지입니다.");
					}
				%>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>
</html>