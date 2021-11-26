<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- css style -->
    <link rel="stylesheet" href="indexStyle.css">
    
    <!-- web icon -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>Blue Lemon</title>
</head>
<body>
    <header>
        <div class="container">
            <nav>
                <div class="search-box">
                    <input class="search-txt" type="text" placeholder="Type to search">
                    <a class="search-btn" href="#">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </a>
                </div>

                <ul class="nav-links">
                	<li><a class="nav" href="chart.jsp">차트</a></li>
                    <li><a class="nav" href="#.html">방 목록</a></li>
                    <li><a class="nav" href="#.html">필요한거 추가</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <div id="sidebar">
        <div class="container">
            <ul>
                <li>
                    <i class="fa fa-home" aria-hidden="true"></i>
                    <a href="index.jsp">홈</a>
                </li>
                <li>
                    <i class="fa fa-bookmark" aria-hidden="true"></i>
                    <a href="#">내 라이브러리</a>
                </li>
                <li>
                    <i class="fa fa-heart heart-icon" aria-hidden="true"></i>
                    <a href="#">좋아요 표시한 곡</a>
                </li>
            </ul>
            <ul class="side-playlist">
                <h2>플레이리스트</h2>
                <hr>
                <ul>
                    <li>Hip-Hop</li>
                    <li>Rock</li>
                    <li>Pop</li>
                </ul>
            </ul>
        </div>
    </div>
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
            <div class="albums">
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
    <footer>
        <div class="container">
            <div class="playing-album">
                <img src="src/cover.jpg">             
                <div class="album-info">
                    <span class="title">Another Life</span>
                    <span>Kyle Patrick</span>
                </div>
                <i class="fa fa-heart" id="heart-icon" aria-hidden="true"></i>
            </div>
            <audio id="player" src="./src/AnotherLife.mp3"></audio>
            <div class="player">
                <div class="control">
                    <i class="fa fa-random play" aria-hidden="true"></i>
                    <i class="fa fa-step-backward step" aria-hidden="true"></i>
                    <i class="fa fa-play-circle play-btn" id="playbtn"aria-hidden="true"></i>
                    <i class="fa fa-step-forward step" aria-hidden="true"></i>
                    <i class="fa fa-repeat play" aria-hidden="true"></i>
                </div>
                <div class="progress-bar">
                    <div id="current">
                        0:00
                    </div>
                    <div id="bar">
                        <div id="progress"></div>
                    </div>
                    <div id="end">
                        4:16
                    </div>
                </div>               
            </div>
            <div class="volume">
                <div class="volume-container">
                    <div class="volume-control">
                        <i class="fa fa-volume-up" id="volume" aria-hidden="true"></i>
                        <i class="fa fa-desktop" aria-hidden="true"></i>
                        <i class="fa fa-list-ul" aria-hidden="true"></i>                        
                    </div>
                    <div class="volume-bar">
                        <input type="range", min="0", max="100" value="40" id="myRange" class="slider">
                    </div>
                </div> 
            </div>
        </div>
    </footer>
    <!-- js -->
	<script type="text/javascript" src="./js/slide.js"></script>
	<script type="text/javascript" src="./js/player.js"></script>
	<script type="text/javascript" src="./js/heart.js"></script>
	<script type="text/javascript" src="./js/mute.js"></script>
</body>
</html>