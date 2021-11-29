<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>

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
                  <img src="./src/image1.jpg" style="width:100%; height:320px;">
                  <div class="text">Caption One</div>
                </div>
                
                <div class="mySlides fade">
                  <div class="numbertext">2 / 3</div>
                  <img src="./src/image2.jpg" style="width:100%; height:320px;">
                  <div class="text">Caption Two</div>
                </div>
                
                <div class="mySlides fade">
                  <div class="numbertext">3 / 3</div>
                  <img src="./src/image3.jpg" style="width:100%; height:320px;">
                  <div class="text">Caption Three</div>
                </div>
                
                <!--<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>-->
                
            </div>
                
			<div class="dots" style="text-align:center">
			  <span class="dot" onclick="currentSlide(1)"></span> 
			  <span class="dot" onclick="currentSlide(2)"></span> 
			  <span class="dot" onclick="currentSlide(3)"></span> 
			</div>
        </div>
    </div>
    <div id="contents">
        <div class="container">
            <h2>Recently Played</h2>
            <div class="boxes">
                <div class="album kylepatrick">
                    <img src="src/cover1.jpg">
                    <span class="title">Kyle Patrick</span>
                    <span>Kyle Patrick</span>
                </div>
                <div class="album the1975">
                    <img src="src/cover2.jpg">
                    <span class="title">The 1975</span>
                    <span>The 1975</span>
                </div>
                <div class="album theclickfive">
                    <img src="src/cover3.jpg">
                    <span class="title">TCV</span>
                    <span>the Click Five</span>
                </div>
                <div class="album wheatus">
                    <img src="src/cover4.jpg">
                    <span class="title">Lemonade</span>
                    <span>Wheatus</span>
                </div>
            </div>
        </div>
    </div>
	
    <%@include file="footer.jsp"%>
</body>
</html>