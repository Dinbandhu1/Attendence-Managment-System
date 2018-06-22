<%-- 
    Document   : AllCourseList
    Created on : May 23, 2018, 5:20:27 PM
    Author     : DINBHANDU
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.niit.DbConnect.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">           
        <title>All Course List</title>
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
        <%                                 }
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
            <div class="row">
                <div class="col-md-0"> <img class="courseimg" src="images/books.jpg" class="img-responsive" /> 
                    <div class="col-md-0 clist ">

                        <form action="" method="post">
                          <!--  <h2 style="color:#ffffff">List of Course</h2> -->
                            <table class="table table-hover b" >
                                <thead>
                                    <tr class="a">
                                        <th>Course ID</th> 
                                        <th>Course Name</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>

                                <%                Connection con;
                                    PreparedStatement pst;

                                    try {
                                        con = DBConnect.getConnecttion();
                                        String sql = "select * from course ";
                                        pst = con.prepareStatement(sql);
                                        ResultSet rs = pst.executeQuery();
                                        while (rs.next()) {
                                %>
                                <tr>
                                    <td><%= rs.getString(1)%></td>
                                    <td><%= rs.getString(2)%></td>
                                    <td>
                                        <a href="updateCourse.jsp?id=<%=rs.getString(1)%>" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-edit"></span></a>
                                    </td>
                                    <td>
                                        <a href="DeleteCourse.jsp?id=<%=rs.getString(1)%>" onclick="return confirm('Are you sure you want to delete this item?');" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-trash"></span></a>
                                    </td>

                                </tr>
                                <%
                                        }

                                    } catch (Exception e) {
                                        out.println(e);
                                    }


                                %>

                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
