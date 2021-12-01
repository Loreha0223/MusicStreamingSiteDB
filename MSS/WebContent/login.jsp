<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%@include file="dbConnect.jsp"%>
<!DOCTYPE html>
<html>
	<%@include file="head.jsp"%>
	<body>
		<%@include file="header.jsp"%>
		<%@include file="sideBar.jsp"%>
    <div class="contentBox">
        <div class="container">
            <h2>로그인</h2>
            <div class="login">
                <form action="loginSuccess.jsp" method="post">
                <table border="1" align="center" width="500">
	                <tr>
	                	<th colspan="2">일반 사용자 로그인</th>
	                </tr>
	                <tr>
	                	<td>사용자 아이디</td>
	                	<td><input type="text" name="userid"></td>
	                </tr>
	                <tr>
	                	<td>사용자 암호</td>
	                	<td><input type="password" name="password"></td>
	               	</tr>
	               	<tr>
	               		<th colspan="2">
		               		<label><input type="checkbox" name="account" value="admin">관리자로 로그인</label>
		               		<input type="submit" value="로그인">
	               		</th>
	                </tr>
	                <tr>
	               		<th colspan="2">
		               		<a href="join.jsp">회원가입</a>
	               		</th>
	                </tr>
                </table>
                </form>
			</div>
			
        </div>
    </div>
	<%@include file="footer.jsp"%>
</body>
</html>