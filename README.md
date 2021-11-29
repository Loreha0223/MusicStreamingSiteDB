# MusicStreamingSiteDB

## default page
```
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
				<--내용 삽입-->
		</div>
		<%@include file="footer.jsp"%>
	</body>
</html>
```
이 기본 틀을 이용하여 만들면 됨.
 * head -> css, 메타태그가 들어있는 부분
 * header -> 상단바 부분
 * sideBar -> 왼쪽에 있는 사이드바 부분
 * footer -> 

## db-connect
데이터베이스 연결할 때, 맨 위에
``` <%@include file="dbConnect.jsp"%> ```
입력하면 됨.  
(loginSuccess.jsp 파일 참고)
