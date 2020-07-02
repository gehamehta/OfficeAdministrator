<%-- 
    Document   : EditCouriers
    Created on : 15-Jun-2015, 14:04:30
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
        <title>Edit Couriers</title>
    </head>
    <body>
        <%
            String from=null;
            String fr=null;
            String type=null;
            String urgency=null;
            String rem=null;
            String cno=null;
            String bno=null;
            String res=null;
            String status=null;
            
           
            String id=request.getParameter("id");
         Statement st=DBConnector.getStatement();
         String query="select CourierFrom,ForDept,Type,Urgency,Remarks,CourierNo,BillNo,Response,Status from couriers where ID='"+id+"'";
         ResultSet rs=st.executeQuery(query);
         if(rs.next()){
             from=rs.getString(1);
             fr=rs.getString(2);
            type=rs.getString(3);
             urgency=rs.getString(4);
             rem=rs.getString(5);
             cno=rs.getString(6);
             bno=rs.getString(7);
             res=rs.getString(8);
            status=rs.getString(9);
             }
         %>
         <form action="AddCouriers" method="get"> 
             <input type="hidden" name="id" value="<%=id%>">
             <b>Edit Details:</b><br><br>
         <table>
             <tr>
                 <td style="width: 125px"><b>From: </b></td> 
                 <td><input type="text" value="<%=from%>" name="from" style="width: 125px" required></td>
             </tr>
             <tr>
                 <td style="width: 125px"><b>For: </b></td> 
                 <td><select name="for" value="<%=fr%>" style="width: 125px">
                                    <option value="Accounts">Accounts</option>
                                    <option value="Marketing">Marketing</option>
                                    <option value="Service">Service</option>
                                    <option value="Stores">Stores</option>
                                    <option value="Director">Director</option>   
                            </select></td>
             </tr>
             <tr>
            
                 <td style="width: 125px"><b>Type: </b></td> 
                 <td><select name="type" value="<%=type%>" style="width: 125px">
                                            <option value="Courier">Courier</option>
                                            <option value="Letter">Letter</option>
                                            <option value="Bill">Bill</option>
                                </select></td>
             </tr>
              <tr>
            
                 <td style="width: 125px"><b>Urgency: </b></td> 
                 <td><select name="urgency" value="<%=urgency%>" style="width: 125px">
                                        <option value="Low">Low</option>
                                        <option value="Normal">Normal</option>
                                        <option value="Critical">Critical</option>
                     </select></td>
             </tr>
             <tr>
            
                 
                 <td style="width: 125px"><b>Remarks: </b></td> 
                 <td><input type="text" value="<%=rem%>" name="remarks" style="width: 125px"></td>
             </tr>
              <tr>
            
                 <td style="width: 125px"><b>Courier no: </b></td> 
                 <td><input type="text" value="<%=cno%>" name="courierno" style="width: 125px" ></td>
             </tr>
              <tr>
            
                 <td style="width: 125px"><b>Bill No: </b></td> 
                 <td><input type="text" value="<%=bno%>" name="billno" style="width: 125px"></td>
             </tr>
            
              <tr>
            
                 <td style="width: 125px"><b>Response: </b></td> 
                 <td><input type="text" value="<%=res%>" name="response" style="width: 125px"></td>
             </tr>
             <tr>
                 <td style="width: 125px"><b> Status: </b></td> 
                 <td><select name="status" value="<%=status%>" style="width: 125px">
                               <option value="Pending">Pending</option>
                               <option value="Proceeded">Proceeded</option>
                            </select></td>
             </tr>
              <tr>
                 <td></td>
                 <td></td>
             </tr>
             <tr>
                 <td></td>
                 <td><input type="submit" value="Update"></td>
             </tr>
         </table>
         </form>
        <form action="DeleteCourier" method="post">
             <input type="hidden" name="id" value="<%=id%>">
            <input type="submit" value="Delete">
        </form>
    </body>
</html>
