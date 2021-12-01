<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@include file="dbConnect.jsp"%>
<!DOCTYPE html>
<html>
<%@include file="head.jsp"%>
<body>

	<%@include file="header.jsp"%>
	<%@include file="sideBar.jsp"%>

	<%!public void printMusics(JspWriter out, Connection conn, String query) {
		int rowNums = 0;
		try {
			ResultSet result;
			PreparedStatement pstmt = conn.prepareStatement(query);
			result = pstmt.executeQuery();

			while (result.next()) {
				if (rowNums % 4 == 0)
					out.println("<div class='boxes'>");
				out.println("<div class='music' onclick=\"setPlayer('" + result.getString(3) + "', '" + result.getString(1) + "', '" + result.getString(2) + "')\">");
				out.println("<img src='src/cover1.jpg'>");
				out.println("<span class='title'>" + result.getString(1) + "</span>");
				out.println("<span>" + result.getString(2) + "</span>");
				out.println("</div>");
				if (rowNums % 4 == 3)
					out.println("</div><br>");
				rowNums++;
			}
			if(rowNums == 0)
				out.println("검색 결과가 없습니다.");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public void printRooms(JspWriter out, Connection conn, String query) {
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
			if(rowNums == 0)
				out.println("검색 결과가 없습니다.");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public void printResult(JspWriter out, Connection conn, String query) {
		int rowNums = 0;
		try {
			ResultSet result;
			PreparedStatement pstmt = conn.prepareStatement(query);
			result = pstmt.executeQuery();

			while (result.next()) {
				for(int i=1; i<=result.getMetaData().getColumnCount(); i++)
					out.println(result.getString(i));
				out.println("<br>");
				rowNums++;
			}
			if(rowNums == 0)
				out.println("검색 결과가 없습니다.");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}%>

	<%
		String keyword = request.getParameter("keyword");
		String query;
	%>
	<div class="contentBox">
		<table style="width: 100%;">
			<tr>
				<td>
					<h2>노래 검색 결과</h2>
				</td>
			</tr>
			<tr>
				<td>
					<%
						query = "SELECT MusicTitle, SName, MusicID FROM Music NATURAL JOIN Song NATURAL JOIN Singer WHERE MusicTitle LIKE '%"
								+ keyword + "%'";
						if (keyword != null)
							printMusics(out, conn, query);
						else
							out.println("검색 결과가 없습니다.");
					%>
				</td>
			</tr>

			<tr>
				<td>
					<h2>가수 검색 결과</h2>
				</td>
			</tr>

			<tr>
				<td>
					<%
						query = "SELECT SName FROM Singer WHERE SName LIKE '%" + keyword + "%'";
						if (keyword != null)
							printResult(out, conn, query);
						else
							out.println("검색 결과가 없습니다.");
					%>

				</td>
			</tr>

			<tr>
				<td>
					<h2>앨범 검색 결과</h2>
				</td>
			</tr>

			<tr>
				<td>
					<%
						query = "SELECT AlbumTitle FROM Album WHERE AlbumTitle LIKE '%" + keyword + "%'";
						if (keyword != null)
							printResult(out, conn, query);
						else
							out.println("검색 결과가 없습니다.");
					%>

				</td>
			</tr>

			<tr>
				<td>
					<h2>방 검색 결과</h2>
				</td>
			</tr>

			<tr>
				<td>
					<%
						query = "SELECT RoomName, ParticipantsNo, RoomNo FROM Room WHERE RoomName LIKE '%" + keyword + "%'";
						if (keyword != null)
							printRooms(out, conn, query);
						else
							out.println("검색 결과가 없습니다.");
					%>

				</td>
			</tr>
		</table>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>