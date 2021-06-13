<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
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
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>

<% 
String msg = request.getParameter("msg");
if("notPossible".equals(msg))
{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>
<% if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>
<%
if("dec".equals(msg))
{
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>
<% 
if("removed".equals(msg))
{
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>

<table>
<thead>
<%
int total =0;
int sno=0;

try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	while(rs1.next()){
		total = rs1.getInt(1);
	}

%>
          <tr>
            <th scope="col" style="background-color: yellow;">Total: <% out.println(total);%> <i class="fa fa-inr"></i> </th>
            <% if(total>0){ %><th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Product Image</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
         ResultSet rs = st.executeQuery("select * from product inner join cart on product.id = cart.product_id and cart.email='"+email+"' and cart.address is NULL");
         while(rs.next())
         {
      %>
          <tr>
       <% sno =sno +1; %>
           <td> <% out.println(sno); %></td>
           <td> <%=rs.getString(3) %></td>
           <td> <img src="css/images/<%=rs.getString(2) %>" width="150" height="150"></td>
            <td> <%=rs.getString(4) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(5)%></td>
            <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1) %>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs.getString(10)%> <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1) %>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(12)%></td>
            <td><button><a href="removeFromCart.jsp?id=<%=rs.getString(1) %>">Remove <i class='fas fa-trash-alt'></i></a></button></td>
          </tr>
<%
         }
     }
  }
catch(Exception e){
	
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>