<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="edu.msu.isa.JDBC.SQLServer"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://s3.amazonaws.com/hayageek/libs/jquery/bootstrap.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>



<%
String email = request.getParameter("Email");
String name = request.getParameter("Name");
String image = request.getParameter("Image");

try
{ 

Connection connection = SQLServer.getSQLServerConnection();

//Create statement
Statement statement = connection.createStatement();
String str = "Update Student SET imgurl='"+image+"' Where Email ='"+email+"'";
int i = statement.executeUpdate(str);
connection.close();
}
catch (Exception e)
{
}
	%>
	<p><%=email %></p><%
// Get Connection

try{
Connection connection = SQLServer.getSQLServerConnection();

// Create statement
Statement statement = connection.createStatement();

String sql = "Select StudentID,Email FROM VMS_Student where Email='"+email+"'";
ResultSet rs = statement.executeQuery(sql);

if(rs.next())
{

	String studentid = rs.getString(1);
	
	 response.sendRedirect("home.jsp?email="+email +"&name="+name +"&image="+image+"&id="+studentid);
	 
}
else
{
	%>
	<script>
	alert("You must be an authorized  user");
	window.location.assign("index.jsp");
	</script>
	
	
	<%
	connection.close();
}
}
catch(Exception e)
{

}
%>
</body>
</html>