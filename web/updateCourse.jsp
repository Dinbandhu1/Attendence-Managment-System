<%-- 
    Document   : updateCourse
    Created on : May 23, 2018, 10:50:02 PM
    Author     : DINBHANDU
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.niit.DbConnect.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
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
            String Success = "";
            if (request.getAttribute("success") != null) {
                Success = (String) request.getAttribute("success");
            }

        %>
            <% 
                 Connection con;
            PreparedStatement pst;
            ResultSet rs;
            String id=request.getParameter("id");
            
                try{
                    con=DBConnect.getConnecttion();
                    String sql2="select * from course where courseid='"+id+"'";
                    pst=con.prepareStatement(sql2);
                    rs=pst.executeQuery();
                    if(rs.next()){
                        %>
                    
         <div id="header"></div>
        <div class="container">
			<div class="row main">
				<div class="col-md-6 col-md-offset-3" id="form">
                                    <center><b class="registration"> Add Course</b></center>
					<form class="" method="post" action="addcourse">
                                            <h3 style="color: blue"><%= Success%></h3>
                                    <div class="form-group">
							<label for="cid" class="cols-sm-2 control-label ">Enter Course ID</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i></span>
                                                                        <input type="text" class="form-control" name="cid" value="<%=rs.getString(1)%>" id="cid"  placeholder="Enter Course ID" required=""/>
								</div>
							</div>
						</div>
                     <div class="form-group">
							<label for="course" class="cols-sm-2 control-label ">Course Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i></span>
                                                                        <input type="text" class="form-control" name="coursename" value="<%= rs.getString(2)%>" id="coursename"  placeholder="Enter Course Name" required=""/>
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
                    
                }catch(Exception e){
                    out.println(e);
                }
            
            
            %>
            
        </form>
       
    </body>
</html>
