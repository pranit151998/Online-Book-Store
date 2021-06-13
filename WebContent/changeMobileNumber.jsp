<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Mobile Number</title>
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

body{
background-image: url('css/images/w1.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}
</style>
</head>
<body>
<%
String msg= request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%} %>
<% 
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
<div class="center">
<img src="css/images/con1.gif" class="center" alt=""  >
<form action="changeMobileNumberAction.jsp" method="post">

&nbsp;&nbsp; <h3>Enter Your New Mobile Number</h3>
&nbsp;&nbsp; <input class="input-style" type="tel" name="mobileNumber" pattern="[789][0-9]{9}" title="Mobile number should start with 7,8,or 9 and should be atleast 10 digits" placeholder="Mobile Number" required>
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