<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*"%>

<!DOCTYPE html>
<html>
<%@include file="head.jsp"%>
<body>
	<%@include file="header.jsp"%>
	<%@include file="sideBar.jsp"%>
	<div id="login-contents">
		<div class="container">
			<h2>회원가입</h2>
			<%-- <%--             <% --%>
			<!-- //             	request.setCharacterEncoding("UTF-8"); -->
			<!-- //             	if(session.getAttribute("rt_msg")==null){ -->

			<!-- //             	}else{ -->
			<!-- //             		out.println("<h4>"+session.getAttribute("rt_msg")+"</h4>"); -->
			<!-- //             	} -->
			<%-- <%--             %> --%>
			<div class="login">
				<form action="joinSuccess.jsp" method="post">
					<table border="1" align="center" width="500">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="userid"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="password"></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="password-check"></td>
						</tr>
						<tr>
							<td>이름(닉네임)</td>
							<td><input type="text" name="nickname"></td>
						</tr>
						<tr>
							<td>생년월일(형식 : YYYY-MM-DD)</td>
							<td><input type="text" name="birthday"></td>
						</tr>
						<tr>
							<td>성별</td>
							<td><label><input type="radio" name="sex" value="m">남</label>
								<label><input type="radio" name="sex" value="f">여</label>
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email"></td>
						</tr>
						<tr>
							<td>전화번호(형식 : 010-0000-0000)</td>
							<td><input type="text" name="phone"></td>
						</tr>
						<tr>
							<th colspan="2"><label><input type="checkbox"
									name="account" value="admin">관리자로 회원가입</label> <input
								type="submit" value="회원가입"></th>
						</tr>
					</table>
				</form>
			</div>

		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>