<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Team3#</title>
</head>
<body>

	<%!
		public void makeTable(JspWriter out, Connection conn, String query) {
		try{
			ResultSet result;
			PreparedStatement pstmt = conn.prepareStatement(query);
			result = pstmt.executeQuery();
			
			out.println("<table style='border-collapse: collapse;'>");
			out.println("<tr style='border-bottom: solid 1px black; background-color:#DFDFDF;'>");
			// make table header (use ResultSet's meta data)
			for(int i=1; i<=result.getMetaData().getColumnCount(); i++)
				out.println("<td style='padding: 5px;'>" + result.getMetaData().getColumnName(i) + "</td>");
			out.println("</tr>");
			
			// make table rows
			while(result.next()){
				out.println("<tr style='border-bottom: solid 1px black;'>");
				for(int i=1; i<=result.getMetaData().getColumnCount(); i++)
					out.println("<td style='padding: 5px;'>" + result.getString(i) + "</td>");
				out.println("</tr>");
			}
			out.println("</table>");
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		}
	%>
			
	<%
	
		String IP = "localhost";
		String SID = "orcl";
		String PORT = "1521";
		String USER = "UNIVERSITY";
		String PASSWORD = "comp322";
		String URL = "jdbc:oracle:thin:@" + IP + ":" + PORT + ":" + SID;
	
		String q1Pname = request.getParameter("q1Pname");
		String q1Dnumber = request.getParameter("q1Dnumber");
		String q1Salary = request.getParameter("q1Salary");
		String q2Supervisor = request.getParameter("q2Supervisor");
		String q2Address = request.getParameter("q2Address");
		String q3Pname = request.getParameter("q3Pname");
		String q4Pname = request.getParameter("q4Pname");
		String q4WorkingHours = request.getParameter("q4WorkingHours");
		String q5Supervisor = request.getParameter("q5Supervisor");
		String qry = request.getParameter("query");
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
		
		out.println("<h1>Lab #9: Repeating Lab #5-3 vi JSP</h1>");
		
		out.println("<h2>------ Q1 Result ------</h2>");
		String query1 = "SELECT LNAME, MINIT, FNAME FROM EMPLOYEE E WHERE EXISTS (SELECT * FROM WORKS_ON NATURAL JOIN PROJECT WHERE PNAME='" + q1Pname + "' AND ESSN=E.SSN) AND DNO=" + q1Dnumber + " AND SALARY>="+ q1Salary + " ORDER BY LNAME" ;
		makeTable(out, conn, query1);
		
		String query2 = "SELECT DNAME, SSN, LNAME FROM EMPLOYEE JOIN DEPARTMENT ON DNUMBER=DNO WHERE SUPER_SSN='" + q2Supervisor + "' AND ADDRESS LIKE '%" + q2Address + "%'";
		out.println("<h2>------ Q2 Result ------</h2>");
		makeTable(out, conn, query2);
		
		String query3 = "SELECT LNAME, HOURS FROM (EMPLOYEE JOIN WORKS_ON ON SSN=ESSN) JOIN PROJECT ON PNO=PNUMBER WHERE PNAME='" + q3Pname + "' ORDER BY HOURS DESC";
		out.println("<h2>------ Q3 Result ------</h2>");
		makeTable(out, conn, query3);
		
		String query4 = "SELECT FNAME, LNAME, HOURS FROM (EMPLOYEE JOIN WORKS_ON ON SSN=ESSN) JOIN PROJECT ON PNO=PNUMBER WHERE PNAME='" + q4Pname + "' AND HOURS>="+ q4WorkingHours + " ORDER BY HOURS";
		out.println("<h2>------ Q4 Result ------</h2>");
		makeTable(out, conn, query4);
		
		String query5 = "SELECT FNAME, LNAME, DEPENDENT_NAME, RELATIONSHIP FROM EMPLOYEE JOIN DEPENDENT ON SSN=ESSN WHERE SUPER_SSN='" + q5Supervisor + "'";
		out.println("<h2>------ Q5 Result ------</h2>");
		makeTable(out, conn, query5);
		
		out.println(qry);
	%>

</body>
</html>