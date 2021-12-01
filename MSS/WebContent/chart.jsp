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
	
	.music-long:hover{
		background: #444444;
	    cursor:pointer;
	}
	
	.music-long img{
		width: 40px;
	    height: 40px;
	    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	}
	
	.music-long img:hover{
    	box-shadow: 10px;
	}
	
	.music-long span{
	    color: rgba(255, 255, 255, 0.787);
	    white-space:nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
	
	.music-long .title{
	    font-size: 20px;
	    font-weight:bold;
	    color: white;
	}

</style>
<%!public void printMusics(JspWriter out, Connection conn, String query) {
	int rowNums = 0;
	try {
		ResultSet result;
		PreparedStatement pstmt = conn.prepareStatement(query);
		result = pstmt.executeQuery();

		while (result.next()) {
			out.println("<div class='music-long' onclick=\"setPlayer('" + result.getString(3) + "', '" + result.getString(1) + "', '" + result.getString(2) + "')\"><table><tr>");
			out.println("<td><img src='src/cover1.jpg'></td>");
			out.println("<td style='padding-left: 10px;'><span class='title'>" + result.getString(1) + "</span>");
			out.println("<span>" + result.getString(2) + "</span>");
			out.println("<span> | " + result.getString(4) + " likes</span></td>");
			out.println("</tr></table></div>");
			rowNums++;
		}
		if(rowNums == 0)
			out.println("검색 결과가 없습니다.");
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
}%>
<html lang="en">
<%@include file="head.jsp"%>
<body>
	<%@include file="header.jsp"%>
	<%@include file="sideBar.jsp"%>
	<div class="contentBox">
		<div class="container">
			<h2>Blue Lemonade 차트</h2>
			<%
				String query ="SELECT MusicTitle, SName, MusicID, Likes FROM (MUSIC NATURAL JOIN SONG) NATURAL JOIN SINGER ORDER BY Likes DESC";		
				printMusics(out, conn, query);
			%>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>