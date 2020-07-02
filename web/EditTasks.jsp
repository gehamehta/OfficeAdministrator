<%-- 
    Document   : EditTasks
    Created on : 24-Jun-2015, 10:18:39
    Author     : Ayushi
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
        <title>Edit Task</title>
    </head>
    <body>
        <%
            String task=null;
            String cat=null;
            String comp=null;
            String priority=null;
            String rem=null;
            String stime=null;
            String status=null;
            String fu=null;
         String id=request.getParameter("id");
         String empid=request.getParameter("empid");
         Statement st=DBConnector.getStatement();
         String query="select Task,Category,CompanyName,Priority,Remarks,ScheduleTime,Status,FollowUp from tasksheet where ID='"+id+"'";
         ResultSet rs=st.executeQuery(query);
         if(rs.next()){
             task=rs.getString(1);
             cat=rs.getString(2);
             comp=rs.getString(3);
             priority=rs.getString(4);
             rem=rs.getString(5);
             stime=rs.getString(6);
             status=rs.getString(7);
             fu=rs.getString(8);
         }
         System.out.println(id+" "+task+" "+cat+" "+comp+" "+priority+" "+rem+" "+stime+" "+status+" "+fu);
         %>
         <form action="AddTask" method="get"> 
             <input type="hidden" name="id" value="<%=id%>">
             <input type="hidden" name="empid" value="<%=empid%>">
         <table>
             <tr>
                 <td><b>Task : </td> 
                 <td><input type="text" value="<%=task%>" name="task" required></td>
             </tr>
             <tr>
                 <td><b>Category : </td> 
                 <td><input type="text" value="<%=cat%>" name="category"></td>
             </tr>
             <tr>
                 <td><b>Company : </td> 
                 <td><input type="text" value="<%=comp%>" name="companyname"></td>
             </tr>
             <tr>
                 <td><b>Priority: </td> 
                 <td><input type="text" value="<%=priority%>" name="priority"></td>
             </tr>
             <tr>
                 <td><b>Remarks: </td> 
                 <td><b><input type="text" value="<%=rem%>" name="remarks"></td>
             </tr>
             <tr>
                 <td><b>Schedule time </td> 
                 <td><input type="text" value="<%=stime%>" name="scheduletime"></td>
             </tr>
             <tr>
                 <td><b>Status : </td> 
                 <td><input type="text" value="<%=status%>" name="status"></td>
             </tr>
             <tr>
                 <td><b>Follow Up : </td> 
                 <td><input type="text" value="<%=fu%>" name="followup"></td>
             </tr>
             
             <tr>
                 <td></td>
                 <td><input type="submit" value="Update"></td>
             </tr>
         </table>
         </form>
             <form action="DeleteTask" method="post">
             <input type="hidden" name="id" value="<%=id%>">
              <input type="hidden" name="empid" value="<%=empid%>">
            <input type="submit" value="Delete">
        </form>
    </body>
</html>

