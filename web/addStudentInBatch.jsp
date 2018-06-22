<%-- 
    Document   : addStudentInBatch
    Created on : Oct 13, 2006, 1:00:52 AM
    Author     : DINBHANDU
--%>

<%@page import="com.niit.DbConnect.DBConnect"%>
<%@page import="com.niit.DbConnect.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Student In Batch</title>

    </head>
    <body>
        <div class="container">
			<div class="row main">
				<div class="col-md-6 col-md-offset-3" id="form">
				  <center><b class="registration">ADD New Student In Batch </b></center>
					<form class="" method="post" action="#">
						
						<div class="form-group">
							<label for="" class="cols-sm-2 control-label">Select Course</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-education" aria-hidden="true"></i></span>

								 <select class="form-control"  name="course" onchange="this.form.submit()">
                                                                     
								          <option value="0">Select Course</option>
                                                                                        <% 
                    try{
                        
                         Connection con;
                 Statement st;
                 ResultSet rs;
                 con=DBConnect.getConnecttion();
        
                 String query="Select * from course";
                 st=con.createStatement();
                 rs=st.executeQuery(query);
                 while(rs.next()){
                     %>
                     <option value="<%=rs.getString("coursename")%>"
                             <%
                             if(request.getParameter("course")!=null)
                             {
                                 if(rs.getString("coursename").equals(request.getParameter("course")))
                                 {
                                     out.println("selected");
                                 }
                             }
                             
                             %>
                             
                             
                             ><%=rs.getString("coursename")%></option>
                     <%
                 }
                 
                        
                    }catch(Exception e){
                        out.println(e);
                    }
                        
                    
                    %>
                                           
                                               </select>
                                                                </div>
                                                        </div>
                                                </div>
                    <div class="form-group">
							<label for="" class="cols-sm-2 control-label">Select Batch Code</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></span>

                   
                                                                        <select class="form-control" name="batchCode"  onchange="this.form.submit()">
                        <option value="0">Select Batch Code</option>
                    
                                                                                          <% 
                    try{
                        
                         Connection con;
                 Statement st;
                 ResultSet rs;
                 con=DBConnect.getConnecttion();
                  String courceName=request.getParameter("course");
                
                 String query="Select * from batch where coursename='"+courceName+"'";
                 st=con.createStatement();
                 rs=st.executeQuery(query);
                 while(rs.next()){
                       %>
                       
                       <option value="<%= rs.getString("batchCode")%>"
                               <%
                               if(request.getParameter("batchCode")!=null)
                             {
                                 if(rs.getString("batchCode").equals(request.getParameter("batchCode")))
                                 {
                                     out.println("selected");
                                 }
                             }
                               %>
                           >
                           <%= rs.getString("batchCode")%> </option>
                           
                         <%
                      }
                 
                        
                    }catch(Exception e){
                        out.println(e);
                    }
                        
                    
                    %>
                   
                    </select>  
                              </div>
                         </div>
                    </div>
                   
                          <div class="form-group">
							<label for="" class="cols-sm-2 control-label">Select Batch Timming</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-time" aria-hidden="true"></i></span>

                   
                                                                        <select class="form-control" name="batchTimming" >
                        <option value="0">Select Batch Time</option>
                    
                                                                                          <% 
                    try{
                        
                         Connection con;
                 Statement st;
                 ResultSet rs;
                 con=DBConnect.getConnecttion();
                
                String batchCode=request.getParameter("batchCode");
                
                 String query="Select * from batch where batchCode='"+batchCode+"'";
                 st=con.createStatement();
                 rs=st.executeQuery(query);
                 while(rs.next()){
                       %>
                       
                       <option value="<%= rs.getString(4)%>"
                                <%
                               if(request.getParameter("batchTimming")!=null)
                             {
                                 if(rs.getString("batchTimming").equals(request.getParameter("batchTimming")))
                                 {
                                     out.println("selected");
                                 }
                             }
                               %>
                               ><%= rs.getString(4)%>  </option>
                           
                         <%
                      }
                 
                        
                    }catch(Exception e){
                        out.println(e);
                    }
                        
                    
                    %>
                   
                    </select>  
                              </div>
                         </div>
                    </div>
                   
                       <div class="form-group">
							<label for="" class="cols-sm-2 control-label">Select Student ID</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></span>

                   
                                                                        <select class="form-control" name="sid" onchange="this.form.submit()">
                        <option value="0">----Select Student ID----</option>
                    
                                                                                          <% 
                    try{
                        
                         Connection con;
                 Statement st;
                 ResultSet rs;
                 con=DBConnect.getConnecttion();
                 String query="Select * from Student";
                 st=con.createStatement();
                 rs=st.executeQuery(query);
                 while(rs.next()){
                       %>
                       
                       <option value="<%= rs.getString(1)%>"
                                <%
                               if(request.getParameter("sid")!=null)
                             {
                                 if(rs.getString("student_Id").equals(request.getParameter("sid")))
                                 {
                                     out.println("selected");
                                 }
                             }
                               %>
                               ><%= rs.getString(1)%>  </option>
                           
                         <%
                      }
                 
                        
                    }catch(Exception e){
                        out.println(e);
                    }
                        
                    
                    %>
                   
                    </select>  
                              </div>
                         </div>
                    </div>
                            <div class="form-group">
							<label for="" class="cols-sm-2 control-label">Select Student ID</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>

                   
                                                                        <select class="form-control" name="sname" >
                        <option value="0">----Select Student ID----</option>
                    
                                                                                          <% 
                    try{
                    String sid=request.getParameter("sid");
                         Connection con;
                 Statement st;
                 ResultSet rs;
                 con=DBConnect.getConnecttion();
                 
                 String query="Select * from Student where student_Id='"+sid+"'";
                 st=con.createStatement();
                 rs=st.executeQuery(query);
                 while(rs.next()){
                       %>
                       
                       <option value="<%= rs.getString(2)%>"
                                <%
                               if(request.getParameter("sname")!=null)
                             {
                                 if(rs.getString("name").equals(request.getParameter("sname")))
                                 {
                                     out.println("selected");
                                 }
                             }
                               %>
                               ><%= rs.getString(2)%>  </option>
                           
                         <%
                      }
                 
                        
                    }catch(Exception e){
                        out.println(e);
                    }
                        
                    
                    %>
                   
                    </select>  
                              </div>
                         </div>
                    </div>
                    
                   
                  <% String course=request.getParameter("cource"); 
                  String bcode=request.getParameter("batchCode"); 
                  String btimming=request.getParameter("batchTimming"); 
                  String sid=request.getParameter("sid");
                  String sname=request.getParameter("sname");
                  
                  
                  %>  
                 
                     <div class="form-group">
                         
                   
                         <input type="submit" class="btn btn-primary" name="Submit" value="Submit"> 
                        <input type="reset" class="btn btn-danger" value="Reset"> 

                    </div>
                  
                          <%
                          if(request.getParameter("Submit")!=null)
                          {
                              RequestDispatcher rd=request.getRequestDispatcher("addStudentinBatch");
                              rd.forward(request, response);
                          }
                          %>
                    
                                  </form>
                                </div>
                        </div>
        </div>

       
    </body>
</html>
