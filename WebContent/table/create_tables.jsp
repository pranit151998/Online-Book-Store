<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<% 
try
{
    Connection con=ConnectionProvider.getCon();
    Statement st=con.createStatement();
   
   String q1= "create table users(firstname varchar(100),lastname varchar(100),username varchar(100),email varchar(100)primary key,mobileNumber bigint, gender varchar(100),password varchar(100),address varchar(500),city varchar(100),state varchar(100),country varchar(100),question varchar(100),answer varchar(100))";
   String q2= "create table product(id int,image varchar(200),name varchar(500),category varchar(200),price int,active varchar(10))";
   String q3= "create table cart(email varchar(200),product_id int,image varchar(200),quantity int,price int ,total int,address varchar(200),city varchar(100),state varchar(100),country varchar(100), mobileNumber bigint, orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(200),transactionid varchar(200),status varchar(10) )";
   String q4= "create table message(id int AUTO_INCREMENT,email varchar(100),subject varchar(200),body varchar(1000),PRIMARY KEY(id))";
   System.out.println(q1);
   System.out.println(q2);
   System.out.println(q3);
   System.out.println(q4);
   //st.execute(q1);
   //st.execute(q2);
   st.execute(q3);
   //st.execute(q4);
   System.out.println("Table Created");
   con.close();
}
catch(Exception e)
{
    System.out.println(e);
    }
%>

