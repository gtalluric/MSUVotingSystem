<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="edu.msu.isa.JDBC.SQLServer"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.SQLException"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="MSU -Voting System">
<meta name="author" content="Ganesh Talluri">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="assets/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="assets/css/bootstrap-theme.css" type="text/css" />
<link rel="stylesheet" href="assets/css/style.css" type="text/css" />
<link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://s3.amazonaws.com/hayageek/libs/jquery/bootstrap.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<title>Insert title here</title>

<!-- Navigation -->
<%

String email = request.getParameter("email");
	String image = request.getParameter("image");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	%>
 <!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home.jsp?email=<%=email%>&image=<%=image%>&name=<%=name%>&id=<%=id%>">MSU-Voting System</a>
			</div>
			
			<!-- Collect the nav links, forms, and other content for toggling -->
			<ul class="nav navbar-nav navbar-right">
                    <li>
                      

<input class="btn btn-primary" type="button"  value="Logout" onclick="logout()" />
<div id="profile"></div>
			</li></ul>
		</div>
		
		<!-- /.container -->
	</nav>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					MSU Voting System <small>Election Results</small>
				</h1>
				<ol class="breadcrumb">
					<li><a
						href="home.jsp?email=<%=email%>&image=<%=image%>&name=<%=name%>&id=<%=id%>">Home</a></li>
					<li class="active">Result</li>
				</ol>
			</div>
		</div>
		</div>
		
		<!-- /.row -->

		


            
            <!-- /.navbar-collapse -->
</head>
<body>


       <div class="container">
       <div class="col-md-12">
<h1 align="center">Our New  Team</h1>
<% try 
{

		

	// Get Connection
	Connection connection = SQLServer.getSQLServerConnection();

	// Create statement
	Statement statement = connection.createStatement();

	String sql = " select    distinct   PositionTitle, max(NumberOFCount) as  votes From VMS_votecount  Group By  PositionTitle order by  votes desc";
	//Execute SQL statement returns a ResultSet object.
	ResultSet rs = statement.executeQuery(sql);
	List<String> position =new ArrayList<>();
	List<String> count =new ArrayList<>();
	
	
	int i = 0;
	while(rs.next() && i<6){
	
		
		 position.add(i, rs.getString(1));
		 count.add(i, rs.getString(2));
		 i++;
	} 
	
	rs.close();
	
	String[] pstn = (String[]) position.toArray(new String[position.size()]);
	String[] cnt = (String[]) count.toArray(new String[count.size()]);
	 String FirstName = null;
		
			 
		 /* Iterator<String> postn = position.iterator();
		 Iterator<String> cnt = count.iterator(); */
		 
		for(int j=0;j<6;j++)
		 {
			 
		  String sql1 = " Select FirstName from VMS_votecount where PositionTitle ='"+pstn[j]+"' and NumberOFCount = '"+cnt[j]+"'";
		 ResultSet rs1 = statement.executeQuery(sql1);
		 
		 while(rs1.next())
		 {
			FirstName = rs1.getString(1);
		 }
		 
		%>
		<p align="center"><%=pstn[j] %> : <%=FirstName %>  </p>
		<p></p>
		
<% 		
		 
		
		 }
}
catch (Exception e)
{
	e.printStackTrace (response.getWriter());
}%>
</div>
</div>
<script>
function logout(){
	window.location.assign("index.jsp");
}
</script>
</body>
</html>