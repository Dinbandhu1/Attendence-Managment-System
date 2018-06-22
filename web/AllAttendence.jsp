<%-- 
    Document   : AllAttendence
    Created on : Jun 3, 2018, 6:36:23 AM
    Author     : DINBHANDU
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.niit.DbConnect.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   <link href="assets/css/bootstrap.min.css" rel="stylesheet">  
      	if (role.equals("Techmenter")) {
                    %>
     
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
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
        <form action="" method="post">
            <h2>List of All Attendence</h2>
           <table class="table table-hover b" >
    <thead>
           <tr class="a">
              <th>Batch Code</th> 
                <th>Student ID</th>
                <th>Student Name</th> 
                <th>Date</th>
                <th>Attendence States</th> 
                <th>Edit</th>
                <th>Delete</th>
            </tr>
    </thead>
       
            <%
                Connection con;
            PreparedStatement pst;
            try{
                con=DBConnect.getConnecttion();
                String sql="select * from Attendence";
                pst=con.prepareStatement(sql);
               ResultSet rs=pst.executeQuery();
                while(rs.next()){
                    %>
                    <tr>
                        <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                 <td>
                 <a href="updateAttendence.jsp?sid=<%=rs.getString(2)%>" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-edit"></span></a>
                    </td>
                    <td>
                        <a href="AttendenceDelete?sid=<%=rs.getString(2)%>" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-trash"></span></a>
                    </td>
                    
                </tr>
                <%
                }
                        
                
            }catch(Exception e){
                out.println(e);
            }
            
                
                %>
         
           </table>
        </form>
                </div>
            </div>
         </div>
     </body>
</html>
