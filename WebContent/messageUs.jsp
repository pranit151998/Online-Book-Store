<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
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
<br>
<%
String msg =request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 style="text-align:center; color:green;">Message successfully sent. Our team will contact you soon!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 style="text-align:center; color:green; ">Some thing Went Wrong! Try Again!</h3>
<%} %>
<div class="center">
<img src="css/images/chat6.gif" class="center" alt="" ><br><br>
<form action="messageUsAction.jsp" method="post">
&nbsp;&nbsp;<input class="input-style" name="subject" type="text" placeholder="Enter your Subject" required>
&nbsp;&nbsp;<hr>
&nbsp;&nbsp;<textarea class="input-style" name="body" placeholder="Enter Your Body" required></textarea>

&nbsp;&nbsp;<hr>
<button class="button" type="submit">Send  <i class="far fa arrow-alt-circle-right"></i></button>
</form>
</div>

</body>
</html>