
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
body{
     margin: 0;
     font-family: Montserrat, sans-serif;
     letter-spacing:2px;
     border: 0;
        
  }
  #customers th {
  border: 0.5px solid #ddd;
  background-color: #7FFFD4;
  padding: 8px;
}
.th-style
{ width: 25%;}
</style>
</head>
<body>




<table id="customers">
          <tr>
          <th>Email of Customer</th>
            <th scope="col">Product Name</th>
            <th scope="col">Product Image</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">T-ID</th>
              <th scope="col">Status</th>
          </tr>
        <%
        try
        {
        	Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='Delivered'");
        	while(rs.next())
        	{
        	
        %>	
        	
        	
    
        
          <tr>
          <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(19)%></td>
             <td> <img src="../css/images/<%=rs.getString(18) %>" width="100" height="100"></td>
            <td><%=rs.getString(4)%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
               <td><%=rs.getString(8)%></td>
                <td><%=rs.getString(9)%></td>
                 <td><%=rs.getString(10)%></td>
             <td><%=rs.getString(12)%></td>
              <td><%=rs.getString(13)%></td>
               <td><%=rs.getString(14)%></td>
               <td><%=rs.getString(15)%></td>
               <td><%=rs.getString(16)%></td>
              </tr>
              <%
        	}}
           catch(Exception e)
        {
        	System.out.println(e);
        	   
        }%>
         
        </table>
      <br>
      <br>
      <br>

</body>
</html>