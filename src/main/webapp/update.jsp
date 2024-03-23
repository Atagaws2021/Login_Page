<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%

int regno;
String fullname,emailAdd,mobile,gender,dept,address;

regno=Integer.parseInt(request.getParameter("regno"));
fullname=request.getParameter("fullname");
emailAdd=request.getParameter("emailAdd");
mobile=request.getParameter("mobile");
gender=request.getParameter("gender");
dept=request.getParameter("dept");
address=request.getParameter("address");

Class.forName("com.mysql.jdbc.Driver");

Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","password123");

String sqlQuery="UPDATE register SET FullName=?,EmailAdd=?,MobileNo=?,Gender=?,Department=?,Address=? WHERE RegNo=?;";

PreparedStatement stmt=cn.prepareStatement(sqlQuery);
stmt.setInt(7,regno);
stmt.setString(1,fullname);
stmt.setString(2,emailAdd);
stmt.setString(3,mobile);
stmt.setString(4,gender);
stmt.setString(5,dept);
stmt.setString(6,address);

stmt.executeUpdate();
stmt.close();
cn.close();

%>

<script>
	alert("Student Registered Successfully");
</script>

<%
response.sendRedirect("index.jsp");
%>



