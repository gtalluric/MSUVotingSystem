<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*, java.util.Date, java.util.Enumeration" %>
<%@page import="edu.msu.isa.JDBC.DateStore"%>
 
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
<link rel="stylesheet" href="assets/css/bootstrap-theme.css" type="text/css" />
<link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="assets/css/style.css" type="text/css" />
<link href="https://s3.amazonaws.com/hayageek/libs/jquery/bootstrap.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<title>MSU - Voting System : Home</title>
</head>
<body>

<%-- <script type="text/javascript">



</script> --%>
	<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">MSU - Voting System</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                      

<input class="btn btn-primary" type="button"  value="Logout" onclick="logout()" />
<div id="profile"></div>

<div id="clientEmail" name="clienEmail"></div>



                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
            
        </div>
        <!-- /.container -->
    </nav>

       <!-- Page Content -->
    <div class="container">
    <!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
			<br><br>				
				<ol class="breadcrumb">
					<li class="active"><a>Home</a></li>					
				</ol>
			</div>
		</div>
		<!-- /.row -->
    
		<div class="center-block">
		<img class = "img img-responsive img-circle img-center"  src="<%=request.getParameter("image")%>">
		
		<h3 class="text-center">Welcome <i> <%=request.getParameter("name")%> </i> !!!</h3>
		<h3 class="hidden">Email:<%=request.getParameter("email")%></h3><br />
		</div>
		<hr />
    </div>
    
    <div class="container">
 
  
  <br>
  	<% 
  	String image = request.getParameter("image");
  	String email = request.getParameter("email");
  	String name = request.getParameter("name");
  	String id = request.getParameter("id");
  	Calendar cal = Calendar.getInstance();
  	cal.add(cal.DATE,0);
  	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
  	String formatted = format1.format(cal.getTime());
  	
  	SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd", Locale.ENGLISH);
  		Date dt = new Date();
  	String formattedDate = df.format(dt);
  	Date date = df.parse(formattedDate);
  	
  	DateStore dFormat = (DateStore)session.getAttribute("df");
  	String nomStartDate = dFormat.getNomStartDate();
  	String nomEndDate = dFormat.getNomEndDate();
  	String voteStartDate= dFormat.getVoteStartDate();
  	String voteEndDate= dFormat.getVoteEndDate();
  	String resultDate= dFormat.getResultDate();
  	Date normStartDate= df.parse(nomStartDate);
  	Date normEndDate= df.parse(nomEndDate);
  	Date voteStDate = df.parse(voteStartDate);
  	Date voteEdDate = df.parse(voteEndDate);
  	Date rsltDate = df.parse(resultDate);
  	formatted=formatted.trim();
  	nomStartDate= nomStartDate.trim();
  	nomEndDate=nomEndDate.trim();
  	formatted = formatted.toString();
  	nomStartDate=nomStartDate.toString();
  	nomEndDate = nomEndDate.toString();
  	%>
  	<%-- <%=formatted %>
  	<%=nomStartDate %>
  	 --%>
  	<%
 		if(formatted.contentEquals(nomStartDate) || formatted.contentEquals(nomEndDate))
  		{
 	%>
 	<div class="row">
 		<div class="col-xs-4 text-left">
  		<a class="btn btn-info" role="button" href="nominate.jsp?email=<%=email%>&image=<%=image%>&name=<%=name%>&id=<%=id%>">Nominate</a>
  		<br><br>
    </div>
 		
 		  		
  		<% }
  		else
  		{
  		%>
  			<div class="col-xs-4 text-left">
  			<a class="btn btn-info" role="button" href="WrongTime.jsp?type=nomination&email=<%=email%>&image=<%=image%>&name=<%=name%>&id=<%=id%>">Nominate</a>
  			<br><br>
    	</div>	
  	
    <%
    }
    %>
    
    <%
 		if(formatted.contentEquals(voteStartDate) || formatted.contentEquals(voteEndDate))
  		{
 	%>
 	
 	<div class="col-xs-4 text-center">
     	<a class="btn btn-info" role="button" href="vote.jsp?email=<%=email%>&image=<%=image%>&name=<%=name%>&id=<%=id%>">Vote</a>
     	<br><br>
     </div>
     
 		  		
  		<% }
  		else
  		{
  		%>
  	
     <div class="col-xs-4 text-center">
  			<a class="btn btn-info" role="button" href="WrongTime.jsp?type=vote&email=<%=email%>&image=<%=image%>&name=<%=name%>&id=<%=id%>">Vote</a>
  			<br><br>
    	</div>	
     
     <%
  		}
     %>
     
     <%
 		if(formatted.contentEquals(resultDate))
  		{
 	%>
 			 <div class="col-xs-4 text-right">
 					<a class="btn btn-info" role="button" href="result.jsp?email=<%=email%>&image=<%=image%>&name=<%=name%>&id=<%=id%>">Result</a>
 					<br><br>
 				</div>	
 				
  		<% }
  		else
  		{
  		%>
 	
 	
 	<div class="col-xs-4 text-center">
  			<a class="btn btn-info" role="button" href="WrongTime.jsp?type=result&email=<%=email%>&image=<%=image%>&name=<%=name%>&id=<%=id%>">Result</a>
  			<br><br>
    	</div>
 	
 	<%
  		}
 	%>
</div>
	</div>
<!-- Footer -->
        <footer class="container">
        <hr/>
            <div class="row">
                <div class="col-md-12">                
                    <p>Copyright &copy; Murray State University 2015</p>
                </div>
            </div>
        </footer>
<script>
function logout(){
	window.location.assign("https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8080/MSUVotingSystem/index.jsp");
}
</script>
    
</body>
</html>
