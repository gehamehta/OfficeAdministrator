<%--
    Document   : EditPayment
    Created on : 15 Jun, 2015, 2:02:43 PM
    Author     : Rachna
--%>

<%@page import="java.lang.String"%>
<%@page import="OfficeAdministrator.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/oa.png" type="image/png">
        <title>Edit Payment</title>
    </head>
    <body>
        <%
            String mode=null;
            String status=null;
            String fr=null;
            String amt=null;
            
         String billno=request.getParameter("billno");
         Statement st=DBConnector.getStatement();
         String query="select PaymentFor,Amount,PaymentMode,PaymentStatus from payments where BillNo='"+billno+"'";
         ResultSet rs=st.executeQuery(query);
         if(rs.next()){
             fr=rs.getString(1);
             amt=rs.getString(2);
             mode=rs.getString(3);
             status=rs.getString(4);
         }
         %>
         <form action="AddPayment" method="get"> 
             <input type="hidden" name="billno" value="<%=billno%>">
             <b>Edit Details:</b><br><br>
         <table>
             <tr>
                 <td>Payment For: </td> 
                 <td><input type="text" value="<%=fr%>" name="name" required></td>
             </tr>
             <tr>
                 <td>Amount: </td> 
                 <td><input type="text" value="<%=amt%>" name="amount" pattern="^[0-9]+.[0-9]{2}$" required placeholder="xxx.xx"></td>
             </tr>
             <tr>
                  <td>Payment Mode: </td> 
                 <td><select name="paymentmode" style="width:175px" value="<%=mode%>">
                                <option value="Cash">Cash</option>
                                <option value="Cheque">Cheque</option>
                                <option value="Demand Draft">Demand Draft</option>
                                <option value="Money Order">Money Order</option>
                                <option value="Net Banking">Net Banking</option>    
                            </select>
                </td>
             </tr>
             <tr>
                 <td>Payment Status: </td> 
                 <td><select name="status" style="width:175px" required>
                                <option value="Pending">Pending</option>
                                <option value="Paid">Paid</option>
                                <option value="Received">Received</option>
                            </select>
                </td>
             </tr>
             <tr>
                 <td></td>
                 <td><input type="submit" value="Update"></td>
             </tr>
         </table>
         </form>
        <form action="DeletePayment" method="post">
             <input type="hidden" name="billno" value="<%=billno%>">
            <input type="submit" value="Delete">
        </form>
    </body>
</html>
