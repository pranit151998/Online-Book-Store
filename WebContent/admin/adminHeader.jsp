<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>



</style>

<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
<div class="topnav sticky">

<%String email = session.getAttribute("email").toString(); %>

  <a href="addNewProduct.jsp"><i class="fas fa-plus-square"></i>Add New Books</a>
  <a href="allProductEditProduct.jsp"><i class="fas fa-edit"></i>All Books And Edit Books </a>
  <a href="messagesReceived.jsp"><i class="fas fa-comment-alt"></i>Message Received</a>
  <a href="ordersReceived.jsp"><i class="fas fa-archive"></i>Orders Received</a>
  <a href="cancelOrders.jsp"><i class="fas fa-window-close"></i>Cancel Orders</a>
  <a href="deliveredOrders.jsp"><i class="fas fa-dolly"></i>Delivered Orders</a>
    <div class="logout">
     <a href="../logout.jsp" text-><i class="fas fa-share-square"></i>Logout</a>
    </div>

</div>
</body>

</html>