<%-- 
    Document   : adminNavbar
    Created on : May 27, 2018, 10:01:31 AM
    Author     : DINBHANDU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">  
<link rel="stylesheet" href="nav.css">
    </head>
    <body>
  <div class="nav">
      
      
      <a href="#" id="logo" > Attendence Management System</a>
      
            <a href="adminHome.jsp"><span class="glyphicon glyphicon-home"></span> Home</a>
      
             <div class="mydropdown">
                <button class="dropbtns">Techmenter 

                </button>
                <div class="dropdown-contents">
                    <a href="register.jsp">Add New Techmenter</a>
                    <a href="allTechmenter.jsp">All Techmenter</a>
                    
                </div>
            </div> 
            <div class="mydropdown">
                <button class="dropbtns">Students 

                </button>
                <div class="dropdown-contents">
                    <a href="StudentRegister.jsp">Student Register</a>
                    <a href="AllStudent.jsp">All Student</a>
                    <a href="StudentSearch.jsp">Search</a>
                </div>
            </div> 
            <div class="mydropdown">
                <button class="dropbtns">Batch 

                </button>
                <div class="dropdown-contents">
                    <a href="batch.jsp">Issue New Batch</a>
                    <a href="allBatch.jsp">All Batch</a>  
                    <a href="addStudentInBatch.jsp">Add Student In Batch</a>
                </div>
            </div> 
            <div class="mydropdown">
                <button class="dropbtns">Course 

                </button>
                <div class="dropdown-contents">
                    <a href="addCourse.jsp">New Course</a>
                    <a href="AllCourseList.jsp">All Course</a>
                </div>
            </div> 
            <div class="mydropdown">
                <button class="dropbtns">Attendence 

                </button>
                <div class="dropdown-contents">
                      <a href="SearchAttendence.jsp">Attendence</a> 
                <a href="AllAttendence.jsp">All Attendence List</a>
            </div> 
            </div>
            <div class="mydropdown">
                <button class="dropbtns">
                    
                    <%
                        String username1="";
                        String name="";
                        
		if (session != null) {
			if (session.getAttribute("username") != null) {
				 username1 = (String) session.getAttribute("username");
				 name=(String)session.getAttribute("name");
			} else {
				response.sendRedirect("login.jsp");
			}
		}
	%>    
                    
                <span class="glyphicon glyphicon-user"></span>   
                    <%=name%>

                </button>
                <div class="dropdown-contents">
                    <a href="#">Account Setting</a>   
                   <a href="resetpassword.jsp?username=<%=username1%>">Change Password</a>    
                    <a href="LogoutTech"><span class="glyphicon glyphicon-log-out"></span>   Logout</a>   
               
            </div>
            </div> 
        </div>
    </body>
</html>
