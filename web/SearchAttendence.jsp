<%-- 
    Document   : A
    Created on : May 20, 2018, 12:25:22 PM
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
        <%             String err = "";

            if (request.getAttribute("err") != null) {
                err = (String) request.getAttribute("err");
            }
        %>
        <form action="Attendence.jsp" method="post">
            
             <div class="row">
                 <div class="col-lg-6">
                </div>
                 <div class="col-lg-6">
             <h3 style="color: red"><%=err%></h3>
                <div class="input-group">
                    <input type="text" class="form-control"  placeholder="Enter Student Name OR ID" name="bcode">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit" name="Submit">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div></div>
                    </div>
                </div>
        </form>
    </body>
</html>
