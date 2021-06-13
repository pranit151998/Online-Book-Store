<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("id");
String name= request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String image= request.getParameter("filename");
String active= request.getParameter("active");

try{
   Connection con = ConnectionProvider.getCon();
   PreparedStatement ps = con.prepareStatement("insert into product values(?,?,?,?,?,?)");
   ps.setString(1, id);
   ps.setString(2, image);
   ps.setString(3, name);
   ps.setString(4, category);
   ps.setString(5, price);
   ps.setString(6, active);
   
   ps.executeUpdate();
   response.sendRedirect("addNewProduct.jsp?msg=done");
   
}
catch(Exception e){
  response.sendRedirect("addNewProduct.jsp?msg=wrong");
}

%>