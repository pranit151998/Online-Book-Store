<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>SignUp Form</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

		<!-- STYLE CSS -->
		<link rel="stylesheet" href="css/style3.css">
	</head>

	<body>

		<div class="wrapper" style="background-image: url('css/images/b2.jpg');">
			<div class="inner">
				<div class="image-holder">
					<img src="css/images/bookg.gif" alt="">
				</div>
				<form action="signupAction.jsp" method="post">
					<h3>Registration Form</h3>
					<div class="form-group">
						<input type="text" name="firstname" placeholder="First Name" class="form-control">
						<input type="text" name="lastname"  placeholder="Last Name" class="form-control">
					</div>
					<div class="form-wrapper">
						<input type="text" name="username"  placeholder="Username" class="form-control">
						<i class="zmdi zmdi-account"></i>
					</div>
					<div class="form-wrapper">
						<input type="email" name="email"  title="Please Check your Email Address" pattern=".+@gmail.com" placeholder="Email Address" class="form-control">
					
						<i class="zmdi zmdi-email"></i>
					</div>
					<div class="form-wrapper">
						<select name="gender" id="" class="form-control">
							<option value="" disabled selected>Gender</option>
							<option value="male">Male</option>
							<option value="female">Female</option>
							<option value="other">Other</option>
			           </select>
			           <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
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
						<input type="tel" name="mobilenumber" pattern="[789][0-9]{9}" title="Mobile number should start with 7,8,or 9 and should be atleast 10 digits" placeholder="Mobile Number" class="form-control">
						<i class="zmdi zmdi-whatsapp"></i>
					</div>
					<div class="form-wrapper">
						<input type="password" name="password" placeholder="Password" class="form-control">
						<i class="zmdi zmdi-lock"></i>
						
					</div>
					<div class="form-wrapper">
					<h2><a href="login.jsp">Login</a></h2>
					
					</div>
					<div class="whysign">
					<%
					String msg=request.getParameter("msg");
					if("valid".equals(msg))
					{
					 %>
					    <h2>Successfully Registered</h2>
					<%}%>
					<%
					if("invalid".equals(msg))
					{
					%>
					<h2>Some thing Went Wrong! Try Again!</h2>
					
					<%} %>
					</div>
					
					<button>Register
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
				</form>
				
			</div>
		</div>
		
	</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>