<%-- 
    Document   : DeleteCourse
    Created on : May 23, 2018, 10:03:22 AM
    Author     : DINBHANDU
--%>

<%@page import="com.niit.DbConnect.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <!--  <form action="" method="post">
        Enter ID:<input type="text" name="id">
        <input type="submit" value="submit">
        
       -->
       
        <%
            Connection con;
            PreparedStatement pst;
                String id=request.getParameter("id");
            
            try{
                con=DBConnect.getConnecttion();
                String sql="Delete from course where courseid=?";
                pst=con.prepareStatement(sql);
                pst.setString(1, id);
                int i=pst.executeUpdate();
                if(i!=0){
                    out.println("Deleted");
                }
                else{
                    out.println("Not Deleted");
                }
                        
                
            }catch(Exception e){
                out.println(e);
            }
            
            
            %>
         
    </body>
</html>
