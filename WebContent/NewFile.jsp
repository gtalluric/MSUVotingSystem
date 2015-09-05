<%@page import="edu.msu.isa.JDBC.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<% 
try {

// Get Connection
Connection connection = SQLServer.getSQLServerConnection();

// Create statement
Statement statement = connection.createStatement();

String sql = "Select * FROM NNNNNN";

// Execute SQL statement returns a ResultSet object.
ResultSet rs = statement.executeQuery(sql);

// Fetch on the ResultSet        
// Move the cursor to the next record.

while (rs.next()) {
 String NomStartDate = rs.getString(2);
 String NomEndDate = rs.getString(3);
String VoteStartDate = rs.getString(4);
String VoteEndDate = rs.getString(5);
String ResultDate = rs.getString(4);


}



// Close connection.
connection.close();
}
 catch(Exception e)
{
	 e.printStackTrace();
}
 %>

</body>
</html>