<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp"%>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title> Bill </title>
<style>
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  border-style: solid;
  border-width: 3px;
  height: 90%;
  width: 90%;
  background-color:  #7fff98d4;
 }
 .centi{
  display: block;
  margin-left: auto;
  margin-right: auto;
  border-style: solid;
  border-width: 3px;
  height: 20%;
  width: 20%;
 }
</style>
</head>

<body>


<div class="center">
<%
String email=session.getAttribute("email").toString();
try{
	int total = 0;
	int sno = 0;
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
	while(rs.next()){
		total = rs.getInt(1);
	}
	ResultSet rs2 = st.executeQuery("select * from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
	while(rs2.next())
	{
%>
<h1 style="align: left">&nbsp;Invoice</h1>
<h2 style="align: left">&nbsp;Customer Care No :18002029898</h2>


<hr>
<h3 style="text-align: center">Email:  <%out.println(email); %></h3>
<h3 style="text-align: center">Customer Name: <%=rs2.getString(1) %> <%=rs2.getString(2) %> </h3>
<h3  style="text-align: center">Mobile Number:  <%=rs2.getString(24) %></h3> 

                                           <div class="right-div"><h3>Country: <%=rs2.getString(23) %> </h3></div> 
<div class="left-div"><h3>Order Date:  <%=rs2.getString(25) %> </h3></div><div class="right-div"><h3>Address: <%=rs2.getString(20) %> </h3></div>
<div class="left-div"><h3>Payment Method:  <%=rs2.getString(27) %></h3></div><div class="right-div"><h3>City:  <%=rs2.getString(21) %></h3></div>
<div class="left-div"><h3>&nbsp;Expected Delivery:  <%=rs2.getString(26) %></h3></div> <div class="right-div"><h3>State:  <%=rs2.getString(22) %></h3></div>
<div class="left-div"><h3>Transaction Id:  <%=rs2.getString(28) %></h3></div>


















 


 

<hr>
<%
break;
} 
%>

	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
  ResultSet rs1 = st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill'");
  while(rs1.next()){
	  sno = sno+1;
	  
  %>
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rs1.getString(19) %></td>
    <td><%=rs1.getString(20) %></td>
    <td><%=rs1.getString(21) %></td>
    <td><%=rs1.getString(4) %></td>
     <td><%=rs1.getString(6) %></td>
  </tr>
  <tr>
<%} %>
</table>
<h3 style="text-align: right">Total: <%out.println(total); %>/-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
<a href="continueShopping.jsp"><button class="button left-button" id="continueshopping">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button" id="printy">Print</button></a>
<br><br><br><br>
<%
}
catch(Exception e){
System.out.println(e);
}

%>
</div>
</body>
</html>