<%@include file="dbConnect.jsp"%>
<%
	String query;
	ResultSet result;
	int resultRow;
	
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String account = request.getParameter("account");
	String userType = null;
	
	if (account.equals("admin")){
		userType = "admin";
		query = "SELECT * FROM ADMIN WHERE adminID='" + userid + "' AND PASSWORD='" + password + "'";
		result = stmt.executeQuery(query);
		result.last();
		resultRow = result.getRow();
	}else{
		userType = "user";
		query = "SELECT * FROM PLAYER WHERE PlayerID='" + userid + "' AND PASSWORD='" + password + "'";
		result = stmt.executeQuery(query);
		result.last();
		resultRow = result.getRow();
	}
	
	if(resultRow == 1) {
		session.setAttribute("userid", userid);
		session.setAttribute("account", userType);
	}
	

	response.sendRedirect("index.jsp");

%>
