<%-- 
    Document   : AddMarketingResponse
    Created on : 15 Jun, 2015, 4:19:05 PM
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
        <title>Add Response</title>
    </head>
    <body>
        
        <%
            String from=null;
            String res=null;
            String msg=null;
            String status=null;
            String quotation=null;
            String followup=null;
            
         String id=request.getParameter("id");
         Statement st=DBConnector.getStatement();
         String query="select EnquiryFrom,EnquiryMsg,Response,Quotation,Status,FollowUp from marketing where ID='"+id+"'";
         ResultSet rs=st.executeQuery(query);
         if(rs.next()){
             from=rs.getString(1);
             msg=rs.getString(2);
             res=rs.getString(3);
             quotation=rs.getString(4);
             status=rs.getString(5);
             followup=rs.getString(6);
         }
         %>
         <form action="AddResponse" method="post"> 
             <input type="hidden" name="id" value="<%=id%>">
         <table>
             <tr>
                 <td>From: </td> 
                 <td><input type="text" value="<%=from%>" name="from" required></td>
             </tr>
             <tr>
                 <td>Enquiry Message: </td> 
                 <td><input type="text" value="<%=msg%>" name="msg" required></td>
             </tr>
              <tr>
                 <td>Response: </td> 
                 <td><input type="text" value="<%=res%>" name="response"></td>
             </tr>
              <tr>
                 <td>Quotation: </td> 
                 <td><input type="text" value="<%=quotation%>" name="quotation"></td>
             </tr>
             <tr>
             <td> Status :</td>
             <td><select name="status" style="width:175px">
                                <option value="In Progress">In Progress</option>
                                <option value="Completed">Completed</option>
                            </select>
             </td>
         </tr>
              <tr>
                 <td>Follow Up: </td> 
                 <td><input type="text" value="<%=followup%>" name="followup"></td>
             </tr>
             <tr>
                 <td></td>
                 <td><input type="submit" value="Update"></td>
             </tr>
         </table>
         </form>
    </body>
</html>
