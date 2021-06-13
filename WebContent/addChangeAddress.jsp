<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or Change Address</title>
<style>
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  border-style: solid;
  border-width: 3px;
  height: 50%;
  width: 40%;
  background-color:  #7fff98d4;
 }
</style>
</head>
<body>
<%
String msg = request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 class="alert">Address Successsfully Updated !</h3>
<%} %>
<% 
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%} %>

<% 
try{
	Connection con = ConnectionProvider.getCon();
	Statement st= con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next())
	{
	   
	
%>
<div class="center">
<img src="css/images/addlo2.gif" class="center" alt=""  >
<form method="post" action="addChangeAddressAction.jsp" >
<h3>Enter Address</h3>
<input class="input-style" type="text" name="address" value="<%=rs.getString(8) %>" placeholder="Enter Address">
<hr>
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=rs.getString(9) %>" placeholder="Enter Your City"> 
<hr>
<h3>Enter State</h3>
 <input class="input-style" type="text" name="state" value="<%=rs.getString(10) %>" placeholder="Enter Your State">
<hr>
<h3>Enter country</h3>
 <input class="input-style" type="text" name="country" value="<%=rs.getString(11) %>" placeholder="Enter Your Country">
<hr>
 <button class="button" type="submit" >Save<i class='far fa-arrow-alt-circle-right'></i></button>
<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
</form>
</div>
</body>
<br><br><br>
</html>