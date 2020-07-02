<%-- 
    Document   : EditTaskDept
    Created on : 24-Jun-2015, 11:25:44
    Author     : Ayushi
--%>

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
        <title>Department Task Edit</title>
    </head>
    <body>
        <%
         String task=null;
         String priority=null;
         String rem=null;
         String status=null;
         String fu=null;
         String id=request.getParameter("id");
         String empid=request.getParameter("empid");
         Statement st=DBConnector.getStatement();
         String query="select Task,Priority,Remarks,Status,FollowUp from tasksheet where ID='"+id+"'";
         ResultSet rs=st.executeQuery(query);
         if(rs.next()){
             task=rs.getString(1);
             priority=rs.getString(2);
             rem=rs.getString(3);
             status=rs.getString(4);
             fu=rs.getString(5);
         }
         System.out.println(id+" "+task+"  "+priority+" "+rem+"  "+status+" "+fu);
         %>
         <form action="AddTask" method="get"> 
             <input type="hidden" name="empid" value="<%=empid%>">
             <input type="hidden" name="id" value="<%=id%>">
         <table>
             <tr>
                 <td><b>Task : </td> 
                 <td><input type="text" value="<%=task%>" name="task" required></td>
             </tr>
           
             <tr>
                 <td><b>Priority: </td> 
                 <td><select name="priority" value="<%=priority%>" style="width:150px">
                                <option value="High">High</option>
                                <option value="Medium">Medium</option>
                                <option value="Low">Low</option>
                            </select>
                 </td>
             </tr>
             <tr>
                 <td><b>Remarks: </td> 
                 <td><b><input type="text" value="<%=rem%>" name="remarks"></td>
             </tr>
             
             <tr>
                 <td><b>Status : </td> 
                 <td><select name="status" value="<%=status%>" style="width:100px">
                                <option value="Incomplete">Incomplete</option>
                                <option value="In Progress">In Progress</option>
                                <option value="Completed">Completed</option>
                            </select>
                   </td>
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


