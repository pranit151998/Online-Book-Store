<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import ="java.util.*,javax.mail.*" %>
<%@page import ="javax.mail.internet.*,javax.activation.*"%>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="Cancel";
final String from = "pranitsawant222@gmail.com";
final String pass="007pranit";
String subject="Online Bookstore Delivery Info";
String messg="Your Ordered Product is Cancelled. We are Sorry for the Inconvience to you with 3 working days. Your Product Id = "+id;
try
{
	  Connection con = ConnectionProvider.getCon();
      Statement st = con.createStatement();
      st.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not NULL");
      response.sendRedirect("ordersReceived.jsp?msg=cancel");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=invalid");
}
finally{
	
	
	Properties properties=new Properties();
	properties.put("mail.smtp.auth", "true");
	properties.put("mail.smtp.starttls.enable", "true");
	properties.put("mail.smtp.host", "smtp.gmail.com");
	properties.put("mail.smtp.port", 587);
	properties.put("mail.smtp.user", from);
	properties.put("mail.smtp.port", "25");
	properties.put("mail.debug", "true");
	properties.put("mail.smtp.EnableSSL.enable","true");
	properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
	properties.setProperty("mail.smtp.socketFactory.fallback", "false");   
	properties.setProperty("mail.smtp.port", "465");   
	properties.setProperty("mail.smtp.socketFactory.port", "465"); 

	Session mailSession = Session.getInstance(properties, new javax.mail.Authenticator(){
        protected PasswordAuthentication getPasswordAuthentication()	{
        	return new PasswordAuthentication(from ,pass);
        }
	});
	try{
		
		MimeMessage message = new MimeMessage(mailSession);
		message.setFrom(new InternetAddress(from));
		message.addRecipient(Message.RecipientType.TO,	
		new InternetAddress(email));
	
		message.setSubject(subject);
		message.setText(messg);
		Transport.send(message);
		System.out.println("Message sent Successfully");
	}
	catch(Exception e){
		e.printStackTrace();
		System.out.println("Error:Unable to Send message");
	}
	
	
}
%>