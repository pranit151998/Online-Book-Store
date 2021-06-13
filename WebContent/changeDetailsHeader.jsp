<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
<div class="topnav sticky">
             <%String email = session.getAttribute("email").toString(); %>
            <a href="home.jsp"><i class='fas fa-arrow-circle-left'>Back</i></a>
             <a href="changeDetails.jsp">(<%out.println(email); %>) <i class='fas fa-user-alt'></i></a>
            <a href="changePassword.jsp">Change Password <i class='fas fa-key'></i></a>
            <a href="addChangeAddress.jsp">Add or change Address <i class='fas fa-map-marker-alt'></i></a>
            <a href="changeSecurityQuestion.jsp">Change Security Question <i class="fa fa-repeat"></i></a>
            <a href="changeMobileNumber.jsp">Change Mobile Number <i class='fas fa-phone'></i></a>
          </div>
           <br>
           <!--table-->
</body>
</html>