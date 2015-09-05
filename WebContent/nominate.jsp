<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="edu.msu.isa.JDBC.SQLServer"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="MSU -Voting System">
<meta name="author" content="Ganesh Talluri">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="assets/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="assets/css/bootstrap-theme.css"
	type="text/css" />
<link rel="stylesheet" href="assets/css/style.css" type="text/css" />
<link href="assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://s3.amazonaws.com/hayageek/libs/jquery/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

</head>

<body>
	<%
		String email = request.getParameter("email");
		String image = request.getParameter("image");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String StudentID = "no";
		String desc = "no";
		String bio = "no";
		String gender = "no";

		try {

			// Get Connection
			Connection connection = SQLServer.getSQLServerConnection();

			// Create statement
			Statement statement = connection.createStatement();

			String sql = "SELECT        VMS_Profile.Description, VMS_Profile.Bio,VMS_Student.StudentID, VMS_Student.Email, VMS_Student.Term, VMS_Student.imgurl, VMS_Student.FirstName, VMS_Position.PositionTitle, VMS_Student.gender FROM            VMS_Profile full outer JOIN VMS_Student ON VMS_Profile.StudentID = VMS_Student.StudentID full outer join VMS_Position on VMS_Profile.PositionID = VMS_Position.PositionID where VMS_Student.Email ='"+ email + "'";

			ResultSet rs = statement.executeQuery(sql);

			// Fetch on the ResultSet        
			// Move the cursor to the next record.
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
					MSU Voting System <small>Nomination Profile</small>
				</h1>
				<ol class="breadcrumb">
					<li><a
						href="home.jsp?email=<%=email%>&image=<%=image%>&name=<%=name%>&id=<%=id%>">Home</a></li>
					<li class="active">Nomination</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row">
			<!-- Map Column -->
			<div class="col-md-2">
			<br />
			<br />
			<br />
			<br />
			<br />
				<img src="<%=image%>">
			</div>
			<!-- Contact Details Column -->

			<%
				while (rs.next()) {
						String FirstName = rs.getString(7);
						String term = rs.getString(5);
						StudentID = rs.getString(3);
						bio = rs.getString(2);
						desc = rs.getString(1);
						String Position = rs.getString(8);
						gender = rs.getString(9);
			%>
			
			<h3 class="text-center">Profile Details</h3>
			<hr/>
			<div class="col-md-9 col-md-offset-1">
				
				
					<div class="col-md-4">
						<b>Display Name :</b>
					</div>
					<div class="col-md-5">
						<%=FirstName%>
					</div>
				<br />
				<br />
				
				<div class="col-md-4">
					<b>Position :</b>
					</div>
					<div class="col-md-5">
					<%=Position%>
					</div>
				<br />
				<br />
				
				<div class="col-md-4">
					<b>Term :</b>
					</div>
					<div class="col-md-5">
					<%=term%>
					</div>
				<br />
				<br />
				
				<div class="col-md-4">
					<b>Gender :</b>
					</div>
					<div class="col-md-5">
					<%=gender%>
					</div>
				<br />
				<br />
				
				
				<div class="col-md-4">
					<b>Student ID :</b>
					</div>
					<div class="col-md-5">
					<%=StudentID%>
					</div>
				<br />
				<br />
				<div class="col-md-4">
					<b>Email:</b>
					</div>	
					<div class="col-md-5"><i class="fa fa-envelope-o"></i> <abbr title="Email"></abbr>: <a
						href="mailto:name@example.com"><%=email%></a>
						</div>			
				<br />
				<br />
				
				<p></p>
			</div>
			
			<%
				}
			%>


			<%
				}

				catch (Exception e) {
				}
			%>

			<%
				try {

					// Get Connection
					Connection connection = SQLServer.getSQLServerConnection();

					// Create statement
					Statement statement = connection.createStatement();

					String sql2 = "Select * FROM VMS_Position";
			%>
			<hr/>
			<form method="post"
				action="updatenom.jsp?id=<%=StudentID%>&email=<%=email%>&image=<%=image%>&name=<%=name%>&id=<%=id%>&gender=<%=gender%>">
				<b class="">Select Position: </b>
				<select class="col-md-offset-1 "name="posid">
				
					<%
						// Execute SQL statement returns a ResultSet object.
							ResultSet rsPos = statement.executeQuery(sql2);

							// Fetch on the ResultSet        
							// Move the cursor to the next record.

							while (rsPos.next()) {
								String PositionID = rsPos.getString(1);
								String PositionName = rsPos.getString(2);
					%>
					<option value="<%=PositionID%>"><%=PositionName%></option>
					<%
						}
					%>
				</select>
				<%
					// Close connection.
						connection.close();

					}

					catch (Exception e2) {
						e2.printStackTrace(response.getWriter());
					}
				%>

				<h3>Profile Message</h3>

				<div class="control-group form-group">
					<div class="controls">
						<div class="col-md-2"><b>Bio:</b></div>
						<div class="col-md-10">
						<textarea name="bio" rows="5" cols="100" class="form-control"
							id="message" required
							data-validation-required-message="Please enter your message"
							maxlength="999" style="resize: none"><%=bio%></textarea>
						<p class="help-block"></p>
						</div>
					</div>
				</div>

				<div class="control-group form-group">
					<div class="controls">
						<div class="col-md-2"><b>Vision:</b></div>
						<div class="col-md-10">
						<textarea name="desc" rows="5" cols="100" class="form-control"
							id="message" required
							data-validation-required-message="Please enter your message"
							maxlength="999" style="resize: none"><%=desc%></textarea>
							</div>
					</div>
				</div>
				<div id="success"></div>
				<!-- For success/fail messages -->
				<button type="submit" class="btn btn-primary pull-right" value="Add">Update
					Profile</button>
			</form>
		</div>
	</div>
	<!-- /.row -->


	<hr>
<script>
function logout(){
	window.location.assign("https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8080/MSUVotingSystem/index.jsp");
}
</script>
	<!-- Footer -->
	<footer class="container">
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; Your Website 2014</p>
			</div>
		</div>
	</footer>

	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Contact Form JavaScript -->
	<!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

</body>

</html>
