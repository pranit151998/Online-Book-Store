<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>

td, th {
  border: 0.5px solid #e4bbff;
  padding: 8px;
  letter-spacing: 3px;
  font-weight:bold;
}
tr:nth-child(even){background-color: #f2f2f2;}

tr:hover {background-color: #f5f4c5;}

th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color:#91f7f0;
  color: black;
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
</style>
</head>
<body>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Image</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<% 
int z=0;
try{
    String search=request.getParameter("search");
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs=st.executeQuery("select * from product where name like '%"+search+"%' or category like '%"+search+"%' and active='Yes'");
    while(rs.next())
    {
        
        z=1;
        
    
%>

          <tr>
            <td><%=rs.getString(1) %></td>
            <td> <img src="css/images/<%=rs.getString(2) %>" width="150" height="150"></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><i class="fa fa-inr"><%=rs.getString(5) %></i> </i></td>
            <td><button><a href="addToCartAction.jsp"?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></button></td>
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
      <%if (z==0) {%>
      	
	<h1 style="color:green; text-align: center;">Nothing To Show</h1>
	<%} %>
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All Right Reserved @Pranit & @Kishan</p>
      </div>

</body>
</html>