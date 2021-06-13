<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String username=request.getParameter("username");
String email=request.getParameter("email");
String gender=request.getParameter("gender");
String question=request.getParameter("question");
String answer=request.getParameter("answer");
String mobilenumber=request.getParameter("mobilenumber");
String password=request.getParameter("password");
String address="";
String city="";
String state="";
String country="";
try
{
    Connection con=ConnectionProvider.getCon();
    PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
    ps.setString(1, firstname);
    ps.setString(2, lastname);
    ps.setString(3, username);
    ps.setString(4, email);
    ps.setString(5, mobilenumber);
    ps.setString(6, gender);
    ps.setString(7, password);
    ps.setString(8, address);
    ps.setString(9, city);
    ps.setString(10, state);
    ps.setString(11, country);
    ps.setString(12, question);
    ps.setString(13, answer);
    ps.executeUpdate();
    response.sendRedirect("signup.jsp?msg=valid");


}
 catch(Exception e)  
{
     System.out.println(e);
     response.sendRedirect("signup.jsp?msg=invalid");
   
}
%>