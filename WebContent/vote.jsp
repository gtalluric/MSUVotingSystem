<%@page import="edu.msu.isa.JDBC.SQLServer"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="assets/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="assets/css/bootstrap-theme.css"
	type="text/css" />
<link rel="stylesheet" href="assets/css/style.css" type="text/css" />
<link href="assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://s3.amazonaws.com/hayageek/libs/jquery/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="assets/css/style.css" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
	
</script>
<script src="assets/js/bootstrap.min.js"></script>

<script>

$(function() {
  $( "#accordion" ).accordion();
});

</script>



</head>
<body>
<%

String email = request.getParameter("email");
	String image = request.getParameter("image");
	String name = request.getParameter("name");
	String id = request.getParameter("id");%>
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
				<br>
				<ol class="breadcrumb">
					<li><a
						href="home.jsp?email=<%=email%>&image=<%=image%>&name=<%=name%>&id=<%=id%>">Home</a></li>
					<li class="active">Vote</li>
				</ol>
			</div>
		</div>
	</div>
	<%
		String PositionID = "☻";
		String PositionTitle = "◘";
		int NumberOfPositions = 1;
		String Term = "♠";
		String LastName = "♦";
		String FirstName = "♥";
		String Email = "]";
		String StudentID = "[";
		String imgurl = "/";
		String Description = ".";
		String Bio = "-";
		String ProfileID = "↨";
		try {

			Connection connection = SQLServer.getSQLServerConnection();

			Statement statement = connection.createStatement();

			String sql = "SELECT * FROM VMS_Position";

			ResultSet rs = statement.executeQuery(sql);
	%>
	<div class="row">
		
		<div class="col-lg-12">
			<ul id="mytabs" class="nav nav-tabs nav-justified">
				<%
					
					while (rs.next()) {
							PositionID = rs.getString(1);
							PositionTitle = rs.getString(2);
													
				%>
				<li><a href="#<%=PositionTitle%>"
					data-toggle="tab"><i class="fa fa-tree"></i> <%=PositionTitle%> </a></li>
				<%
					}
				%>
			</ul>
			<%
				connection.close();
				}

				catch (Exception e) {
					e.printStackTrace(response.getWriter());
				}
			%>

<div id="myTabContent" class="tab-content">

			<%
				try {

					Connection connection = SQLServer.getSQLServerConnection();

					Statement statement = connection.createStatement();

					String sql2 = "SELECT        VMS_Profile.PositionID, VMS_Position.PositionTitle, VMS_Student.Term, VMS_Student.LastName, VMS_Student.FirstName, VMS_Student.Email,VMS_Student.StudentID, VMS_Student.imgurl,VMS_Profile.Description, VMS_Profile.Bio, VMS_Profile.ProfileID FROM            VMS_Profile  FULL OUTER JOIN                         VMS_Student ON VMS_Profile.StudentID = VMS_Student.StudentID						 inner join						 VMS_Position on VMS_Profile.PositionID = VMS_Position.PositionID";

					ResultSet rs1 = statement.executeQuery(sql2);

					while (rs1.next()) {
						PositionID = rs1.getString(1);
						PositionTitle = rs1.getString(2);
						Term = rs1.getString(3);
						LastName = rs1.getString(4);
						FirstName = rs1.getString(5);
						Email = rs1.getString(6);
						StudentID = rs1.getString(7);
						imgurl = rs1.getString(8);
						Description = rs1.getString(9);
						Bio = rs1.getString(10);
						ProfileID = rs1.getString(11);
			%>
			
				<div class="tab-pane fade active in" data-id= "<%=PositionTitle%>" id="<%=PositionTitle%>">
					<%
					
					%>
					<div class="container">
					<div class="col-md-6 candidate radio">
						<input class="radio-inline" type="radio" name="<%=PositionTitle%>"
							value="<%=ProfileID%>"><%=FirstName%>,
						<%=LastName%><br>
						<div class="col-md-offset-6 col-md-6 profile">
						<img height="150" width="150" src="<%=imgurl%>"/><br>
						<p>Position Title &nbsp; :<%=PositionTitle%><br>
						<p>Term &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :<%=Term%><br>
						<p>Last Name &nbsp;&nbsp;&nbsp;&nbsp; :<%=LastName%><br>
						<p>First Name &nbsp;&nbsp;&nbsp;&nbsp; :<%=FirstName%><br>
				<p>E-Mail 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	:<%=Email%><br>
	<p>Student ID  &nbsp;&nbsp;&nbsp;&nbsp; 				:<%=StudentID%><br>
						<p>Description&nbsp;&nbsp;&nbsp;&nbsp; :<%=Description%><br>
						<p>Personal Info&nbsp;&nbsp; :<%=Bio%><br>
						
						<hr/>
					</div>
					</div>					
					</div>
				</div>
				
				
				<%
				
									
				
				
						}
					%>
					</div>
					<br />
					<br />
					<br />
					<br />
					
					
					<div class="container">
			
			<button class="btn btn-success" onclick="select()"><h4>Submit Votes</h4></button>
		</div>
				<%

						connection.close();
						}

						catch (Exception e) {
							e.printStackTrace(response.getWriter());
						}
					%>
					


			<script type="text/javascript">
			var email = "<%=email%>";
		    var image = "<%=image%>";
		    var name = "<%=name%>";
		    var id = "<%=id%>";
		    var numberOfPositions = "<%=NumberOfPositions%>"; 
				function select()
				{
					var val1 = document.getElementsByName("President");
					var result1;
					
				for (var i = 0; i < val1.length; i++) {
						
							if (val1[i].checked) {
								result1 = val1[i].value;
								
							
								
								break;
						
						
						}
						

						

					}

					var val2 = document.getElementsByName("VicePresident");
					var result2;
					for (var i = 0; i < val2.length; i++) {
						if (val2[i].checked) {
							result2 = val2[i].value;
							
							break;
						}
					
					}

					var val3 = document.getElementsByName("Treasurer");
					var result3;
					for (var i = 0; i < val3.length; i++) {
						if (val3[i].checked) {
							result3 = val3[i].value;
							
							break;
						}
						
					}

					var val4 = document
							.getElementsByName("LadiesRepresentative");
					var result4;
					for (var i = 0; i < val4.length; i++) {
						if (val4[i].checked) {
							result4 = val4[i].value;
							
							break;
						}
					
					}

					var val5 = document.getElementsByName("Secretary");
					var result5;
					for (var i = 0; i < val5.length; i++) {
						if (val5[i].checked) {
							result5 = val5[i].value;
							
							break;
						}
						
					}

					var val6 = document.getElementsByName("EntertainmentHead");
					var result6;
					for (var i = 0; i < val6.length; i++) {
						if (val6[i].checked) {
							result6 = val6[i].value;
							
							break;
						}
						
					}
					
				if(result1 == undefined)
					{
					alert("President Vote is Missing");
					return;
					}
				 if(result2==undefined)
					{
					alert("VicePresident Vote is Missing");
					return;
					}
				 if(result3==undefined)
					{
					alert("treasurer Vote is Missing");
					return;
					}
				 if(result4==undefined)
					{
					alert("ladies representative Vote is Missing");
					return;
					}
				 if(result5==undefined)
					{
					alert("Secretary Vote is Missing");
					return;
					}
				 if(result6==undefined)
				{
					alert("EntertainmentHead Vote is Missing");
					return;
				}
					else
						{
					var result = result1 + "," + result2 + "," + result3 + ","
							+ result4 + "," + result5 + "," + result6;
					

					window.location.assign("calculate.jsp?string=" + result
							+ "&id=" + id + "&email=" + email + "&image="
							+ image + "&name=" + name);
						}

				}
			</script>


<script>
var uniqueIds = [];

$("div").each( function () {
    
    var id = $(this).attr("data-id");

    if ( $.inArray( id, uniqueIds ) == -1 )
        uniqueIds.push( id )

});

for ( var i = 0; i < uniqueIds.length; i++ ) {
    
    var allItems = $("[data-id='" + uniqueIds[i] + "']");    
    var firstItem = allItems.eq(0);
    var restItems = allItems.not(":eq(0)");
    
    restItems.appendTo( firstItem )

}
</script>
<script>
$('.tab-pane:empty').each(function() {
	
    $('.ding').hide();
});
</script>
<script>
function logout(){
	window.location.assign("https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8080/MSUVotingSystem/index.jsp");
}
</script>				
			</div>
		</div>
</body>
</html>