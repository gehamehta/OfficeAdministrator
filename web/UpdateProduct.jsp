<%-- 
    Document   : UpdateProduct
    Created on : 15-Jun-2015, 16:19:35
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
        <title>Update Product</title>
    </head>
    <body>
         <%
            String name=null;
            String cat=null;
            String price=null;
            String specs=null;
           
            String sen=request.getParameter("sen");
         Statement st=DBConnector.getStatement();
         String query="select Name,Category,Price,Specifications from stock where SEN='"+sen+"' ";
        System.out.println(query);
         ResultSet rs=st.executeQuery(query);
         if(rs.next()){
             name=rs.getString(1);
             System.out.println(name);
            cat=rs.getString(2);
             price=rs.getString(3);
             specs=rs.getString(4);
            
             }
         %>
         <form action="AddProduct" method="get"> 
             <input type="hidden" name="sen" value="<%=sen%>">
         <table>
             <tr>
                 <td>Product Name: </td> 
                 <td><input type="text" value="<%=name%>" name="name" required></td>
             </tr>
             <tr>
                 <td>Category </td> 
                 <td><select name="category">
                                    <option value="Anti Virus">Anti Virus</option>
                                    <option value="Desktop">Desktop</option>
                                    <option value="DVD">DVD</option>
                                    <option value="Hard Disk">Hard Disk</option>
                                    <option value="Keyboard">Keyboard</option>
                                    <option value="Laptop">Laptop</option>
                                    <option value="License Software">License Software</option>
                                    <option value="Monitor">Monitor</option>
                                    <option value="Motherboard">Motherboard</option>
                                    <option value="Mouse">Mouse</option>
                                    <option value="Printer">Printer</option>
                                    <option value="Processor">Processor</option>
                                    <option value="RAM">RAM</option>
                                    <option value="Server">Server</option>
                                    <option value="UPS">UPS</option>
                                    <option value="Workstation">Workstation</option>
                                    <option value="Other">Other</option>
                                </select> </td>
             </tr>
             <tr>
                 <td>Price </td> 
                 <td><input type="text" value="<%=price%>" name="price" pattern="^[0-9]+.[0-9]{2}$" required placeholder="xxx.xx" ></td>
             </tr>
             <tr>
                 <td>Specification </td> 
                 <td><input type="text" value="<%=specs%>" name="specs"></td>
             </tr>
             
             <tr>
                 <td></td>
                 <td><input type="submit" value="Update"></td>
             </tr>
         </table>
         </form>
   
    </body>
</html>
