<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!
public void printRooms(JspWriter out, Connection conn, String query) {
	int rowNums = 0;
	try {
		ResultSet result;
		PreparedStatement pstmt = conn.prepareStatement(query);
		result = pstmt.executeQuery();

		while (result.next()) {
			if (rowNums % 3 == 0)
				out.println("<div class='boxes'>");
			out.println("<a href='enteredroom.jsp?no=" + result.getString(3) + "'><div class='room'>");
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
%>

<%
	String sql = "SELECT * FROM (SELECT RoomName, ParticipantsNo, RoomNo FROM ROOM ORDER BY PARTICIPANTSNO DESC) WHERE ROWNUM <= 10";
	printRooms(out, conn, sql);
%>


