<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>

<%
	String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	String USER_NAME ="university";
	String USER_PASSWD ="comp322";
	
	Connection conn = null;
	Statement stmt = null;
	// Load a JDBC driver for Oracle DBMS
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// Get a Connection object 
// 	System.out.println("Driver Loading: Success!");
	conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);
	System.out.println("connected");
	
	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
	
%>