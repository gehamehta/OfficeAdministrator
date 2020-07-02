<%-- 
    Document   : Home
    Created on : 2 Jun, 2015, 7:37:50 PM
    Author     : Rachna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <link rel="shortcut icon" href="images/oa.png" type="image/png">
        <title>Office Administrator</title>
    </head>
    <body>
        
        <h2 style="color: white; text-align:center; font-size:300%; font-family:sans serif;">Office Administrator</h2><br>
	
				 <!-----start-main---->
				<div class="login-form">
						<h1>Sign In</h1>
						
				<form action="Login" method="post">
                                  <h3 style="color:red"><%=request.getAttribute("errorMessage")%></h3>	
                                    <br/>
                                    <li>
                                            <input type="text" name="empid" class="text" value="EmployeeID" required="true" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'EmployeeID';}" >
                                                <a href="#" class=" icon user"></a>
					</li>
					<li>
                                            <input type="password" value="Password" name="password" required="true" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}"><a href="#" class=" icon lock"></a>
					</li>

<div class ="forgot">
    <input type="submit"  value="Sign In" > 
            <a href="#" class=" icon arrow"></a>  

            <a href="ForgotPassword.jsp" style="color: white; float: right;">Forgot Password?</a></h3> </div>    

</form>
</div>
		


		  <!-----start-copyright---->
                  
   					<div class="copy-right">
						<p>Systematix Technologies Pvt. Ltd.</p> 
					</div>
				<!-----//end-copyright---->
		 		
</body>
    </body>
</html>
