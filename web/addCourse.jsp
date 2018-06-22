<%-- 
    Document   : addCourse
    Created on : May 18, 2018, 7:01:46 PM
    Author     : DINBHANDU
--%>

<%@page import="com.niit.DbConnect.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Course</title>
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
        <%
                    }
                } else {
                    response.sendRedirect("login.jsp");
                }
            }

        %>    



    </head>
    <body class="a">
        <%             String err = "";

            if (request.getAttribute("err") != null) {
                err = (String) request.getAttribute("err");
            }
        %>
        <%
            String Success = "";
            if (request.getAttribute("success") != null) {
                Success = (String) request.getAttribute("success");
            }

        %>

        <div id="header"></div>
        <div class="container-fluid">
            <div class="row main">
                <div class="col-md-0"> <img class="courseimg" src="images/books.jpg" /> </div>
                <div class="col-md-0 col-md-offset-3 clist" id="addcourse" >
                    <center><b class="registration"> Add Course</b></center>
                    <form class="" method="post" action="addcourse">
                        <h3 style="color: red"><%=err%></h3>
                        <h3 style="color: blue"><%= Success%></h3>
                        <div class="form-group">
                            <label for="cid" class="cols-sm-2 control-label ">Enter Course ID</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="cid" id="cid"  placeholder="Enter Course ID" required=""/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="course" class="cols-sm-2 control-label ">Course Name</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-book" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="coursename" id="coursename"  placeholder="Enter Course Name" required=""/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-lg btn-primary btn-block" value="Submit">
                        </div>
                    </form>
                </div>
            </div>
        </div>	
    </body>
</html>
