<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add New Product</title>
<style>
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  border-style: solid;
  border-width: 3px;
  height: 80%;
  width: 80%;
  background-color:  #7fff98d4;

 }
 .centeri{
   display: block;
  margin-left: 40%;
  margin-right: auto;
  border-style: solid;
  border-width: 3px;
  height: 0%;
  width: 20%;
 }
 
 body{
background-image: url('../css/images/w1.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}
</style>
</head>
<body>
<%
String msg = request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Added Successfully!</h3>
<%}%>
<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<% } %>

	


<div class="center">
<img src="../css/images/addnew3.gif" class="centeri" alt="" />
	<br>
<% 
int id =1;
try{
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("Select max(id) from product");
    while(rs.next()){
        id = rs.getInt(1);
        id= id+1;
    }
}
catch(Exception e){}
%>
<form action="addNewProductAction.jsp" method="post">
<h3 style="color: 	#6A5ACD">Book ID: <%out.println(id); %></h3>
<input type="hidden" name="id" value="<%out.println(id); %>">

<div class="left-div">
 <h3>Enter Name of the Book</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter Name of the Book" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Course of the Book</h3>
 <input class ="input-style" type="text" name="category" placeholder="Enter Course of the Book" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price of the Book</h3>
 <input class ="input-style" type="number" name="price" placeholder="Enter A Price" required>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
   <select class="input-style" name="active">
   <option value="Yes"> Yes </option>
   <option value="No"> No </option>
   </select>
<hr>
</div>

<h3>Enter Image for the Book</h3>
<br>

<div class="fili">
<input type="file" align="center" id="myFile" name="filename">
</div>
<br>
<br>
<br>
<br>
<button class="button"><b>Save the Product</b> <i class="fas fa-arrow-alt-circle-right"></i> </button>
</form>
</div>
</body>
</html>