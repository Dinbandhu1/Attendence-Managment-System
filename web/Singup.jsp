<%-- 
    Document   : Singup
    Created on : May 18, 2018, 3:41:48 PM
    Author     : DINBHANDU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Singup</title>
 <link href="assets/css/bootstrap.min.css" rel="stylesheet">       
<link href="css/SingupStyle.css" rel="stylesheet">
<script src="assets/js/validation.js"></script>


    </head>
  <body background-color:blue;>
      <%
		String err = "";
		if (request.getAttribute("err") != null) {
			err = (String) request.getAttribute("err");
		}
	%>
        
    <div class="container">
     <div class="row">
        <div class="col-md-6 col-md-offset-3" id="form">
       <center><b 
class="registration">Sineup Form</b></center>
            <form  name="form" action="Singup" method="post" onsubmit="return validate()">
                <h3 style="color: red"><%=err%></h3>

    <div class="form-group">
        <label>Employee ID :</label>
      <input type="text" class="form-control" name="eid"   placeholder="Enter your Employee ID" required=""/>
     
    </div>
    <div class="form-group">
            <label>Username :</label>
          <input type="text" class="form-control" name="username" placeholder="Enter Username" required=""/>
          <span id="usererror" class="text-danger font-Weight-bold"></span>
        </div>
        <div class="form-group">
                <label>Password:</label>
                 <input type="password" class="form-control" name="password" placeholder="Enter Password" required=""/>
                 <span id="passworderror" class="text-danger font-Weight-bold"></span>
            </div>
                 <div class="form-group">
                    <label>Conform Password :</label>
                 <input type="password" class="form-control" name="cpassword" placeholder="Enter Conform Password" required=""/>
                 <span id="conformpassworderror" class="text-danger font-Weight-bold"></span>
   
                 </div>
                <div class="form-group">
                            <label for="securityquestion" class="cols-sm-2 control-label">Select Security Question</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>

                                    <select class="form-control" id="squestion" name="squestion" required="">
                                        <option value="">----Select Security Question----</option>
                                        <option value="What is Your Nick Name?">What is Your Nick Name?</option>
                                        <option value="What is your Favroit Food">What is your Favroit Food?</option>
                                    </select>

                                </div>
                            </div>
                        </div>
                <div class="form-group">
                            <label for="answer" class="cols-sm-2 control-label">Answer</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-home" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="answer" id="address"  placeholder="Enter your Answer" required=""/>
                                </div>
                            </div>
                        </div>

                  <div class="p-container">
					<label class="checkbox two"><input type="checkbox"
						name="checkbox" checked><i></i>I agree <a href="#">Terms of service</a></label>
		        </div>
 
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary a" value="Submit"> 
                        <input type="reset" class="btn btn-danger " value="Reset"> 

                    </div>
                    <div class="text-center ">
						<a class="txt2" href="login.jsp">
							Already hava account Login
							<i class="glyphicon glyphicon-hand-left" aria-hidden="true"></i>
						</a>
					</div>
   
                   </form>

        </div>
     </div>
    </div>
               
</body> 
</html>
