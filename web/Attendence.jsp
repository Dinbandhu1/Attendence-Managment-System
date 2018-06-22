<%-- 
    Document   : Attendence
    Created on : May 13, 2018, 1:38:15 PM
    Author     : DINBHANDU
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.niit.DbConnect.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Mark Attendence </title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
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
    <body>
        <form action="Attendence" method="post"> 

            <div class="container">
                <table border="2" align="center" width="50%" cellpadding="5" cellspaching="6">
                    <tr>
                        <th align="center" bgcolor="indigo" style="color: white" colspan="6">
                    <h1>Mark Attendence</h1>
                    </tr>
                    <div class="table-responsive">          
                        <table class="table " border="2" align="center" width="50%" cellpadding="5" cellspaching="6">
                            <thead align="center" bgcolor="green" style="color:white" colspan="6">
                                <tr>
                                    <th>Batch Code</th>
                                    <th>Student ID</th>
                                    <th>Student Name</th>
                                    <th>Date</th>
                                    <th>Attendence States</th>

                                </tr>
                            </thead>

                            <%        try {
                                    Connection con = null;
                                    PreparedStatement pst;
                                    ResultSet rs;
                                   String err="";
                                    String batchcode = request.getParameter("bcode");
                                    con = DBConnect.getConnecttion();

                                    String query="Select * from batchInfo where batchCode=? OR student_Id=?";
                                    pst=con.prepareStatement(query);
                                    pst.setString(1, batchcode);
                                     pst.setString(2, batchcode);
                                    rs = pst.executeQuery();
                                    if(rs.next()){
                                
                                    String sql = "Select * from batchInfo where batchCode=? OR student_Id=?";
                                    pst = con.prepareStatement(sql);
                                    pst.setString(1, batchcode);
                                    pst.setString(2, batchcode);
                                    rs = pst.executeQuery();
                                    while (rs.next()) {

                            %> 
                            <tr><td> <input type="text" name="bcode" value="<%= rs.getString(1)%>"  </td>
                                <td><input type="text" name="sid" value="<%= rs.getString(2)%>"  </td>
                                <td><input type="text" name="sname" value="<%=rs.getString(4)%>" </td>
                                    <%
                                        Date dNow = new Date();
                                        SimpleDateFormat ft
                                                = new SimpleDateFormat(" yyyy.MM.dd ");
                                    %>
                                <td> <input type="text" name="day" value="<%= ft.format(dNow)%>" placeholder="" required="" ></td>
                                <td>   <select class="form-control" id="squestion" name="states" required="">
                                        <option value="">----Select Attendence Type----</option>
                                        <option value="Present">Present</option>
                                        <option value="Absent">Absent</option>
                                    </select></td>
                                    <%
                                    }
                                            
                                            
                                            }
                                    else{
                                        err="Batch Code OR Student Id Not Found";
                                        request.setAttribute("err", err);
                                      RequestDispatcher rd = request.getRequestDispatcher("SearchAttendence.jsp");
                                     rd.forward(request, response);
                                    }
                                        } catch (Exception e) {
                                            out.println(e);
                                        }

                                    %>

                            <div class="form-group">


                                <input type="submit" class="btn btn-primary" name="Submit" value="Submit"> 
                                <input type="reset" class="btn btn-danger" value="Reset"> 

                            </div>
                            </tr>
                        </table>

                        </form>
                        </body>
                        </html>
