<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
</head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
h3
{
	color: green;
	text-align: center;
}
td, th {
  border: 0.5px solid #e4bbff;
  padding: 8px;
  letter-spacing: 3px;
}

td button{
       background-color: #94f9a3;
  border: none;
  color: black;
  padding: 12px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  margin-left:5%;
  font-size: 16px;
  width: 90%;
   border-radius:25px 25px 25px 25px;
   border-style: solid;
   border-width: 3px;
}
tr:nth-child(even){background-color:  #E0FFFF;}

tr:hover {background-color: #f5f4c5;}

th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color:#91f7f0;
  color: black;
}


</style>
</head>
<body>
 <div >
          <marquee >
                        <h2  style="background-color:red; size: -30px;color: seashell;"><i>Create Your Own Life With The Help Of Books.Drive the road of knowledge with the best collection of book..<i></i></h2> 
          
          </marquee>
        </div>
<%
String msg=request.getParameter("msg");
if("added".equals(msg))
{
%>
<h3 class="alert">Product added successfully!</h3>
<%} %>
<%
if("exist".equals(msg))
{
%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%} %>
<%
if("invalid".equals(msg))
{ 
%>
<h3 class="alert">Something went wrong! Try Again</h3>
<%}%>

<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Book Image</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<% 
try{
    
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs=st.executeQuery("select * from product where active='Yes'");
    while(rs.next())
    {

%>
       <tr>
            <td><b><%=rs.getString(1) %></b></td>
            <td><img src="css/images/<%=rs.getString(2)%>" width="150" height="150"></td>
            <td><b><%=rs.getString(3) %></b></td>
            <td><b><%=rs.getString(4) %></b></td>
            <td><i class="fa fa-inr"><b><%=rs.getString(5) %></b></i> </td>
            <td><button><a href="addToCartAction.jsp?id=<%=rs.getString(1) %>"><b>Add to cart</b> <i class='fas fa-cart-plus'></i></a></button></td>
          </tr>
<%
}
}
catch(Exception e)
{
System.out.println(e);
}%>
        </tbody>
      </table>
      <br>
      <br>
      <br>


</body>
</html>