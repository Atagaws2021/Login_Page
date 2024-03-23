<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%

int regno;

regno=Integer.parseInt(request.getParameter("regno"));


Class.forName("com.mysql.jdbc.Driver");

Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","password123");

String sqlQuery="DELETE FROM register WHERE RegNo=?;";

PreparedStatement stmt=cn.prepareStatement(sqlQuery);
stmt.setInt(1,regno);


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



