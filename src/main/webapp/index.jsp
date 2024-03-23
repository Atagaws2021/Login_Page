<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Management</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@ page import="java.sql.*"%>
	<div class="header">
        <h1>Student <span>Management</span></h1>
        <button onclick="toggle()"><i class="fa-solid fa-user-plus"></i></button>
    </div>
    
    <div class="details">
        <table>
            <thead>
                <tr>
                    <th>Registration No</th>
                    <th>Full Name</th>
                    <th>Email Add</th>
                    <th>Mobile</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            	<%
            	Class.forName("com.mysql.jdbc.Driver");
            	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","password123");
            	PreparedStatement ps=cn.prepareStatement("SELECT * FROM register");
            	ResultSet rs=ps.executeQuery();
            	int regno=0;
            	String fullname="",email="",mobile="";
            	while(rs.next()){
            		regno=rs.getInt(1);
            		fullname=rs.getString(2);
            		email=rs.getString(3);
            		mobile=rs.getString(4);
            		%>
            		<tr>
                    <td><%=regno%></td>
                    <td><%=fullname %></td>
                    <td><%=email %></td>
                    <td><%=mobile %></td>
                    <td id="edit">
                    <a href="studentEdit.jsp?regno=<%=regno %>"><i class="fa-solid fa-pen-to-square"></i></a>
                    <a href="delete.jsp?regno=<%=regno %>"><i class="fa-solid fa-trash"></i></a>
                    </td>
                    
                </tr>
               <% 
            	}
            	
            	%>
                
            </tbody>
        </table>
    </div>

    <div class="popup" id="popup">
        <div class="title">
            <h2>Add Student</h2>
        </div>
        <form method="post" action="studentReg.jsp">
            <div class="field">
                <label>Registration No</label>
                <input type="text" name="regno" required>
            </div>
            <div class="field">
                <label>Name</label>
                <input type="text" name="fullname" required>
            </div>
            <div class="field">
                <label>Email Add</label>
                <input type="email" name="emailAdd" required>
            </div>
            <div class="field">
                <label>Mobile No</label>
                <input type="text" maxlength="10" name="mobile" required>
            </div>
            <div class="field">
                <label>Gender</label>
                <select name="gender">
                    <option value="" selected>Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
            </div>
            <div class="field">
                <label>Department</label>
                <select name="dept">
                    <option value="" selected>Department</option>
                    <option value="IT">IT</option>
                    <option value="ECE">ECE</option>
                </select>
            </div>
            <div class="text-add">
                <label>Address</label>
                <textarea name="address"></textarea>
            </div>
            <div class="action-field">
                <input type="submit" value="Add Student">
            </div>
        </form>
    </div>
    <script>
        window.onload=toggle();
        function toggle(){
            var popup=document.querySelector("#popup");
            if(popup.style.display=="none"){
                popup.style.display="block";
            }
            else{
                popup.style.display="none";
            }
        }
    </script>
</body>
</html>