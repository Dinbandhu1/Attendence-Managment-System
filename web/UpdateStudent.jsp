<%-- 
    Document   : UpdateStudent
    Created on : May 25, 2018, 6:45:09 AM
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
        <title>Update Form</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/SingupStyle.css" rel="stylesheet">
            <%
          String role="";
            if(session!=null){
                
            if (session.getAttribute("role") != null) {
                        role=(String) session.getAttribute("role");
		if (role.equals("Techmenter")) {
                    %>
                     <%@ include file="navbar.jsp" %>
                     
                     <%
		} else {
                    %>
			 <%@ include file="adminNavbar.jsp" %>
                     <%	
			}
            }else{
                response.sendRedirect("login.jsp");
            }
            }
		
	%>    
    </head>
    <body>

        <div id="header"></div>
        <div class="container">
            <div class="row main">
                <div class="col-md-6 col-md-offset-3" id="form">
                    <center><b class="registration"> Update Student Record </b></center>
                    <form class="" method="post" action="UpdateStudent">
                        <%
                          
                        Connection con;
                            PreparedStatement pst;
                            ResultSet rs;
                            String id = request.getParameter("id");

                            try {
                                con = DBConnect.getConnecttion();
                                String sql= "select * from Student where student_Id='" + id + "'";
                                pst = con.prepareStatement(sql);
                                rs = pst.executeQuery();
                                if (rs.next()) {

                                %>
                        <div class="form-group">
                            <label for="id" class="cols-sm-2 control-label">Student ID</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="sid" id="id" value="<%=rs.getString(1)%>" required=""/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="cols-sm-2 control-label ">Enter Your Name</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="name" id="name"  value="<%=rs.getString(2)%>" required=""/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="gender" class="cols-sm-2 control-label"> Gender</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-education" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" id="cource" name="gender"  value="<%=rs.getString(3)%>" required=""/>
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="address" class="cols-sm-2 control-label">Address</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-home" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="address" id="address"  value="<%=rs.getString(4)%>" required=""/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="cols-sm-2 control-label">Phone Number</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="phone" id="phone" value="<%=rs.getString(5)%>" required=""/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label ">Your Email</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="email" id="email" value="<%=rs.getString(6)%>" required=""/>
                                </div>
                            </div>
                        </div>         


                        <div class="form-group">
                            <label for="Dob" class="cols-sm-2 control-label">Dale Of Bearth</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar" aria-hidden="true"></i></span>
                                    <input type="date" class="form-control" name="dob" id="dob"  value="<%=rs.getString(7)%>" required=""/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="adate" class="cols-sm-2 control-label">Admission Date</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar" aria-hidden="true"></i></span>
                                    <input type="date" class="form-control" name="admissionDate" id="admissionDate"  value="<%=rs.getString(8)%>" required=""/>
                                </div>
                            </div>
                        </div>



                        <div class="form-group">
                            <label for="cource" class="cols-sm-2 control-label">Enter Course</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-education" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="course" id="course"  value="<%=rs.getString(9)%>" required=""/>

                                </div>
                            </div>
                        </div>
                        <%
                                }

                            } catch (Exception e) {
                                out.println(e);
                            }


                        %>

                        <div class="form-group">
                            <input type="submit" class="btn btn-lg btn-primary btn-block" value="Submit">
                        </div>
                    </form>			
                </div>

            </div>
        </div>

    </body>
</html>
