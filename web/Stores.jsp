<%-- 
    Document   : Stores
    Created on : 4 Jun, 2015, 2:38:46 PM
    Author     : Rachna
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="OfficeAdministrator.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/tabcontent.css" rel='stylesheet' type='text/css' />
        <link rel="shortcut icon" href="images/oa.png" type="image/png">
        <script src="css/tabcontent.js" type="text/javascript"></script>
         <!-- Date Picker jQuery -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet"type="text/css"/>

        <title>Stores</title>
        <style>
            table, tr, td {
                border: 0;
                text-align: left;
        }
       </style>
    </head>
    <body>
    <%
       String id= (String)(session.getAttribute("empid"));
        if(id==null)
          response.sendRedirect("Login");
       System.out.println(id);  
        session.setAttribute("id",id);
       String query="select FullName from employee where EmpID='"+id+"'";
       System.out.println(query);
       String name=null;
       Statement st=DBConnector.getStatement();
       ResultSet rs=st.executeQuery(query);
       if(rs.next()){
           name=rs.getString(1);
           System.out.println(rs.getString(1)+" "+name);
       }
    %>
    <% //Java/MySQL format of date 
                Date dt=new Date(System.currentTimeMillis());
                SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat fmt = new SimpleDateFormat("MMMM dd, yyyy");
                System.out.println(df.format(dt));%>
               
                <% //DatePicker format of date
                Date dat=new Date(System.currentTimeMillis());
                SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
                System.out.println(sdf.format(dat)); 
%>
        <h1 style=" text-align:center; font-size: 110%; font-family:sans serif;"><img src="images/oa.png"></h1><hr>
        <div  style="text-align: left; font-size: 20px; float: left; width: 50%; font-family: serif;"><b>Welcome <%=name%></b></div>
         <div  style="text-align: right; font-size: 20px; float: right; width: 50%; font-family: serif;">
              <a href="MyProfile.jsp"><img src="images/myprofile.jpg" alt="My Profile"></a>
            &nbsp;&nbsp;&nbsp;
            <a  href="Login"><img src="images/logout.jpg" alt="Logout"></a></div> <br><br>
        <h1 style=" text-align:center; font-family:sans serif;">Stores</h1><hr/>
        
        <div style="width: 100%; margin: 0 auto ; padding: 30px 0 40px;">
        <ul class="tabs" data-persist="true">
            <li><a href="#view1">Add Product</a></li>
            <li><a href="#view2">View Stock List</a></li>
            <li><a href="#view3">Task Sheet</a></li>
        </ul>
        <div class="tabcontents">
            <div id="view1">
                <br><br> <form action="AddProduct" method="post">
                    <table >
                        <tr>
                            <td>Store Entry No. : </td>
                            <td><input type="text" name="sen" required></td>
                        </tr>
                        <tr>
                            <td>Product Name : </td>
                            <td><input type="text" name="name" required></td>
                        </tr>
                        <tr>
                            <td>Category : </td>
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
                                </select> 
                            </td>
                        </tr>
                        <tr>
                            <td>Price : </td>
                            <td><input type="text" name="price" pattern="^[0-9]+.[0-9]{2}$" required placeholder="xxx.xx"></td>
                        </tr>
                        <tr>
                            <td>Specifications : </td>
                            <td><input type="text" name="specs" required></td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <td></td>
                            <td style="text-align: center"><input type="submit" value="Submit" ></td>
                        </tr>
                    </table>
                </form>
            </div>
            
           
            
            <div id="view2">
                <div style="width: 80%; margin: 0 auto ; padding: 50px 0 40px;">
                     <ul class="tabs" data-persist="true">
                        <li><a href="#vview1">Category Wise</a></li>
                        <li><a href="#vview2">Product Wise</a></li>
                    </ul>
            <div class="tabcontents">
            <div id="vview1">
                 <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printcat')"  />
                <div id="printcat">
                <b>Product Details:</b><br><br>
                <table style="border: 2px solid black">
                    <tr style="border: 2px solid black">
                        <td style="width:200px;border: 2px solid black"><b>Category</td>
                        <td style="width:200px;border: 2px solid black"><b>Quantity</td>
                    </tr>
                    <% 
                    query="create VIEW stockcat1 AS SELECT Category,COUNT(*) AS Quantity FROM stock GROUP BY Category";
                    try{
                    int i=st.executeUpdate(query);
                    query="select * from stockcat1";
                    System.out.println(query);
                    rs=st.executeQuery(query);
                    while(rs.next()){
                    %>
                    <tr style="border: 2px solid black">
                        <td style="width:200px;border: 2px solid black"><%=rs.getString(1)%></td>
                        <td style="width:200px;border: 2px solid black"><%=rs.getString(2)%></td>
                    </tr>
                        
                    <%  
                    }
                    }catch(SQLException e){ e.printStackTrace();}
                    finally{
                    query="drop view stockcat1";
                    int i=st.executeUpdate(query);
                    }%>
                
                </table>
                </div>
            </div>
                 <div id="vview2">
                
                <form action="UpdateProduct.jsp"  >
                     Enter Store Entry No. : <input type="text" name="sen">&nbsp;&nbsp;&nbsp;
                     <input type="submit" value="Update">
                </form><br><br>
                  
                <form action="DeleteProduct" method="post" >
                     Enter Store Entry No. : <input type="text" name="sen">&nbsp;&nbsp;&nbsp;
                     <input type="submit" value=Delete>
                </form><br><br>
                 <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printpro')"  />
                <div id="printpro">
                <b>Product Details:</b><br><br>
                <table style="border: 2px solid black">
                    <tr style="border: 2px solid black">
                        <td style="width:200px;border: 2px solid black"><b>Store Entry No.</td>
                        <td style="width:200px;border: 2px solid black"><b>Product Name</td>
                        <td style="width:200px;border: 2px solid black"><b>Category</td>
                        <td style="width:200px;border: 2px solid black"><b>Price</td>
                        <td style="width:200px;border: 2px solid black"><b>Specification</td>
                    </tr>
                    <% 
                    query="select * from stock";
                    System.out.println(query);
                    rs=st.executeQuery(query);
                    while(rs.next()){
                    %>
                    <tr style="border: 2px solid black">
                        <td style="width:200px;border: 2px solid black"><%=rs.getString(1)%></td>
                        <td style="width:200px;border: 2px solid black"><%=rs.getString(2)%></td>
                        <td style="width:200px;border: 2px solid black"><%=rs.getString(3)%></td>
                        <td style="width:200px;border: 2px solid black"><%=rs.getString(4)%></td>
                        <td style="width:200px;border: 2px solid black"><%=rs.getString(5)%></td>
                    </tr>
                        
                    <%  
                    }
                    %>
                
                </table>
                </div>
       </div>  
     </div>
 </div>  
     </div>
          <div id="view3">
              <form  action="AddTask" method="post">
                <input type="hidden" name="id" value="<%=id%>">
                <table style="border: 2px solid black">
                    <tr style="border: 2px solid black">
                        <td style="width:100px; border: 2px solid black"><b>Task</td>
                        <td style="width:100px; border: 2px solid black"><b>Remarks</td>
                        <td style="width:100px; border: 2px solid black"><b>Priority</td>
                        <td style="width:100px; border: 2px solid black"><b>Status</td>
                        <td style="width:100px; border: 2px solid black"><b>Follow Up</td>
                    </tr>
                    <tr>
                        <td style="width:100px; border: 2px solid black"><input type="text" name="task" required></td>
                        <td style="width:100px; border: 2px solid black"><input type="text" name="remarks"></td>
                        <td style="width:100px; border: 2px solid black">
                            <select name="priority" style="width:100px">
                                <option value="High">High</option>
                                <option value="Medium">Medium</option>
                                <option value="Low">Low</option>
                            </select>
                        </td>
                        <td style="width:100px; border: 2px solid black">
                            <select name="status" style="width:100px">
                                <option value="Incomplete">Incomplete</option>
                                <option value="In Progress">In Progress</option>
                                <option value="Completed">Completed</option>
                            </select>
                        </td>
                         <td style="width:100px; border: 2px solid black"><input type="text" name="followup"></td>
                     </tr>
              </table>
                <p style="margin-left: 28%"><input type="submit" value="Add"></p>
            </form>
                <hr/>
                <br><b>View Task Details:</b><br><br>
                 <form action="DispTasks.jsp">
                    <input type="hidden" name="id" value="<%=id%>">
                    From : <input type="text" id="fromdatet" name="fromdate">&nbsp;&nbsp;
                    To : <input type="text" id="todatet" name="todate">&nbsp;&nbsp;
                    <input type="submit" value="View"> 
                </form>
                <br>
                <br>
                    <br>
                    
                <b>Edit Task Details :</b> <br><br>
                <form action="EditTaskDept.jsp">  
                    <input type="hidden" name="empid" value="<%=id%>">
                    Enter ID: <input type="text" name="id">&nbsp;&nbsp;&nbsp;   
                    <input type="submit" value="Edit">
                </form>
                
                <br><br><hr> <br>
                 <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printtask')"  />
                <div id="printtask">
                <br><b>Task Details:&nbsp;&nbsp;<%=fmt.format(dt)%></b> <br><br>
                <table style="border: 2px solid black">
                    <tr style="border: 2px solid black">
                        <td style="width:100px; border: 2px solid black"><b>Date</td>
                        <td style="width:100px;border: 2px solid black"><b>Time</td>
                        <td style="width:100px;border: 2px solid black"><b>ID</td>
                        <td style="width:100px; border: 2px solid black"><b>Task</td>
                        <td style="width:100px; border: 2px solid black"><b>Remarks</td>
                        <td style="width:100px; border: 2px solid black"><b>Priority</td>
                        <td style="width:100px; border: 2px solid black"><b>Status</td>
                        <td style="width:100px; border: 2px solid black"><b>Follow Up</td>
                    </tr>
                     <%
                    query="select DATE_FORMAT(Date,'%b %d') as Date,Time,ID,Task,Remarks,Priority,"+
                           "Status,FollowUp from tasksheet where UserId='"+id+"' and Date='"+df.format(dt)+"' order by "+
                            "Priority='High' desc, Priority='Medium' desc, Priority='Low' desc, Status='Incomplete' desc, "+
                            "Status='In Progress' desc, Status='Completed' desc, Time desc" ;
                     rs=st.executeQuery(query);
                    while(rs.next()){ %>
                    <tr>
                        <td style="width:100px; border: 2px solid black"><%=rs.getString(1)%></td>
                        <td style="width:100px; border: 2px solid black"><%=rs.getString(2)%></td>
                        <td style="width:100px; border: 2px solid black"><%=rs.getString(3)%></td>
                        <td style="width:100px; border: 2px solid black"><%=rs.getString(4)%></td>
                        <td style="width:100px; border: 2px solid black"><%=rs.getString(5)%></td>
                        <td style="width:100px; border: 2px solid black"><%=rs.getString(6)%></td>
                        <td style="width:100px; border: 2px solid black"><%=rs.getString(7)%></td>
                        <td style="width:100px; border: 2px solid black"><%=rs.getString(8)%></td>
                   </tr>
                 <% } %>
                </table>
                </div>
             </div>
        
                 
            </div>
            </div>
         
            
    </body>
    <!--DatePicker-->
<script type="text/javascript">
$(function () {
    $("#fromdatet").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(dat)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#todatet").datepicker("option", "minDate", dt);
        }
    });
    $("#todatet").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(dat)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#fromdatet").datepicker("option", "maxDate", dt);
        }
    });
});
</script>
<script language="javascript" type="text/javascript">
        function printDiv(divID) {
            //Get the HTML of div
            var divElements = document.getElementById(divID).innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML = 
              "<html><head><title></title></head><body>" + 
              divElements + "</body>";

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;
          location.reload();
        }
    </script>
</html>
