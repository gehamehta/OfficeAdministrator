<%-- 
    Document   : AddServiceresponse
    Created on : 15 Jun, 2015, 2:53:08 PM
    Author     : Rachna
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="OfficeAdministrator.DBConnector"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/oa.png" type="image/png">
        <title>Add Response</title>
    </head>
    <body>
         <%
            String from=null;
            String issue=null;
            String remarks=null;
            String status=null;
            String res=null;
            
         String id=request.getParameter("id");
         Statement st=DBConnector.getStatement();
         String query="select ServiceFrom,Issue,Remarks,Status,Response from services where ID='"+id+"'";
         ResultSet rs=st.executeQuery(query);
         if(rs.next()){
             from=rs.getString(1);
             issue=rs.getString(2);
             remarks=rs.getString(3);
             status=rs.getString(4);
             res=rs.getString(5);
         }
         %>
         <form action="AddResponse" method="get"> 
             <input type="hidden" name="id" value="<%=id%>">
         <table>
             <tr>
                 <td>From: </td> 
                 <td><input type="text" value="<%=from%>" name="from"></td>
             </tr>
             <tr>
                 <td>Issue: </td> 
                 <td><input type="text" value="<%=issue%>" name="issue"></td>
             </tr>
             <tr>
                 <td>Response </td> 
                 <td><input type="text" value="<%=res%>" name="response"></td>
             </tr>
             <tr>
             <tr>
                 <td>Remarks: </td> 
                 <td><input type="text" value="<%=remarks%>" name="remarks"></td>
             </tr>
             <tr>
                 <td>Status: </td> 
                 <td><input type="text" value="<%=status%>" name="status"></td>
             </tr>
             <tr>
                 <td></td>
                 <td><input type="submit" value="Update"></td>
             </tr>
         </table>
         </form>
       
    </body>
</html>
