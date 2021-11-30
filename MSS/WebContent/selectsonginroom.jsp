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
				<form action="enteredroom.jsp" method="get">
				<%
					String query = "SELECT S.SNAME, M.MUSICTITLE, M.MUSICID FROM MUSIC M, SINGER S, RELEASEMENT R WHERE R.ALBUMID = M.ALBUMID AND S.SINGERID = R.SINGERID "
							+ "MINUS " 
							+ "SELECT S.SNAME, M.MUSICTITLE, M.MUSICID FROM MUSIC M, SINGER S, RELEASEMENT R, HAS H WHERE R.ALBUMID = M.ALBUMID AND S.SINGERID = R.SINGERID AND H.ROOMNO='tc37n' AND M.MUSICID = H.MUSICID";
					System.out.println(query);
					PreparedStatement pstmt = conn.prepareStatement(query);
					ResultSet rs = pstmt.executeQuery();
					out.println("<h2>곡 추가하기</h2>");
					out.println("<table border=\"1\">");
					ResultSetMetaData rsmd = rs.getMetaData();
					int cnt = rsmd.getColumnCount();
					out.println("<th>CHECK</th>");
					for(int i = 1; i <= cnt; i++){
						out.println("<th>" + rsmd.getColumnName(i) + "</th>");
					}
					while(rs.next()){
						out.println("<tr>");
						out.println("<td><input type=\"checkbox\" name =\"songtitle\" value = \""+rs.getString(3)+"\"></td>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.println("</tr>");
					}
					out.println("</table>");
				%>
				<button onclick="test()">노래추가</button>
				<button onclick="location.href='enteredroom.jsp'">닫기</button>
				
				<script>
   					function test() {
    			    	var obj_length = document.getElementsByName("songtitle").length;
    			  
      					for (int i=0; i<obj_length; i++) {
            				if (document.getElementsByName("songtitle")[i].checked == true) {
            					out.println("INSERT INTO HAS VALUES('tc37n', '"+document.getElementsByName("songtitle")[i].value+"', '2')");
           					}
        				}
    			    	
    				}
				</script>

				</form>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</body>
</html>