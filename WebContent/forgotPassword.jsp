<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Forgot Password Form</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

		<!-- STYLE CSS -->
		<link rel="stylesheet" href="css/style3.css">
	</head>

	<body>

		<div class="wrapper" style="background-image: url('css/images/b2.jpg ');">
			<div class="inner">
				<div class="image-holder">
					<img src="css/images/lock3.gif" alt="">
				</div>
				<form action="forgotPasswordAction.jsp" method="post">
					<h3>Forgot Password Form</h3>
		
					<div class="form-wrapper">
						<input type="email" name="email" placeholder="Email Address" class="form-control">
					
						<i class="zmdi zmdi-email"></i>
					</div>
					<div class="form-wrapper">
						<input type="tel" name="mobileNumber" pattern="[789][0-9]{9}" title="Mobile number should start with 7,8,or 9 and should be atleast 10 digits" placeholder="Mobile Number" class="form-control">
						<i class="zmdi zmdi-whatsapp"></i>
					</div>
						<div class="form-wrapper">
	
							<select name="question" id="" class="form-control">
							<option value="What is your favourite car?" >What is your favourite car?</option>
							<option value="What is your  favourite pet animal?">What is your favourite pet animal?</option>
							<option value="What is your  favourite food">What is your favourite food?</option>
						</select>
						<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
		              </div>
					<input type="text" name="answer"  placeholder="Enter Answer" class="form-control">
					
					<div class="form-wrapper">
						<input type="password" name="newPassword" placeholder="Enter Your New Password To Set" class="form-control">
						<i class="zmdi zmdi-lock"></i>
						
					</div>
					<div class="form-wrapper">
					<h2><a href="login.jsp">Login</a></h2>
					
					</div>
					<div class="whysign">
					<%
					String msg=request.getParameter("msg");
					if("done".equals(msg))
					{
					 %>
					    <h2>Password Changed Successfully!</h2>
					<%}%>
					<%
					if("invalid".equals(msg))
					{
					%>
					<h2>Some thing Went Wrong! Try Again!</h2>
					
					<%} %>
					</div>
					
					<button>Save
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
				</form>
				
			</div>
		</div>
		
	</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>