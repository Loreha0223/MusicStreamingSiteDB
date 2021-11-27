<%@include file="dbConnect.jsp"%>
<%
	String query;
	ResultSet result;
	int resultRow;
	
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");

	query = "SELECT * FROM PLAYER WHERE PlayerID='" + userid + "' AND PASSWORD='" + password + "'";
	result = stmt.executeQuery(query);
	result.last();
	resultRow = result.getRow();
	if(resultRow == 1) {
		session.setAttribute("userid", userid);
	}
	
	response.sendRedirect("index.jsp");

%>
<%-- <% --%>
// 	request.setCharacterEncoding("UTF-8");
// 	String userid = request.getParameter("userid");
// 	String password = request.getParameter("password");
	
// 	if(userid != null && userid.equals(password)){
// 		session.setAttribute("userid", userid);
// 	}
	
// 	response.sendRedirect("index.jsp");
<%-- %> --%>