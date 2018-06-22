<%-- 
    Document   : updateBatch
    Created on : May 31, 2018, 2:27:10 PM
    Author     : DINBHANDU
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.niit.DbConnect.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <form action="updateCourse" method="post">
            <%
                Connection con;
                PreparedStatement pst;
                ResultSet rs;
                String id = request.getParameter("batchcode");

                try {
                    con = DBConnect.getConnecttion();
                    String sql2 = "select * from Batch where batchCode='" + id + "'";
                    pst = con.prepareStatement(sql2);
                    rs = pst.executeQuery();
                    if (rs.next()) {
            %>

            <div id="header"></div>
            <div class="container">
                <div class="row main">
                    <div class="col-md-6 col-md-offset-3" id="form">
                        <center><b class="registration"> Update Batch Records</b></center>
                        <form class="" method="post" action="UpdateBatch">
                            <div class="form-group">
                                <label for="cid" class="cols-sm-2 control-label ">Batch Code</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="cid" value="<%=rs.getString(3)%>" id="cid"  placeholder="Enter Course ID" required=""/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="course" class="cols-sm-2 control-label ">Techmenter ID</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="tId" value="<%= rs.getString(1)%>" id="coursename"  placeholder="Enter Course Name" required=""/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="cid" class="cols-sm-2 control-label ">Subject</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="course" value="<%=rs.getString(2)%>" id="cid"  placeholder="Enter Course ID" required=""/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="course" class="cols-sm-2 control-label ">Batch Timming</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="bTime" value="<%= rs.getString(4)%>" id="coursename"  placeholder="Enter Course Name" required=""/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="cid" class="cols-sm-2 control-label ">Batch Start Date </label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="bStart" value="<%=rs.getString(5)%>" id="cid"  placeholder="Enter Course ID" required=""/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="course" class="cols-sm-2 control-label ">Batch End Date</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i></span>
                                        <input type="text" class="form-control" name="bEnd" value="<%= rs.getString(6)%>" id="coursename"  placeholder="Enter Course Name" required=""/>
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
            <%
                    }

                } catch (Exception e) {
                    out.println(e);
                }


            %>

        </form>

    </body>
</html>
