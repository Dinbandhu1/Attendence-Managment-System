<%-- 
    Document   : StudentRegister
    Created on : May 18, 2018, 5:57:07 PM
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
        <title>Registration Form</title>

        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/SingupStyle.css" rel="stylesheet"> 
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <script src="assets/js/validation.js"></script>
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
    </head>
    <body background-color:skyblue>

        <%            String err = "";
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
        <div class="container">
            <div class="row main">
                <div class="col-md-6 col-md-offset-3" id="form">
                    <center><b class="registration"> Student Registration Form</b></center>
                    <form name="form" class="" method="post" action="StudentRegister" onsubmit="return validate()">
                        <h3 style="color: red"><%=err%></h3>
                        <h3 style="color: blue"><%= Success%></h3>
                        <div class="form-group">
                            <label for="name" class="cols-sm-2 control-label ">Enter Your Name</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="name" id="name"  placeholder="Enter your Name" required=""/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="gender" class="cols-sm-2 control-label">Select Gender</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon" aria-hidden="true"></i></span>

                                    <select class="form-control" id="cource" name="gender" required="">
                                        <option value="">---- Select Gender -----</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>

                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="address" class="cols-sm-2 control-label">Address</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-home" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="address" id="address"  placeholder="Enter your Address" required=""/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="cols-sm-2 control-label">Phone Number</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="phone" id="phone"  placeholder="Enter your Phone Number" required=""/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label ">Your Email</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email" required=""/>
                                </div>
                            </div>
                        </div>         


                        <div class="form-group">
                            <label for="Dob" class="cols-sm-2 control-label">Dale Of Bearth</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar" aria-hidden="true"></i></span>
                                    <input type="date" class="form-control" name="dob" id="dob"  placeholder="Enter your DOB" required=""/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="adate" class="cols-sm-2 control-label">Admission Date</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar" aria-hidden="true"></i></span>
                                    <input type="date" class="form-control" name="admissionDate" id="admissionDate"  placeholder="Enter Admission Date" required=""/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="id" class="cols-sm-2 control-label">Student ID</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="sid" id="id"  placeholder="Student ID" required=""/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="cource" class="cols-sm-2 control-label">Select Cource</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-book" aria-hidden="true"></i></span>

                                    <select class="form-control" id="cource" name="cource" required="">
                                        <option value="Choose Cource">---- Coose Course -----</option>
                                        <%
                                            try {
                                                Connection con;
                                                PreparedStatement pst;
                                                ResultSet rs;
                                                con = DBConnect.getConnecttion();
                                                String sql = "Select * from course";
                                                pst = con.prepareStatement(sql);
                                                rs = pst.executeQuery();
                                                while (rs.next()) {
                                        %>
                                        <option value="<%=rs.getString("coursename")%>">----<%=rs.getString("coursename")%>----</option>


                                        <%
                                                }

                                            } catch (Exception e) {
                                                out.println(e);
                                            }
                                        %>

                                    </select>

                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="submit" class="btn btn-lg btn-primary btn-block" value="Submit">
                            <input type="reset" class="btn btn-lg btn-danger btn-block " value="Reset"> 

                        </div>
                    </form>			
                </div>

            </div>
        </div>
    </body>
</html>
