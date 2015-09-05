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
<link href="https://s3.amazonaws.com/hayageek/libs/jquery/bootstrap.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
      (function() {
       var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
       po.src = 'https://apis.google.com/js/client.js?onload=onLoadCallback';
       var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
     })();
</script>
</head>
<body>
	
	<div class="row">
<div class="well">
<input class="btn btn-primary" type="button"  value="Login" onclick="login()" />
<div id="profile"></div>
<br>
<div id="clientEmail" name="clienEmail"></div>
<br>
<input class="btn btn-primary" type="button"  value="Logout" onclick="logout()" />
</div>
</div>
<script type="text/javascript">

function logout()
{
	gapi.auth.signOut();
	location.reload();
}
function login() 
{
  var myParams = {
    'clientid' : '292886681112-8rvmv9ucqa92ra2e8bil76onm9aj9oqi.apps.googleusercontent.com',
    'cookiepolicy' : 'single_host_origin',
    'callback' : 'loginCallback',
    'approvalprompt':'force',
    'scope' : 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read'
  };
  gapi.auth.signIn(myParams);
}

function loginCallback(result)
{
    if(result['status']['signed_in'])
    {
        var request = gapi.client.plus.people.get(
        {
            'userId': 'me'
        });
        request.execute(function (resp)
        {
            var email = '';
            if(resp['emails'])
            {
                for(i = 0; i < resp['emails'].length; i++)
                {
                    if(resp['emails'][i]['type'] == 'account')
                    {
                        email = resp['emails'][i]['value'];
                    }
                }
            }

            var str = "Name:" + resp['displayName'] + "<br>";
            str += "Image:" + resp['image']['url'] + "<br>";
            str += "<img src='" + resp['image']['url'] + "' /><br>";

            str += "URL:" + resp['url'] + "<br>";
            str += "Email:" + email + "<br>";
            document.getElementById("profile").innerHTML = str;
            document.getElementById("clientEmail").innerHTML = email;
            
            window.location.assign('hello.jsp?Email=' +email);
        });

    }

}
function onLoadCallback()
{
	//gapi.client.setApiKey('AIzaSyCcxiUVuHKsEAWjRsm8dMhqOHZINbVnjpY');
	gapi.client.load('plus', 'v1',function(){});
	 
}

    </script>
    
    	
    
  
</body>
</html>