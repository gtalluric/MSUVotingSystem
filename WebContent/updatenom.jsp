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
<title>Insert title here</title>
</head>
<body>
<% 
String email = request.getParameter("email");
String image = request.getParameter("image");
String name = request.getParameter("name");
	String id = request.getParameter("id");
String posid =  request.getParameter("posid");
String bio = request.getParameter("bio");
String desc = request.getParameter("desc");
String gender = request.getParameter("gender");
try
{
	
	
	// Get Connection
	Connection connection = SQLServer.getSQLServerConnection();

	// Create statement
	Statement statement = connection.createStatement();
	if(gender.contentEquals("Male") && posid.contentEquals("4"))
	{
	%>
		<script type="text/javascript">
			alert("You cannot nominate for position of Ladies Representative");
		</script>
		
		<jsp:include page="nominate.jsp"></jsp:include>
		
		
	<%
	}
	else
	{
		String sql = "IF (NOT EXISTS(SELECT * FROM VMS_Profile where VMS_Profile.StudentID = '"+id+"')) 			BEGIN		    INSERT INTO VMS_Profile( StudentID, PositionID, Description, Bio) 			Values('"+id+"', '"+posid+"','"+desc+"','"+bio+"')		    Select VMS_Student.StudentID from VMS_Profile Inner join VMS_Student ON VMS_Profile.StudentID = VMS_Student.StudentID		END 		ELSE 		BEGIN 		    UPDATE VMS_Profile		    SET PositionID = '"+posid+"', Description = '"+desc+"',	Bio = '"+bio+"'		from VMS_Profile			inner join VMS_Student			on VMS_Profile.StudentID = VMS_Student.StudentID		    WHERE VMS_Profile.StudentID = '"+id+"'	END ";
		
		
		int i = statement.executeUpdate(sql);
		if(i>0)
	    {
			%> <script type="text/javascript">
			alert("Profile Updated Successfully");
		</script>
		<jsp:include page="nominate.jsp"></jsp:include>
<%
}
	    
	        
	    }
	}



	



catch (Exception e)
{
	e.printStackTrace(response.getWriter());
}

	%>
</body>
</html>