<%-- 
    Document   : EditService
    Created on : 15 Jun, 2015, 2:52:57 PM
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
        <title>Edit Service</title>
    </head>
    <body>
        <%
            String from=null;
            String type=null;
            String mode=null;
            String issue=null;
            String rem=null;
            String status=null;
            
         String id=request.getParameter("id");
         Statement st=DBConnector.getStatement();
         String query="select * from services where ID='"+id+"'";
         ResultSet rs=st.executeQuery(query);
         if(rs.next()){
             from=rs.getString(2);
             type=rs.getString(3);
             mode=rs.getString(4);
             issue=rs.getString(5);
             rem=rs.getString(6);
             status=rs.getString(11);
         }
         %>
         <form action="AddService" method="get"> 
             <input type="hidden" name="id" value="<%=id%>">
             <b>Edit Details:</b><br><br>
         <table>
             <tr>
                 <td>Customer Name: </td> 
                 <td><input type="text" value="<%=from%>" name="from" required></td>
             </tr>
             <tr>
                 <td>Service Type: </td> 
                 <td><select name="servicetype" value="<%=type%>" style="width:175px" required>
                                <option value="Warranty">Warranty</option>
                                <option value="Chargeable">Chargeable</option>
                            </select>
                </td>
             </tr>
             <tr>
                 <td>Request Mode: </td> 
                 <td><select name="requestmode" value="<%=mode%>" style="width:175px">
                                <option value="Call">Call</option>
                                <option value="Mail">Mail</option>
                                <option value="Visitor">Visitor</option>
                        </select>
                  </td>
             </tr>
             <tr>
                 <td>Issue: </td> 
                 <td><input type="text" value="<%=issue%>" name="issue" required></td>
             </tr>
             <tr>
                 <td>Remarks: </td> 
                 <td><input type="text" value="<%=rem%>" name="remarks"></td>
             </tr>
             <tr>
                 <td>Status: </td> 
                 <td><select name="status" value="<%=status%>" style="width:175px">
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
       
        <form action="DeleteService" method="post">
             <input type="hidden" name="id" value="<%=id%>">
            <input type="submit" value="Delete">
        </form>
    </body>
</html>
