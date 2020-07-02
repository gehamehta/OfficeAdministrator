<%-- 
    Document   : EditCalls
    Created on : 15 Jun, 2015, 1:22:51 PM
    Author     : Rachna
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="OfficeAdministrator.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/oa.png" type="image/png">
        <title>Edit Calls</title>
    </head>
    <body>
        <%
            String cname=null;
            String rname=null;
            String no=null;
            String msg=null;
            String rem=null;
            String ct=null;
            String tt=null;
            String cs=null;
         String id=request.getParameter("id");
         Statement st=DBConnector.getStatement();
         String query="select CallerName,ReceiverName,Number,Message,Remarks,CallType,TransferredTo,CallStatus from calls where CallID='"+id+"'";
         ResultSet rs=st.executeQuery(query);
         if(rs.next()){
             cname=rs.getString(1);
             rname=rs.getString(2);
             no=rs.getString(3);
             msg=rs.getString(4);
             rem=rs.getString(5);
             ct=rs.getString(6);
             tt=rs.getString(7);
             cs=rs.getString(8);
         }
         System.out.println(id+" "+cname+" "+rname+" "+no+" "+msg+" "+rem+" "+ct+" "+tt+" "+cs);
         %>
         
         <form action="AddCalls" method="get"> 
             <input type="hidden" name="id" value="<%=id%>">
             <b>Edit Details:</b><br><br>
         <table>
             <tr>
                 <td style="width: 150px"><b>Caller Name: </b></td> 
                 <td><input type="text" value="<%=cname%>" name="callername" style="width: 150px" required></td>
             </tr>
             <tr>
                 <td style="width: 150px"><b>Receiver Name: </b></td> 
                 <td><input type="text" value="<%=rname%>" name="receivername" style="width: 150px" required></td>
             </tr>
             <tr>
                 <td style="width: 150px"><b>Caller Number: </b></td> 
                 <td><input type="text" value="<%=no%>" name="number" pattern="^\d{10}$" size="10" placeholder="10-digits"  style="width: 150px"></td>
             </tr>
             <tr>
                 <td style="width: 150px"><b>Message: </b></td> 
                 <td><input type="text" value="<%=msg%>" name="message" style="width: 150px" required></td>
             </tr>
             <tr>
                 <td style="width: 150px"><b>Remarks: </b></td> 
                 <td><b><input type="text" value="<%=rem%>" name="remarks" style="width: 150px"></td>
             </tr>
             <tr>
                 <td style="width: 150px"><b>Call Type </b></td> 
                 <td><select name="calltype" value="<%=ct%>" style="width: 150px">
                                <option value="Incoming">Incoming</option>
                                <option value="Outgoing">Outgoing</option>
                     </select></td>
             </tr>
             <tr>
                 <td style="width: 150px"><b>Transferred To: </b></td> 
                 <td><select id="tranto" name="transferredto" value="<%=tt%>" style="width: 150px">
                                <option value="None">None</option>
                                <option value="Accounts">Accounts</option>
                                <option value="Marketing">Marketing</option>
                                <option value="Service">Service</option>
                                <option value="Stores">Stores</option>
                                <option value="Director">Director</option>
                            </select></td>
             </tr>
             <tr>
                 <td style="width: 150px"><b>Call Status</b> </td> 
                 <td> <select name="callstatus" value="<%=cs%>" style="width: 150px">
                                <option value="Open">Open</option>
                                <option value="Closed">Closed</option>
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
        <form action="DeleteCall" method="post">
             <input type="hidden" name="id" value="<%=id%>">
            <input type="submit" value="Delete">
        </form>
    </body>
</html>
