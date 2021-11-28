<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%@include file="dbConnect.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- css style -->
    <link rel="stylesheet" href="login.css">
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
                    <% 
						if(session.getAttribute("userid")==null){
							out.println("<li><a class='nav' href='login.jsp'><i class='fa fa-user'></i></a></li>");
						}else{
							String userid = (String)session.getAttribute("userid");
							out.println("<li class='nav'><h5>" + userid + "님</h5></li>");
							out.println("<li><a class='nav' href='logout.jsp'><i class='fa fa-user'></i></a></li>");
						}
					%>
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
                    <%@include file="playlist.jsp"%>
                </ul>
            </ul>
        </div>
    </div>
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
	                	<td>
	                		<label><input type="radio" name="sex" value="m">남</label>
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
	               		<th colspan="2">
		               		<label><input type="checkbox" name="account" value="admin">관리자로 회원가입</label>
		               		<input type="submit" value="회원가입">
	               		</th>
	                </tr>
                </table>
                </form>
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
</body>
</html>