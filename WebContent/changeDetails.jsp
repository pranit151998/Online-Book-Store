<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<title>Change Details</title>
<style>
hr
{width:70%;}

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
<br>
<br>
<div class="center">
	<img src="css/images/veri1.gif" class="center" alt=""  >
	<br>

<%
try
{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next())
	{
		
%>
<h3>Name:<%=rs.getString(1)%> <%=rs.getString(2)%></h3>
<br>

 <h3>Email:<%=rs.getString(4)%> </h3>
<br>
 <h3>Mobile Number:<%=rs.getString(5)%>  </h3>
<br>
<h3>Security Question: <%=rs.getString(12)%> </h3>

      <br>
      <br>
      <br>
<%
}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</div>
</body>
</html>