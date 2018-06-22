<%-- 
    Document   : resetpassword
    Created on : Jun 10, 2018, 7:50:26 PM
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
    </head>
    <body>
        <div class="container">
     <div class="row">
        <div class="col-md-6 col-md-offset-3" id="form">
       <center><b 
class="registration">Reset Password</b></center>
            <form name="form" action="ResetPassword" method="post" onsubmit="return validate()">
                <%  
                    String username=request.getParameter("username");
         %>
    <div class="form-group">
            <label>Username :</label>
          <input type="text" class="form-control" name="username" value="<%=username%>" placeholder="Enter Username" required=""/>
          
        </div>
                <div class="form-group">
            <label>Password :</label>
          <input type="password" class="form-control" name="password" placeholder="Enter Password" required=""/>
          
        </div>
                 <div class="form-group">
            <label>Conform Password :</label>
          <input type="password" class="form-control" name="cpassword" placeholder="Re-Enter Password" required=""/>
          
        </div>
 <div class="form-group">
                        <input type="submit" class="btn btn-primary a" value="Submit"> 
                        <input type="reset" class="btn btn-danger " value="Reset"> 

                    </div>
    </body>
</html>
