<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.text.DateFormat"%>
<%@page import="edu.msu.isa.JDBC.SQLServer"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="edu.msu.isa.JDBC.DateStore"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

 

try
{
	

// Get Connection
Connection connection = SQLServer.getSQLServerConnection();

// Create statement
Statement statement = connection.createStatement();



String id =  request.getParameter("id");
String email =  request.getParameter("email");
String image =  request.getParameter("image");
String name =  request.getParameter("name");
String result = request.getParameter("string");

String sql1 = "Select * from VMS_vote where StudentID='"+id+"'";

ResultSet rs1 = statement.executeQuery(sql1);
if (rs1.next())
{
	%>
	<script type="text/javascript">
	alert("You cannot vote for second time");
	

	</script>
	<jsp:include page="home.jsp"></jsp:include>
	
	<%
}
else
{


String array [] = result.split(",");

for(int i = 0; i <array.length;i++)
{
	String sql = "Insert into VMS_Vote(StudentID,ProfileID) values ('"+Integer.parseInt(id)+"','"+ Integer.parseInt(array[i]) +"')";
	
	int n = statement.executeUpdate(sql);
}

%>
<script type="text/javascript">
alert("Your vote is registered");

</script>
<jsp:include page="home.jsp"></jsp:include>
<%
//response.sendRedirect("home.jsp?email="+email +"&name="+name +"&image="+image+"&id="+id);
}
}
catch (Exception e)
{
	e.printStackTrace (response.getWriter()); 
}

%>

</body>
</html>