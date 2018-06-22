<%-- 
    Document   : batch.jsp
    Created on : May 19, 2018, 3:35:04 PM
    Author     : DINBHANDU
--%>

<%@page import="com.niit.DbConnect.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
 <link href="css/SingupStyle.css" rel="stylesheet">
<%@ include file="adminNavbar.jsp" %>
                      
    </head>
      <body>
          <%
		String err = "";
		if (request.getAttribute("err") != null) {
			err = (String) request.getAttribute("err");
		}
	%>
     <div id="header"></div>
		<div class="container">
			<div class="row main">
				<div class="col-md-6 col-md-offset-3" id="form">
				  <center><b class="registration">  New Batch Issue</b></center>
					<form class="" method="post" action="Batch">
					 <li style="color: red"><%=err%></li>
                                            <div class="form-group">
							<label for="" class="cols-sm-2 control-label">Select Techmenter Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>

                                                                        <select class="form-control" id="cource" name="tid" required="">
								          <option value="0">-----Select Techmenter ID----</option>
                                                                          <%
                                                                              Connection con = null;
                                                                                 PreparedStatement pst;
                                                                                 ResultSet rs;
                                                                                 String role="Techmenter";
                                                                            try{
                                                                             con=DBConnect.getConnecttion();
                                                                             String query="select * from Registration_Form Where role='"+role+"'";
                                                                             pst=con.prepareStatement(query);
                                                                             rs=pst.executeQuery();
                                                                              while(rs.next()){
                                                                                  
                                                                                  %>
                                                                                  <option value="<%= rs.getString("id")%>"><%= rs.getString("name")%></option>
                                                                                  
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
							<label for="" class="cols-sm-2 control-label">Select Course</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-education" aria-hidden="true"></i></span>

                                                                        <select class="form-control" id="cource" name="course" required="">
								          <option value="0">-----Select Course----</option>
                                                                          <%
                                                                            
                                                                            try{
                                                                             con=DBConnect.getConnecttion();
                                                                             String query="select * from course";
                                                                             pst=con.prepareStatement(query);
                                                                             rs=pst.executeQuery();
                                                                              while(rs.next()){
                                                                                  
                                                                                  %>
                                                                                  <option value="<%= rs.getString("coursename")%>"><%= rs.getString("coursename")%></option>
                                                                                  
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
							<label for="bcode" class="cols-sm-2 control-label">Enter Batch Code</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></span>
                                                                        <input type="text" class="form-control" name="bcode" id="bcode"  placeholder="Enter Batch Code" required=""/>
								</div>
							</div>
						</div>
                                            
                                                                     <div class="form-group">
							<label for="" class="cols-sm-2 control-label">Batch timming</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>

								 <select class="form-control" id="cource" name="btime">
								          <option value="0">-----Select Batch timming----</option>
                                                                         
                                                                                  <option value="09:00-11:00">09:00-11:00</option>
                                                                                  <option value="11:00-13:00">11:00-13:30</option>
                                                                                  <option value="13:30-15:30">13:30-15:30</option>
                                                                                  <option value="15:30-17:30">15:30:17:30</option>
                                                                                  <option value="17:30-19:30">17:30-19:30</option>
                                                                                  </select>
                                               
								</div>
							</div>
						</div>


                                            <div class="form-group">
							<label for="batchsdate" class="cols-sm-2 control-label">Enter Batch Start Date</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-calendar" aria-hidden="true"></i></span>
                                                                        <input type="date" class="form-control" name="bsDate" id="bcode"  placeholder="Enter Batch Start Date" required=""/>
								</div>
							</div>
						</div>
				            <div class="form-group">
							<label for="batchenddate" class="cols-sm-2 control-label">Enter Batch End Date</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="glyphicon glyphicon-calendar" aria-hidden="true"></i></span>
                                                                        <input type="date" class="form-control" name="beDate" id="bcode"  placeholder="Enter Batch End Date" required=""/>
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
