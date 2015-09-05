<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="edu.msu.isa.jdbc.DateStore"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
DateStore ds = (DateStore)session.getAttribute("df");
String type=request.getParameter("type");
String email=request.getParameter("email");
String image=request.getParameter("image");
String name=request.getParameter("name");
String id=request.getParameter("id");
if(type.compareTo("nomination")==0)
{
%>
<h2>Sorry, you are here at wrong time! Please come back between <%=ds.getNomStartDate()%> and <%=ds.getNomEndDate()%></h2>

<%
}
else if(type.compareTo("vote")==0)
{
%>
	<h2>Sorry, you are here at wrong time! Please come back between <%=ds.getVoteStartDate()%> and <%=ds.getVoteEndDate()%></h2>

<%
}
else
{
%>
<h2>Sorry, you are here at wrong time! Please come back on <%=ds.getResultDate()%></h2>
<%
}
%>

<a href="home.jsp?email=<%=email%>&image=<%=image%>&name=<%=name%>&id=<%=id%>">Back</a>
</body>
</html>