<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

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
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
if(window.history.forward(1)!=null)
	window.history.forward(1);</script>

</head>
<body>
<br>
<table border=1px>
<thead>
<% 
    String email=session.getAttribute("email").toString();
    int total=0;
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
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
          <th scope="col">Product Image</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
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
          <td><b><% out.println(sno);%></b></td>
            <td> <img src="css/images/<%=rs.getString(2) %>" width="150" height="150"></td>
            <td><b><%=rs.getString(3) %><b></td>
            <td><b><%=rs.getString(4) %><b></td>
            <td><b><i class="fa fa-inr"></i> <%=rs.getString(11)%><b></td>
            <td><b><%=rs.getString(10)%> <b></td>
            <td><b><i class="fa fa-inr"></i> <%=rs.getString(12)%><b></td>
            </tr>
         <%
         }
         
         
         ResultSet rs2=st.executeQuery("select * from users where email='"+email+"'");
         while(rs2.next())
         {
        	 
        	 
        	 
   
    
         %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
<div class="left-div">
 <h2>Enter Address</h2>
<input class="input-style" type="text" name="address" value="<%=rs2.getString(8)%>" placeholder="Enter Address" required>
 </div>

<div class="right-div">
<h2>Enter city</h2>
<input class="input-style" type="text" name="city" value="<%=rs2.getString(9)%>" placeholder="Enter City" required>

</div> 

<div class="left-div">
<h2>Enter State</h2>
<input class="input-style" type="text" name="state" value="<%=rs2.getString(10)%>" placeholder="Enter State" required>
</div>

<div class="right-div">
<h2>Enter country</h2>
<input class="input-style" type="text" name="country" value="<%=rs2.getString(11)%>" placeholder="Enter Country" required>
</div>
<h2 style="color: yellow">*If there is no address its mean that you did not set you address!</h2>
<h2 style="color: yellow">*This address will also updated to your profile</h2>
<hr style="width: 100%">
<div class="left-div">
<br>

<h2>Select way of Payment</h2><br><br><hr>
<select class="input-style" name="paymentMethod">
 <option value="Cash On Delivery(COD)">Cash On Delivery(COD)</option>
 <option value="Online Payment">Onine Payment</option>
 </select>
</div>

<div class="right-div">
<h2><a href="https://pay.google.com/gp/w/u/0/home/sendrequestmoney/signup?p2p_action=send" target="_blank"><i class="fab fa-google-pay fa-4x"></i></a></h2><hr>
<input class="input-style" type="text" name="transactionId"  placeholder="Enter Transaction ID">
<h2 style="color: yellow">*If you select online Payment please pay through Google Pay from the link above then enter you transaction ID here otherwise leave this blank</h2>
</div>
<hr style="width: 100%">

<div class="left-div">
<h2>Mobile Number</h2>
<input class="input-style" type="text" name="mobileNumber" value="<%=rs2.getString(5)%>" placeholder="Enter Mobile Number" required>

<h2 style="color: yellow"><b>*This mobile number will also updated to your profile</b></h2>
</div>
<div class="right-div">
<h2 style="color: yellow">*If you enter wrong transaction id then your order will we can cancel!</h2>
<button class="button" type="submit">Proceed To Generate Bill & Save <i class='far fa-arrow-alt-circle-right'></i></button>
<h2 style="color: yellow">*Fill form correctly</h2>
</div>
</form>

<%
         }
    }
catch(Exception e)
    {
    	System.out.println(e);
    }%>
      <br>
      <br>
      <br>

</body>
</html>