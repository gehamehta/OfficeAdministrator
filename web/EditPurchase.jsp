<%-- 
    Document   : EditPurchase
    Created on : 15 Jun, 2015, 2:02:24 PM
    Author     : Rachna
--%>

<%@page import="OfficeAdministrator.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/oa.png" type="image/png">
        <title>Edit Purchase</title>
    </head>
    <body>
        <%
            String name=null;
            String quant=null;
            String amount=null;
            String mode=null;
            String status=null;
            
         String billno=request.getParameter("billno");
         Statement st=DBConnector.getStatement();
         String query="select Name,Quantity,Amount,PaymentMode,PaymentStatus from itemspurchased where BillNo='"+billno+"'";
         ResultSet rs=st.executeQuery(query);
         if(rs.next()){
             name=rs.getString(1);
             quant=rs.getString(2);
             amount=rs.getString(3);
             mode=rs.getString(4);
             status=rs.getString(5);
         }
         %>
         <form action="AddPurchase" method="get"> 
             <input type="hidden" name="billno" value="<%=billno%>">
             <b>Edit Details:</b><br><br>
         <table>
             <tr>
                 <td>Name: </td> 
                 <td><input type="text" value="<%=name%>" name="name" required></td>
             </tr>
             <tr>
                 <td>Quantity: </td> 
                 <td><input type="number" value="<%=quant%>" min="1" name="quantity" required></td>
             </tr>
             <tr>
                 <td>Amount: </td> 
                 <td><input type="text" value="<%=amount%>" name="amount" pattern="^[0-9]+.[0-9]{2}$" required placeholder="xxx.xx"></td>
             </tr>
             <tr>
                 <td>Payment Mode: </td> 
                 <td><select name="paymentmode" value="<%=mode%>" style="width:175px">
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
                 <td><select name="status" value="<%=status%>" style="width:175px">
                                <option value="Pending">Pending</option>
                                <option value="Paid">Paid</option>
                            </select>
                 </td>
             </tr>
             <tr>
                 <td></td>
                 <td><input type="submit" value="Update"></td>
             </tr>
         </table>
         </form>
        <form action="DeletePurchase" method="post">
             <input type="hidden" name="billno" value="<%=billno%>">
            <input type="submit" value="Delete">
        </form>
    </body>
</html>
