<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Management</title>
<link rel="stylesheet" href="style1.css">

</head>
<body>
<%@ page import="java.sql.*"%>
<%



Class.forName("com.mysql.jdbc.Driver");

Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","password123");

String sqlQuery="SELECT * FROM register WHERE RegNo=?;";

PreparedStatement ps=cn.prepareStatement(sqlQuery);
int regno;


regno=Integer.parseInt(request.getParameter("regno"));
ps.setInt(1, regno);

ResultSet rs=ps.executeQuery();

String fullname="",email="",mobile="",gender="",dept="",address="";
if(rs.next()){
	
	fullname=rs.getString(2);
	email=rs.getString(3);
	mobile=rs.getString(4);
	gender=rs.getString(5);
	dept=rs.getString(6);
	address=rs.getString(7);
}


ps.close();
cn.close();

%>

	<div class="header">
        <h1>Student <span>Management</span></h1>
        
    </div>
    
   

    <div class="popup" id="popup">
        <div class="title">
            <h2>Add Student</h2>
        </div>
        <form method="post" action="update.jsp">
            <div class="field">
                <label>Registration No</label>
                <input type="text" value=<%=regno %> name="regno" required readonly>
            </div>
            <div class="field">
                <label>Name</label>
                <input type="text" value=<%=fullname %> name="fullname" required>
            </div>
            <div class="field">
                <label>Email Add</label>
                <input type="email" value=<%=email %> name="emailAdd" required>
            </div>
            <div class="field">
                <label>Mobile No</label>
                <input type="text"  value=<%=mobile %> maxlength="10" name="mobile" required>
            </div>
            <div class="field">
            	<label>Gender</label>
                <select name="gender">
                    <option value=<%=gender %>selected><%=gender %></option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
            	
            </div>
            <div class="field">
                <label>Department</label>
                <select name="dept">
                    <option selected><%=dept %></option>
                    <option value="IT">IT</option>
                    <option value="ECE">ECE</option>
                </select>
            </div>
            <div class="text-add">
                <label>Address</label>
                <textarea name="address"><%=address %></textarea>
            </div>
            <div class="action-field">
                <input type="submit" value="Edit Info">
            </div>
        </form>
    </div>
    
</body>
</html>