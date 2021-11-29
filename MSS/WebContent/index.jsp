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
		<div id="banner">
			<div class="container">
				<h2>Genre</h2>
				<div class="slideshow-container">
					<div class="mySlides fade" id="first">
						<div class="numbertext">1 / 3</div>
						<img src="./src/image1.jpg" style="width: 100%; height: 320px;">
						<!--              참여 기능 완성되면 연결 필요 -->
						<div class="text">
							<a href="#.jsp?roomNo=qia4Z">참여하기</a>
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
		
					<!--<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
		                <a class="next" onclick="plusSlides(1)">&#10095;</a>-->
		
				</div>
		
				<div class="dots" style="text-align: center">
					<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
						onclick="currentSlide(2)"></span> <span class="dot"
						onclick="currentSlide(3)"></span>
				</div>
			</div>
		</div>
		<div id="contents">
			<div class="container">
				<h2>
					지금 가장 인기있는 방 <i class="fab fa-hotjar" style="color: red"></i>
				</h2>
				<%@include file="hotroom.jsp"%>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>
</html>