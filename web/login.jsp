<%-- 
    Document   : login
    Created on : May 15, 2018, 1:33:24 PM
    Author     : DINBHANDU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/loginstyle.css">

    </head>
    <body >
        <%
            String err = "";
            if (request.getAttribute("err") != null) {
                err = (String) request.getAttribute("err");
            }
        %>

        <div class="loginBox">
            <img src="images/img.png.jpg" class="user">
            <h2>Log In Here</h2>
            <form action="Login" method="post">
                <li style="color: red"><%=err%></li>
                <p>Username</p>
                <input type="text" name="username"  required=""/>
                <p>Password</p>
                <input type="password" name="password"  required=""/>

                <p>Select Role</p>   <select name="role" required="">
                    <option value="" style="color:green">----Select Role----</option> 
                    <option value="Admin">Admin</option>
                    <option value="Techmenter">Techmenter</option>
                </select>
                <div class="text-right">
                    <a class="txt2" href="forgotpassword.jsp">
                        Forgot password?
                    </a>
                </div>

                <input type="submit" name="" placeholder="Sing In">

                <div class="text-center ">
                    <a class="txt2" href="Singup.jsp">
                        Create your Account
                        <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                    </a>
                </div>

            </form>
        </div>
    </body>

</html>