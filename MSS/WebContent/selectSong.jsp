<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@include file="dbConnect.jsp"%>
<!DOCTYPE html>
<script type="text/javascript">
	function addMusic(musicID) {
		window.opener.addMusicToList(musicID);
		self.close();
	}
</script>
<%!public void printResult(JspWriter out, Connection conn, String title) {
		String query = "SELECT MusicTitle, MusicID FROM Music WHERE MusicTitle LIKE '%" + title + "%'";
		int rowNums = 0;
		try {
			ResultSet result;
			PreparedStatement pstmt = conn.prepareStatement(query);
			result = pstmt.executeQuery();

			while (result.next()) {
				out.println(result.getString(1));
				out.println("<a href='#' onclick=\"addMusic('" + result.getString(2)
						+ "')\"><img src='media/add.png'></a>");
				out.println("<br>");
				rowNums++;
			}
			if (rowNums == 0)
				out.println("검색 결과가 없습니다.");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}%>
<html lang="en">
<body>
	<div class="contentBox">
		<div class="container">
			<form action="selectsonginroom.jsp" method="get">
				<h2>곡 검색</h2>
				<input type="text" name="title"><input type="submit"><br>
				<%
					String title = request.getParameter("title");
					printResult(out, conn, title);
				%>
			</form>
		</div>
	</div>
</body>
</html>