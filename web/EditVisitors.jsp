<%-- 
    Document   : EditVisitors
    Created on : 15-Jun-2015, 14:04:10
    Author     : Ayushi
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
        <title>Edit Visitor</title>
    </head>
    <body>
        <%
            String vname=null;
            String purpose=null;
            String enqmsg=null;
            String handledby=null;
            String rem=null;
            
            String status=null;
            String id=request.getParameter("id");
         Statement st=DBConnector.getStatement();
         String query="select Name,Purpose,EnquiryMsg,HandledBy,Remarks,Status from visitors where ID='"+id+"'";
         ResultSet rs=st.executeQuery(query);
         if(rs.next()){
             vname=rs.getString(1);
             purpose=rs.getString(2);
             enqmsg=rs.getString(3);
             handledby=rs.getString(4);
             rem=rs.getString(5);
             
             status=rs.getString(6);
             }
         %>
         <form action="AddVisitors" method="get"> 
             <input type="hidden" name="id" value="<%=id%>">
             <b>Edit Details:</b><br><br>
         <table>
             <tr>
                 <td><b>Name: </td> 
                 <td><input type="text" value="<%=vname%>" name="name" required></td>
             </tr>
             <tr>
                 <td><b>Purpose: </td> 
                 <td><input type="text" value="<%=purpose%>" name="purpose" required></td>
             </tr>
             <tr>
                 <td><b>Handled By: </td> 
                 <td><select name="handledby" value="<%=handledby%>" style="width:175px">
                                <option value="Accounts">Accounts</option>
                                <option value="Marketing">Marketing</option>
                                <option value="Service">Service</option>
                                <option value="Stores">Stores</option>
                                <option value="Director">Director</option>
                                <option value="Front Office">Front Office</option>
                            </select>
                </td>
             </tr>
             <tr>
                 <td><b>Message: </td> 
                 <td><input type="text" value="<%=enqmsg%>" name="enquirymsg"></td>
             </tr>
             <tr>
                 <td><b>Remarks: </td> 
                 <td><input type="text" value="<%=rem%>" name="remarks"></td>
             </tr>
            
             <tr>
                 <td><b>Status </td> 
                 <td><select name="status" value="<%=status%>" style="width:150px">
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
       <form action="DeleteVisitor" method="post">
             <input type="hidden" name="id" value="<%=id%>">
            <input type="submit" value="Delete">
        </form>
    </body>
</html>
