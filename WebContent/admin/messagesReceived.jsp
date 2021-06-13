<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
body{
background-image: url('../css/images/mes2.jfif');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
  
 }
h3
{
	color: yellow;
	text-align: center;
}

tr {
 opacity: 1;
 background: transparent;
}
tr td{
 color:black;
  font-weight: bold;
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
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
          </tr>
        </thead>
        <tbody>
 <%
 try{
	 Connection con = ConnectionProvider.getCon();
	 Statement st =con.createStatement();
	 ResultSet rs= st.executeQuery("select * from message");
	 while(rs.next()){
%>      
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
          </tr>
         <%
	     }
	     }
         catch(Exception e){
           System.out.println(e);
         }
         %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>