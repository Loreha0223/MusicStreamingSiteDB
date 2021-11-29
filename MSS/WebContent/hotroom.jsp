<%-- <%@include file="dbConnect.jsp"%> --%>

<%
	ResultSet rs = null;
	String sql = "SELECT * FROM (SELECT * FROM ROOM ORDER BY PARTICIPANTSNO DESC) WHERE ROWNUM <= 10";
	rs = stmt.executeQuery(sql);
	
	
	out.println("<table border=\"1\" style=\"color:white;\">");
	ResultSetMetaData rsmd = rs.getMetaData();
	int cnt = rsmd.getColumnCount();
	for(int i=1; i <= cnt; i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getInt(4)+"</td>");
		out.println("<td>"+rs.getString(5)+"</td>");
		out.println("<td>"+rs.getString(6)+"</td>");
		out.println("<td>"+rs.getInt(7)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
%>


