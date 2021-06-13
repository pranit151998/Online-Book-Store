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
</style>
</head>

<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
             <th scope="col">Product Image</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
            </tr>
           
        </thead>
        <tbody>
<%
int sno=0;
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from cart inner join product where cart.product_id = product.id and cart.email='"+email+"' and cart.orderDate is not NULL");
	while(rs.next()){
	sno = sno+1;

%>
          <tr>
            <td><%out.println(sno); %></td>
            <td><%=rs.getString(19) %></td>
            <td><%=rs.getString(20) %></td>
            <td> <img src="css/images/<%=rs.getString(18) %>" width="150" height="150"></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(21) %> </td>
            <td><%=rs.getString(4) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(6) %> </td>
             <td><%=rs.getString(12) %></td>
              <td><%=rs.getString(13) %></td>
               <td><%=rs.getString(14) %></td>
               <td><%=rs.getString(16) %></td>
            </tr>
          <%
            }
            }
            catch(Exception e){System.out.println(e);}
            %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>