<%-- 
    Document   : EditMaterials
    Created on : 15-Jun-2015, 14:04:50
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
        <title>Edit Materials</title>
    </head>
    <body>
         <%
            String pname=null;
            String quant=null;
            String from=null;
            String fr=null;
           
            String id=request.getParameter("id");
         Statement st=DBConnector.getStatement();
         String query="select ProductName,Quantity,ProductFrom,ForDept from materials where ID='"+id+"'";
         ResultSet rs=st.executeQuery(query);
         if(rs.next()){
             pname=rs.getString(1);
             quant=rs.getString(2);
             from=rs.getString(3);
             fr=rs.getString(4);
            
             }
         %>
         <form action="AddMaterials" method="get"> 
             <input type="hidden" name="id" value="<%=id%>">
             <b>Edit Details:</b><br><br>
         <table>
             <tr>
                 <td><b>Product Name: </td> 
                 <td><input type="text" value="<%=pname%>" name="name" required></td>
             </tr>
             <tr>
                 <td><b>Quantity </td> 
                 <td><input type="number" value="<%=quant%>" name="quantity" min="1" required></td>
             </tr>
             <tr>
                 <td><b>From </td> 
                 <td><input type="text" value="<%=from%>" name="from" required=""></td>
             </tr>
             <tr>
                 <td><b>For </td> 
                 <td><select name="for" value="<%=fr%>" style="width:150px">
                                <option value="Accounts">Accounts</option>
                                <option value="Marketing">Marketing</option>
                                <option value="Service">Service</option>
                                <option value="Stores">Stores</option>
                                <option value="Director">Director</option>
                            </select>
                     </td>
             </tr>
             
             <tr>
                 <td></td>
                 <td><input type="submit" value="Update"></td>
             </tr>
         </table>
         </form>
   <form action="DeleteMaterial" method="post">
             <input type="hidden" name="id" value="<%=id%>">
            <input type="submit" value="Delete">
        </form>
    </body>
</html>
