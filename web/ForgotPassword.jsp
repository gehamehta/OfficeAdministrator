<%-- 
    Document   : ForgotPassword
    Created on : 27 Jun, 2015, 1:49:53 PM
    Author     : Rachna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/oa.png" type="image/png">
        <title>Forgot Password</title>
    </head>
    <body>
        <form action="SendEmail" method="post">
            <br><b>Enter your registered Email ID :</b> <input type="text" name="to"><br><br>
            <input type="submit" value="Submit" style="margin-left: 13%" >
        </form>
        
    </body>
</html>
