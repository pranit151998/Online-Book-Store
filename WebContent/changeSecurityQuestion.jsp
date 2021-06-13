<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
<style>
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  border-style: solid;
  border-width: 3px;
  height: 80%;
  width: 37%;
  background-color:  #7fff98d4;
 }

</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%} %>
<% 
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>

<%} %>
<div class="center">
<img src="css/images/cq1.gif" class="center" alt=""  >
<form action="changeSecurityQuestionAction.jsp" method="post">
&nbsp;&nbsp;&nbsp;<h3>Select Your New Securtiy Question</h3>
&nbsp;&nbsp;&nbsp; <select class="input-style" name="securityQuestion" >
 <option value="What is your favourite car?">What is your favourite car?</option>
 <option value="What is your  favourite animal">What is your  favourite pet animal?</option>
 <option value="What is your  favourite food">What is your  favourite food</option>
</select> 
&nbsp;&nbsp; <hr>
&nbsp;&nbsp;<h3>Enter Your New Answer</h3>
&nbsp;&nbsp; <input class="input-style" type="text" name="newAnswer" placeholder="Enter Your New Answer" required>
&nbsp;&nbsp; <hr>
&nbsp;&nbsp;<h3>Enter Password (For Security)</h3>
&nbsp;&nbsp;<input class="input-style" type="password" name="password" placeholder="Enter Password(For Security)" required>
&nbsp;&nbsp;<hr>
 <button class="button" type="submit">Save  <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</div>
</body>
<br><br><br>
</html>