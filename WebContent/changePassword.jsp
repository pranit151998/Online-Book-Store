<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
<style>
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  border-style: solid;
  border-width: 3px;
  height: 60%;
  width: 37%;
  background-color:  #7fff98d4;
}

</style>
</head>
<body>
<%

String msg=request.getParameter("msg");
if("notMatch".equals(msg))
{
%>	
<h3 class="alert">New password and Confirm password does not match!</h3>
<%}%>
<% 
if("wrong".equals(msg))  
{  
	%>
}
<h3 class="alert">New password and Confirm password does not match!</h3>

<h3 class="alert">Your old Password is wrong!</h3>
<%}%>
<% 
if("done".equals(msg))  
{  
	%>
<h3 class="alert">Password change successfully!</h3>
<%}%>
<% 
if("invalid".equals(msg))  
{  
	%>
<h3 class="alert">Some thing went wrong! Try again!</h3>

<%}%>
<div class="center">
<img src="css/images/lock1.gif" class="center" alt=""  >
<form action="changePasswordAction.jsp" method="post">
&nbsp;&nbsp;<h3>Enter Old Password</h3>
&nbsp;&nbsp; <input class="input-style" type="password" name="oldPassword" placeholder="Enter Old Password" required> 
&nbsp;&nbsp;  <hr>
&nbsp;&nbsp; <h3>Enter New Password</h3>
&nbsp;&nbsp; <input class="input-style" type="password" name="newPassword" placeholder="Enter New Password" required> 
&nbsp;&nbsp; <hr>
&nbsp;&nbsp;<h3>Enter Confirm Password</h3>
&nbsp;&nbsp;<input class="input-style" type="password" name="confirmPassword" placeholder="Enter Confirm Password" required> 
&nbsp;&nbsp;<hr><br>
 <button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</div>
</body>

<br><br><br>
</html>