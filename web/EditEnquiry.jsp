<%-- 
    Document   : EditEnquiry
    Created on : 15 Jun, 2015, 4:18:39 PM
    Author     : Rachna
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="OfficeAdministrator.DBConnector"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/oa.png" type="image/png">
        <title>Edit Enquiry</title>
    </head>
    <body>
        <%
            String from=null;
            String mode=null;
            String msg=null;
            String status=null;
            
         String id=request.getParameter("id");
         Statement st=DBConnector.getStatement();
         String query="select EnquiryFrom,EnquiryMode,EnquiryMsg,Status from marketing where ID='"+id+"'";
         ResultSet rs=st.executeQuery(query);
         if(rs.next()){
             from=rs.getString(1);
             mode=rs.getString(2);
             msg=rs.getString(3);
             status=rs.getString(4);
         }
         %>
         <form action="AddEnquiry" method="get"> 
             <input type="hidden" name="id" value="<%=id%>">
             <b>Edit Details:</b><br><br>
         <table>
             <tr>
                 <td>From: </td> 
                 <td><input type="text" value="<%=from%>" name="from" required></td>
             </tr>
             <tr>
                 <td>Enquiry Mode: </td> 
                 <td><select name="enquirymode" value="<%=mode%>" style="width: 150px">
                                <option value="Call">Call</option>
                                <option value="Mail">Mail</option>
                            </select>
                </td>
             </tr>
             <tr>
                 <td>Enquiry Message: </td> 
                 <td><input type="text" value="<%=msg%>" name="msg" required></td>
             </tr>
             <tr>
                 <td>Status: </td> 
                 <td><select name="status" value="<%=status%>" style="width: 150px">
                                <option value="In Progress">In Progress</option>
                                <option value="Completed">Completed</option>
                            </select>
                 </td>
             </tr>
             <tr>
                 <td></td>
                 <td><input type="submit" value="Update"></td>
             </tr>
         </table>
         </form>
       <form action="DeleteEnquiry" method="post">
             <input type="hidden" name="id" value="<%=id%>">
            <input type="submit" value="Delete">
        </form>
    </body>
</html>
