<%-- 
    Document   : Student
    Created on : Jun 12, 2018, 6:33:28 AM
    Author     : DINBHANDU
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.niit.DbConnect.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Search page</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">  
        <link href="css/SingupStyle.css" rel="stylesheet"> 
        <%
            String role = "";
            if (session != null) {

                if (session.getAttribute("role") != null) {
                    role = (String) session.getAttribute("role");
                    if (role.equals("Techmenter")) {
        %>
        <%@ include file="navbar.jsp" %>

        <%                     } else {
        %>
        <%@ include file="adminNavbar.jsp" %>
        <%                    }
                } else {
                    response.sendRedirect("login.jsp");
                }
            }

        %>    

        <style>
            .a{
                background-color: #4CAF50;
                color:white;
                font-size: 20px;
                font-family: thoma;

            }
            .b thead .a th {
                border: 3px solid black;
            }
            .b tr td{
                background-color: white;
                border: 3px solid black;
            }
            .b tr td:hover{
                background-color: background;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <form action="" method="post">
                <div class="col-lg-8">
                </div>
                <div class="input-group">
                    <input type="text" class="form-control"  placeholder="Enter Student Name OR ID" name="name">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit" name="Submit">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>


        <%                if (request.getParameter("Submit") != null) {
                String name = request.getParameter("name");

                if (name.length() > 0) {
                    try {

                        Connection con = DBConnect.getConnecttion();
                        PreparedStatement ps = con.prepareStatement("select * from Student where name like '%" + name + "%' OR student_id like '%" + name + "%' ");

                        ResultSet rs = ps.executeQuery();
        %>
        <table class="table table-hover b" >
            <thead>
                <tr class="a">
                    <th>Student ID</th>
                    <th>Student Name</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Date OF Bearth</th>
                    <th>Admission Date</th>
                    <th>Course</th>
                </tr>
            </thead>

            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString(1)%></td>
                <td><%= rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
                <td><%=rs.getString(8)%></td>
                <td><%=rs.getString(9)%></td>

            </tr>
            <%
                            }
                            out.print("</table>");
                            con.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }//end of if

                }
            %>



    </body>
</html>