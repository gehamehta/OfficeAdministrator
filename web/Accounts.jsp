<%-- 
    Document   : Accounts
    Created on : 6 Jun, 2015, 11:24:27 AM
    Author     : Rachna
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="OfficeAdministrator.DBConnector"%>
<%@page import="java.sql.Statement"%>
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

        <title>Accounts</title>
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
               
                <% //DatePivker format of date
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
        <h1 style=" text-align:center; font-family:sans serif;">Accounts</h1><hr/>
        
        <div style="width: 100%; margin: 0 auto ; padding: 30px 0 40px;">
        <ul class="tabs" data-persist="true">
            <li><a href="#view1">Add Purchase</a></li>
            <li><a href="#view2">Add Sales</a></li>
            <li><a href="#view3">Other Payments</a></li>
            <li><a href="#view4">Task Sheet</a></li>
        </ul>
        <div class="tabcontents">
            <div id="view1">
                <form action="AddPurchase" method="post">
                 <table>
                    <tr>
                        <td><b>Bill No.</td>
                        <td><b>Product Name</td>
                        <td><b>Quantity</td>
                        <td><b>Amount</td>
                        <td><b>Payment Mode</td>
                        <td><b>Payment Status</b></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="billno" required style="width:200px"></td>
                        <td><input type="text" name="name" required style="width:200px"></td>
                        <td><input type="number" name="quantity" min="1" required style="width:200px"></td>
                        <td><input type="text" name="amount" pattern="^[0-9]+.[0-9]{2}$" required placeholder="xxx.xx" style="width:200px"></td>
                        <td><select name="paymentmode" style="width:200px">
                                <option value="Cash">Cash</option>
                                <option value="Cheque">Cheque</option>
                                <option value="Demand Draft">Demand Draft</option>
                                <option value="Money Order">Money Order</option>
                                <option value="Net Banking">Net Banking</option>    
                            </select>
                        </td>
                        <td>
                            <select name="status" style="width:200px">
                                <option value="Pending">Pending</option>
                                <option value="Paid">Paid</option>
                            </select>
                        </td>
                      </tr>
                </table>
                <br><input type="submit" value="Submit" style="margin-left: 47%">
                </form>
                <hr/>
                <br><b>View Purchase Details:</b><br><br>
                 <form action="DispPurchase.jsp">
                    <input type="hidden" name="id" value="<%=id%>">
                    From : <input type="text" id="fromdate" name="fromdate">&nbsp;&nbsp;
                    To : <input type="text" id="todate" name="todate">&nbsp;&nbsp;
                    <input type="submit" value="View"> 
                </form>
                <br>
                <br><br>
                    
                <b>Edit Purchase Details :</b> <br><br>
                <form action="EditPurchase.jsp">
                    Enter Bill No. : <input type="text" name="billno">&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="Edit">
                </form>
                <br><br><hr> <br>
                 <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printpurchase')"  />
                
                <div id="printpurchase">
                <br><b>Purchase Details:&nbsp;&nbsp;<%=fmt.format(dt)%></b> <br><br> 
                <br><br>
                <table>
                    <tr>
                        <td style="width:150px"><b>Bill No.</b></td>
                        <td style="width:150px"><b>Product Name</td>
                        <td style="width:150px"><b>Quantity</td>
                        <td style="width:150px"><b>Time</td>
                        <td style="width:150px"><b>Amount</td>
                        <td style="width:150px"><b>Payment Mode</td>
                        <td style="width:150px"><b>Payment Status</td>
                    </tr>
                    <%
                    query="select BillNo,Name,Quantity,Time,Amount,PaymentMode,PaymentStatus from itemspurchased "+
                            "where Date='"+df.format(dt)+"' order by Time desc" ;
                    System.out.println(query);
                    rs=st.executeQuery(query);
                    while(rs.next()){ %>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td>
                    </tr>    
                 <%}%>
                </table>      
                </div>
            </div>
            
             <div id="view2">
                    <form action="AddSales" method="post">
                 <table>
                    <tr>
                        <td><b>Bill No.</td>
                        <td><b>Product Name</td>
                        <td><b>Quantity</td>
                        <td><b>Amount</td>
                        <td><b>Payment Mode</td>
                        <td><b>Payment Status</b></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="billno" required style="width:200px"></td>
                        <td><input type="text" name="name" required style="width:200px"></td>
                        <td><input type="number" name="quantity" min="1" required style="width:200px"></td>
                        <td><input type="text" name="amount" pattern="^[0-9]+.[0-9]{2}$" required placeholder="xxx.xx" style="width:200px"></td>
                        <td><select name="paymentmode" style="width:200px">
                                <option value="Cash">Cash</option>
                                <option value="Cheque">Cheque</option>
                                <option value="Demand Draft">Demand Draft</option>
                                <option value="Money Order">Money Order</option>
                                <option value="Net Banking">Net Banking</option>    
                            </select>
                        </td>
                        <td>
                            <select name="status" style="width:200px">
                                <option value="Pending">Pending</option>
                                <option value="Received">Received</option>
                            </select>
                        </td>
                      </tr>
                </table>
                <br><input type="submit" value="Submit" style="margin-left: 47%">
                </form>
                <hr/>
                <br><b>View Sales Details:</b><br><br>
                 <form action="DispSales.jsp">
                    <input type="hidden" name="id" value="<%=id%>">
                    From : <input type="text" id="fromdates" name="fromdate">&nbsp;&nbsp;
                    To : <input type="text" id="todates" name="todate">&nbsp;&nbsp;
                    <input type="submit" value="View"> 
                </form>
                <br>
                <br><br>
                    
                <b>Edit Sales Details :</b> <br><br>
                <form action="EditSales.jsp">
                    Enter Bill No. : <input type="text" name="billno">&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="Edit">
                </form>
                <br><br><hr> <br>
                <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printsales')"  />
                
                <div id="printsales">
                <br><b>Sales Details:&nbsp;&nbsp;<%=fmt.format(dt)%></b> <br><br> 
                <br><br>
                <table>
                    <tr>
                        <td style="width:150px"><b>Bill No.</b></td>
                        <td style="width:150px"><b>Product Name</td>
                        <td style="width:150px"><b>Quantity</td>
                        <td style="width:150px"><b>Time</td>
                        <td style="width:150px"><b>Amount</td>
                        <td style="width:150px"><b>Payment Mode</td>
                        <td style="width:150px"><b>Payment Status</td>
                    </tr>
                    <%
                    query="select BillNo,Name,Quantity,Time,Amount,PaymentMode,PaymentStatus from itemssold"+
                            " where Date='"+df.format(dt)+"' order by Time desc";
                    System.out.println(query);
                    rs=st.executeQuery(query);
                    while(rs.next()){ %>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td>
                    </tr>    
                 <%}%>
                </table>      
                </div>
            </div>
            
             <div id="view3">
                    <form action="AddPayment" method="post">
                 <table>
                    <tr>
                        <td><b>Bill No.</td>
                        <td><b>Payment For</td>
                        <td><b>Amount</td>
                        <td><b>Payment Mode</td>
                        <td><b>Payment Status</b></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="billno" required style="width:240px"></td>
                        <td><input type="text" name="paymentfor" required style="width:240px"></td>
                        <td><input type="text" name="amount" pattern="^[0-9]+.[0-9]{2}$" required placeholder="xxx.xx" style="width:240px"></td>
                        <td><select name="paymentmode" style="width:240px">
                                <option value="Cash">Cash</option>
                                <option value="Cheque">Cheque</option>
                                <option value="Demand Draft">Demand Draft</option>
                                <option value="Money Order">Money Order</option>
                                <option value="Net Banking">Net Banking</option>    
                            </select>
                        </td>
                        <td>
                            <select name="status" style="width:240px">
                                <option value="Pending">Pending</option>
                                <option value="Paid">Paid</option>
                                <option value="Received">Received</option>
                            </select>
                        </td>
                      </tr>
                </table>
                <br><input type="submit" value="Submit" style="margin-left: 47%">
                </form>
                <hr/>
               <br><b>View Payment Details:</b><br><br>
                 <form action="DispPayment.jsp">
                    <input type="hidden" name="id" value="<%=id%>">
                    From : <input type="text" id="fromdatep" name="fromdate">&nbsp;&nbsp;
                    To : <input type="text" id="todatep" name="todate">&nbsp;&nbsp;
                    <input type="submit" value="View"> 
                </form>
                <br>
                <br><br>
                    
                <b>Edit Payment Details :</b> <br><br>
                <form action="EditPayment.jsp">
                    Enter Bill No. : <input type="text" name="billno">&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="Edit">
                </form>
                <br><br><hr> <br>
                 <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printpayment')"  />
                
                <div id="printpayment">
                <br><b>Payment Details:&nbsp;&nbsp;<%=fmt.format(dt)%></b> <br><br> 
                <br><br>
                <table>
                    <tr>
                        <td style="width:180px"><b>Bill No.</b></td>
                        <td style="width:180px"><b>Payment For</td>
                        <td style="width:180px"><b>Amount</td>
                        <td style="width:180px"><b>Time</td>
                        <td style="width:180px"><b>Payment Mode</td>
                        <td style="width:180px"><b>Payment Status</td>
                    </tr>
                    <%
                    query="select * from payments where Date='"+df.format(dt)+"' order by Time desc";
                    System.out.println(query);
                    rs=st.executeQuery(query);
                    while(rs.next()){ %>
                   <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td>
                    </tr>   
                 <%}%>
                </table>      
                </div>
            </div>
            
            <div id="view4">
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
                        <td style="width:100px; border: 2px solid black"><input type="text" required name="task"></td>
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
    $("#fromdate").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(dat)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#todate").datepicker("option", "minDate", dt);
        }
    });
    $("#todate").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(dat)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#fromdate").datepicker("option", "maxDate", dt);
        }
    });
    $("#fromdates").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(dat)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#todates").datepicker("option", "minDate", dt);
        }
    });
    $("#todates").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(dat)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#fromdates").datepicker("option", "maxDate", dt);
        }
    });
    $("#fromdatep").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(dat)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#todatep").datepicker("option", "minDate", dt);
        }
    });
    $("#todatep").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(dat)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#fromdatep").datepicker("option", "maxDate", dt);
        }
    });
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
