<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@include file="dbConnect.jsp"%>

<%!public void printRooms(JspWriter out, Connection conn, String query) {
		int rowNums = 0;
		try {
			ResultSet result;
			PreparedStatement pstmt = conn.prepareStatement(query);
			result = pstmt.executeQuery();

			while (result.next()) {
				if (rowNums % 3 == 0)
					out.println("<div class='boxes'>");
				out.println("<a href='room.jsp?no=" + result.getString(3) + "'><div class='room'>");
				out.println("<span class='title'>" + result.getString(1) + "</span>");
				out.println("<span>" + result.getString(2) + "명 참여중</span>");
				out.println("<div class='enterButton'>입장</div>");
				out.println("</div></a>");
				if (rowNums % 3 == 2)
					out.println("</div><br>");
				rowNums++;
			}
			if (rowNums == 0)
				out.println("검색 결과가 없습니다.");
			else
				out.println("</div><br>");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}%>

<!DOCTYPE html>
<html lang="en">
<%@include file="head.jsp"%>
<link rel="stylesheet" href="buttonStyle.css">
<body>
	<%@include file="header.jsp"%>
	<%@include file="sideBar.jsp"%>
	<div id="banner">
		<div class="container">
			<h2>Genre</h2>
			<div class="slideshow-container">
				<div class="mySlides fade" id="first">
					<div class="numbertext">1 / 3</div>
					<img src="./src/image1.jpg" style="width: 100%; height: 320px;">
					<!--              참여 기능 완성되면 연결 필요 -->
					<div class="text">
						<a href="enteredroom.jsp?no=qia4Z">참여하기</a>
					</div>

				</div>

				<div class="mySlides fade">
					<div class="numbertext">2 / 3</div>
					<img src="./src/image2.jpg" style="width: 100%; height: 320px;">
					<div class="text">참여하기</div>
				</div>

				<div class="mySlides fade">
					<div class="numbertext">3 / 3</div>
					<img src="./src/image3.jpg" style="width: 100%; height: 320px;">
					<div class="text">참여하기</div>
				</div>
			</div>

			<div class="dots" style="text-align: center">
				<span class="dot" onclick="currentSlide(1)"></span> <span
					class="dot" onclick="currentSlide(2)"></span> <span class="dot"
					onclick="currentSlide(3)"></span>
			</div>
		</div>
	</div>
	<div id="contents">
		<div class="container">
			<h2>
				지금 가장 인기있는 방 <i class="fab fa-hotjar" style="color: red"></i>
			</h2>
			<%
				String sql = "SELECT * FROM (SELECT RoomName, ParticipantsNo, RoomNo FROM ROOM ORDER BY PARTICIPANTSNO DESC) WHERE ROWNUM <= 10";
				printRooms(out, conn, sql);
			%>

		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>