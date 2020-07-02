<%--
    Document   : FrontOffice
    Created on : 01-Jun-2015, 13:02:00
    Author     : Ayushi
--%>

<%@page import="java.text.ParseException"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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

        
        <title>Front Office</title>
    </head>
    <body ><!--style="background-image: url(images/fob.jpg); background-size: 1440px 720px">-->
        
        
        <%
       String id= (String)(session.getAttribute("empid"));
        if(id==null)
          response.sendRedirect("Login");
       System.out.println(id);  
       session.setAttribute("id",id);
       String query1="select FullName from employee where EmpID='"+id+"'";
       System.out.println(query1);
       String name=null;
       try{
       Statement st=DBConnector.getStatement();
       ResultSet rs=st.executeQuery(query1);
       if(rs.next()){
           name=rs.getString(1);
           System.out.println(rs.getString(1)+" "+name);
       }
       }catch(SQLException e){}
    %>
        <h1 style=" text-align:center; font-size: 110%; font-family:sans serif;"><img src="images/oa.png"></h1><hr>
        <div  style="text-align: left; font-size: 20px; float: left; width: 50%; font-family: serif;"><b>Welcome <%=name%></b></div>
         <div  style="text-align: right; font-size: 20px; float: right; width: 50%; font-family: serif;">
             <a href="MyProfile.jsp"><img src="images/myprofile.jpg" alt="My Profile"></a>
            &nbsp;&nbsp;&nbsp;
            <a  href="Login"><img src="images/logout.jpg" alt="Logout"></a></div> <br><br>
        <h1 style=" text-align:center; font-family:sans serif;">Front Office</h1><hr/>
            
    <div style="width: 100%; margin: 0 auto ; padding: 30px 0 40px;">
        <ul class="tabs" data-persist="true">
            <li><a href="#view1">Add Calls</a></li>
            <li><a href="#view2">Add Visitors</a></li>
            <li><a href="#view3">Add Couriers/Letters/Bills</a></li>
            <li><a href="#view4">Add Materials</a></li>
            <li><a href="#view5">Task Sheet</a></li>

        </ul>
        <div class="tabcontents">
            <div id="view1">
                <form  action="AddCalls" method="post">
                    <table style="width: 100%;">
                    <tr>
                        <td><b>Caller Name</td>
                        <td><b>Receiver Name</td>
                        <td><b>Contact Number</td>
                        <td><b>Message</td>
                        <td><b>Remarks</td>
                        <td><b>Call Type</td>
                        <td><b>Transferred To</td>
                        <td><b>Call Status</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="callername" required style="width:145px"></td>
                        <td><input type="text" name="receivername" required style="width:145px"></td>
                        <td><input type="text" name="number" pattern="^\d{10}$" size="10" placeholder="10-digits" style="width:145px"></td>
                        <td><input type="text" name="message" required style="width:145px"></td>
                        <td><input type="text" name="remarks" style="width:145px"></td>
                        <td><select name="calltype" style="width:145px">
                                <option value="Incoming">Incoming</option>
                                <option value="Outgoing">Outgoing</option>
                            </select>
                        </td>
                        <td><select name="transferredto" style="width:145px">
                                <option value="None">None</option>
                                <option value="Accounts">Accounts</option>
                                <option value="Marketing">Marketing</option>
                                <option value="Service">Service</option>
                                <option value="Stores">Stores</option>
                                <option value="Director">Director</option>
                            </select>
                        </td>
                        <td>
                            <select name="callstatus" style="width:145px">
                                <option value="Open">Open</option>
                                <option value="Closed">Closed</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <br><input type="submit" value="Submit"  style="margin-left: 47%">
                </form>
                <hr/>
                <br><b>View Call Details:</b>                 
                <% //Java/MySQL format of date 
                Date dt=new Date(System.currentTimeMillis());
                SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat fmt = new SimpleDateFormat("MMMM dd, yyyy");
                System.out.println(df.format(dt));%>
               
                <% //DatePivker format of date
                Date dat=new Date(System.currentTimeMillis());
                SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
                System.out.println(sdf.format(dat)); %>
                <br><br>
                <form action="DispCalls.jsp" method="post">
                From: <input type="text" id="fromdate" name="fromdate">&nbsp;&nbsp;
                To: <input type="text" id="todate" name="todate" >
                &nbsp;&nbsp;<input type="submit" value="View">
                </form>
                <br><br>
                <b> Edit Call Details : </b><br><br>
                
                <form action="EditCalls.jsp" method="post">
                    Enter Caller ID: <input type="text" name="id">&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="Edit">
                </form>
                
                <br><br><hr>
                 <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printcalls')"  />
                
               <div id="printcalls">
                <br><b>Call Details:&nbsp;<%=fmt.format(dt)%> </b> <br><br>
                <table>
                    <tr>
                        <td style="width:100px"><b>Date</td>
                        <td style="width:100px"><b>Time</td>
                        <td style="width:100px"><b>Caller ID</td>
                        <td style="width:100px"><b>Caller Name</td>
                        <td style="width:100px"><b>Receiver Name</td>
                        <td style="width:100px"><b>Contact Number</td>
                        <td style="width:100px"><b>Message</td>
                        <td style="width:100px"><b>Remarks</td>
                        <td style="width:100px"><b>Call Type</td>
                        <td style="width:100px"><b>Transferred To</td>
                        <td style="width:100px"><b>Call Status</td>
                       
                    </tr>
                    &nbsp;&nbsp;
                    <%
                   String query="select CallID,CallerName,ReceiverName,Number,Time,DATE_FORMAT(Date,'%b %d') as Date,Message,Remarks,CallType,"+
                           "TransferredTo,CallStatus from calls where Date='"+df.format(dt)+"' order by date desc,time desc " ;
                    System.out.println(query);
                    Statement st=DBConnector.getStatement();
                    ResultSet rs=st.executeQuery(query);
                    while(rs.next()){ %>
                    <tr>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><%=rs.getString(8)%></td>
                        <td><%=rs.getString(9)%></td>
                        <td><%=rs.getString(10)%></td>
                        <td><%=rs.getString(11)%></td>
                       
                    </tr>
                        
                 <% }
                %>
                
                </table> 
               </div>
            </div>
            
            <div id="view2">
                <form action="AddVisitors" method="post">
                 <table>
                    <tr>
                        <td style="width:150px"><b>Name</td>
                        <td style="width:150px"><b>Purpose</td>
                        <td style="width:150px"><b>Enquiry Message</td>
                        <td style="width:150px"><b>Handled By</td>
                        <td style="width:150px"><b>Remarks</td>
                        <td style="width:150px"><b>Status</b></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="name" required></td>
                        <td><input type="text" name="purpose" required></td>
                        <td><input type="text" name="enquirymsg"></td>
                        <td><select name="handledby" style="width:150px">
                                <option value="Accounts">Accounts</option>
                                <option value="Marketing">Marketing</option>
                                <option value="Service">Service</option>
                                <option value="Stores">Stores</option>
                                <option value="Director">Director</option>
                                <option value="Front Office">Front Office</option>
                            </select>
                        </td>
                        <td><input type="text" name="remarks"></td>
                        <td>
                            <select name="status" style="width:150px">
                                <option value="In Progress">In Progress</option>
                                <option value="Completed">Completed</option>
                            </select>
                        </td>
                      </tr>
                </table>
                <br><input type="submit" value="Submit" style="margin-left: 47%">
                </form>
                <hr/>
                <br><b> View Visitors Details:</b><br><br>
                <form action="DispVisitors.jsp">
                    From : <input type="text" id="fromdatev" name="fromdate">&nbsp;&nbsp;
                    To : <input type="text" id="todatev" name="todate">&nbsp;&nbsp;
                    <input type="submit" value="View">
                    
                </form>
                <br>
                <br>
                <b> Edit Visitor Details : </b> <br> <br>
                
                <form action="EditVisitors.jsp" method="post">
                    Enter Visitor ID: <input type="text" name="id">&nbsp;&nbsp;&nbsp;
                    <input type="submit" value="Edit">
                </form>
                
                <br><br><hr>
                 <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printvisitors')"  />
                
                <div id="printvisitors">
                <br><b> Visitor Details : &nbsp;<%=fmt.format(dt)%> </b><br><br>
                <table>
                    <tr>
                        <td style="width:150px"><b>ID</b></td>
                        <td style="width:150px"><b>Name</td>
                        <td style="width:150px"><b>Purpose</td>
                        <td style="width:150px"><b>Time</td>
                        <td style="width:150px"><b>Enquiry Message</td>
                        <td style="width:150px"><b>Handled By</td>
                         <td style="width:150px"><b>Remarks</td>
                        <td style="width:150px"><b>Status</td>
                       
                    </tr>
                    <%
                    query="select ID,Name,Purpose,Time,EnquiryMsg,HandledBy,Remarks,Status from visitors where Date='"+df.format(dat)+"' order by Time desc";
                    System.out.println(query);
                    //Statement st=DBConnector.getStatement();
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
                        <td><%=rs.getString(8)%></td>
                    </tr>    
                 <%}%>
                </table>  
                </div>
            </div>     
             
            <div id="view3">
                <form action="AddCouriers" method="post">
                    <table>
                    <tr>
                        <td><b>From</td>
                        <td><b>For</td>
                        <td><b>Type</td>
                        <td><b>Urgency</td>
                        <td><b>Courier no.</td>
                        <td><b>Bill no.</td>
                        <td><b>Remarks</td>
                        <td><b>Response</td>
                        <td><b>Status</b></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="from" required style="width: 125px"></td>
                        <td><select name="for" style="width: 125px">
                                    <option value="Accounts">Accounts</option>
                                    <option value="Marketing">Marketing</option>
                                    <option value="Service">Service</option>
                                    <option value="Stores">Stores</option>
                                    <option value="Director">Director</option>   
                            </select></td>
                                    <td><select name="type" style="width: 125px">
                                            <option value="Courier">Courier</option>
                                            <option value="Letter">Letter</option>
                                            <option value="Bill">Bill</option>
                                </select>
                                        
                        </td>
                                <td><select name="urgency" style="width: 125px">
                                        <option value="Low">Low</option>
                                        <option value="Normal">Normal</option>
                                        <option value="Critical">Critical</option>
                            </select></td>
                        <td><input type="text" name="courierno" style="width: 125px"></td>
                        <td><input type="text" name="billno" style="width: 125px"></td>
                        <td><input type="text" name="response" style="width: 125px"></td>
                        <td><input type="text" name="remarks" style="width: 125px"></td>
                        <td>
                            <select name="status" style="width: 125px">
                               <option value="Pending">Pending</option>
                               <option value="Proceeded">Proceeded</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <br><input type="submit" value="Submit" style="margin-left: 47%">
                </form>
                <hr/>
                <br><b>View Couriers Details:</b><br><br>
                 <form action="DispCouriers.jsp">
                    From : <input type="text" id="fromdatec" name="fromdate">&nbsp;&nbsp;
                    To : <input type="text" id="todatec" name="todate">&nbsp;&nbsp;
                    <input type="submit" value="View">
                    
                </form>
                <br>
                <br>
                <b>Edit Courier Details :</b> <br><br>
                 
                <form action="EditCouriers.jsp" method="post">
                    
                    Enter ID: <input type="text" name="id">&nbsp;&nbsp;&nbsp;
                    
                    <input type="submit" value="Edit">
                </form>
                
                <br><br><hr> <br>
                <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printcouriers')"  />
                
                <div id="printcouriers">
                <br><b>Courier Details :&nbsp;&nbsp;<%=fmt.format(dt)%></b><br><br>
                <table>
                    <tr>
                        <td style="width:100px"><b>ID</b></td>
                        <td style="width:100px"><b>From</b></td>
                        <td style="width:100px"><b>For</td>
                        <td style="width:100px"><b>Time</td>
                        <td style="width:100px"><b>Urgency</td>
                        <td style="width:100px"><b>Type</td>
                        <td style="width:100px"><b>Courier No.</td>
                        <td style="width:100px"><b>Bill No.</td>
                        <td style="width:100px"><b>Remarks</td>
                        <td style="width:100px"><b>Response</td>
                        <td style="width:100px"><b>Status</td>
                      
                    </tr>
                    <%
                    query="select * from couriers where Date='"+df.format(dat)+"' order by Time desc";
                    System.out.println(query);
                    try{
                    rs=st.executeQuery(query);
                    while(rs.next()){ %>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(8)%></td>
                        <td><%=rs.getString(9)%></td>
                        <td><%=rs.getString(10)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><%=rs.getString(11)%></td>
                        <td><%=rs.getString(12)%></td>
                       
                        
                    </tr>
                        
                 <%}
                    }catch(SQLException e){
                        e.printStackTrace();
                    }
                 %>
                </table>
                </div>
            </div>    
            
            <div id="view4">
                <form action="AddMaterials" method="post">
                <table>
                    <tr>
                        <td><b>Product Name</td>
                        <td><b>From</td>
                        <td><b>For</td>
                        <td><b>Quantity</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="name" required style="width:150px"></td>
                        <td><input type="text" name="from" required style="width:150px"></td>
                        <td><select name="for" style="width:150px">
                                <option value="Accounts">Accounts</option>
                                <option value="Marketing">Marketing</option>
                                <option value="Service">Service</option>
                                <option value="Stores">Stores</option>
                                <option value="Director">Director</option>
                            </select>
                        </td>
                        <td><input type="number" name="quantity"  required pattern="^[0-9]$" min="1" style="width:150px"></td>
                      </tr>
                </table>
                <br><input type="submit" value="Submit" style="margin-left: 25%">
                </form>
                <hr/>
               <br><b>View Material Details:</b><br><br>
                 <form action="DispMaterials.jsp">
                    From : <input type="text" id="fromdatem" name="fromdate">&nbsp;&nbsp;
                    To : <input type="text" id="todatem" name="todate">&nbsp;&nbsp;
                    <input type="submit" value="View">
                    
                </form>
                <br>
                <br>
                <b>Edit Material Details :</b> <br><br>
                 
                <form action="EditMaterials.jsp" method="post">
                    
                    Enter ID: <input type="text" name="id">&nbsp;&nbsp;&nbsp;
                    
                    <input type="submit" value="Edit">
                </form>
                
                <br><br><hr> <br>
                <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printmaterials')"  />
                
                <div id="printmaterials">
                <br><b>Material Details :&nbsp;&nbsp;<%=fmt.format(dt)%></b><br><br>
                <table>
                    <tr>
                        <td style="width:100px"><b>ID</td>
                        <td style="width:100px"><b>Product Name</td>
                        <td style="width:100px"><b>From</td>
                        <td style="width:100px"><b>For</td>
                        <td style="width:100px"><b>Quantity</td>
                        <td style="width:100px"><b>Time</td>
                        
                    </tr>
                    <%
                    query="select * from materials where Date='"+df.format(dt)+"' order by Time desc";
                    System.out.println(query);
                    rs=st.executeQuery(query);
                    try{
                    while(rs.next()){ %>
                    <tr>
                        <td><%=rs.getString(1)%></td> 
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td> 
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(5)%></td>
                       
                    </tr>    
                 <%}
                    }catch(SQLException e){
                        e.printStackTrace();
                    }
                 %>
                </table> 
                </div>
            </div>
                
           <div id="view5">
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
    $("#fromdatev").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(dat)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#todatev").datepicker("option", "minDate", dt);
        }
    });
    $("#todatev").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(dat)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#fromdatev").datepicker("option", "maxDate", dt);
        }
    });
    $("#fromdatec").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(dat)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#todatec").datepicker("option", "minDate", dt);
        }
    });
    $("#todatec").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(dat)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#fromdatev").datepicker("option", "maxDate", dt);
        }
    });
     $("#fromdatem").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(dat)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#todatem").datepicker("option", "minDate", dt);
        }
    });
    $("#todatem").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(dat)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#fromdatem").datepicker("option", "maxDate", dt);
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
