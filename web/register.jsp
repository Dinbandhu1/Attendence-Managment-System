<%-- 
    Document   : register
    Created on : May 18, 2018, 1:55:37 PM
    Author     : DINBHANDU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">  
        <link href="css/SingupStyle.css" rel="stylesheet">
        <script src="assets/js/validation.js"></script>
        <%@ include file="adminNavbar.jsp" %>
    </head>
    <body>

        <%            String err = "";
            if (request.getAttribute("err") != null) {
                err = (String) request.getAttribute("err");
            }
        %>

        <div id="header"></div>
        <div class="container">
            <div class="row ">

                <div class="col-md-6 col-md-offset-3" id="form">

                    <center><b class="registration">Registration Form</b></center>
                    <form name="form" class="" method="post" action="Register" onsubmit="return validate()">
                        <li style="color: red"><%=err%></li>

                        <div class="form-group">
                            <label for="name" class="cols-sm-2 control-label">Enter Your Name</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="name" id="name"  placeholder="Enter your Name" required=""/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="gender" class="cols-sm-2 control-label">Select Gender</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>

                                    <select class="form-control" id="role" name="gender" required="">
                                        <option value="">----Select Gender----</option>
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
                            <label for="email" class="cols-sm-2 control-label">Your Email</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email" required=""/>
                                </div>
                            </div>
                        </div>         


                        <div class="form-group">
                            <label for="Dob" class="cols-sm-2 control-label">Dale Of Bearth</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                    <input type="date" class="form-control" name="dob" id="dob"  placeholder="Enter your DOB" required=""/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="doj" class="cols-sm-2 control-label">Hire Date</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="date" class="form-control" name="doj" id="doj"  placeholder="Enter your HireDate" required=""/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="id" class="cols-sm-2 control-label">Employee ID</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="eid" id="id"  placeholder="Teachmenter ID" required=""/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="role" class="cols-sm-2 control-label">Select Role</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>

                                    <select class="form-control" id="role" name="role" required="">
                                        <option value="">----Select Role----</option>
                                        <option value="Admin">Admin</option>
                                        <option value="Techmenter">Techmenter</option>
                                    </select>

                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="submit" class="btn btn-lg btn-primary btn-block" value="Register">
                        </div>
                    </form>			
                </div>

            </div>
        </div>
    </body>
</html>
