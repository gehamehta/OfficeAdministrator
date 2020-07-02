<%-- 
    Document   : Admin
    Created on : 24-Jun-2015, 22:25:11
    Author     : Ayushi
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="OfficeAdministrator.CreatePieChart"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="OfficeAdministrator.DBConnector"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/tabcontent.css" rel='stylesheet' type='text/css' />
        <link rel="shortcut icon" href="images/oa.png" type="image/png">
        <script src="css/tabcontent.js" type="text/javascript"></script>
        <title>Admin</title>
        <!-- Date Picker jQuery -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet"type="text/css"/>
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
       Date date=new Date(System.currentTimeMillis());
       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
       SimpleDateFormat fmt = new SimpleDateFormat("MMMM dd, yyyy");
    %>
    
    <h1 style=" text-align:center; font-size: 110%; font-family:sans serif;"><img src="images/oa.png"></h1><hr>
        <div  style="text-align: left; font-size: 20px; float: left; width: 50%; font-family: serif;"><b>Welcome <%=name%></b></div>
        <div  style="text-align: right; font-size: 20px; float: right; width: 50%; font-family: serif;">
            <a href="MyProfile.jsp"><img src="images/myprofile.jpg" alt="My Profile"></a>
            &nbsp;&nbsp;&nbsp;
            <a href="Register.jsp"><img src="images/register.jpg" alt="Register"></a>
            &nbsp;&nbsp;
            <a  href="Login"><img src="images/logout.jpg" alt="Logout"></a></div>
        <br><br>
        <h1 style=" text-align:center;font-family:sans serif;">Admin</h1><hr/>
        <p style="text-align: right"></p>

         <div style="width: 100%; margin: 0 auto ; padding: 30px 0 40px;">
        <ul class="tabs" data-persist="true">
            <!--<li><a href="#view1">Summary</a></li> -->
            <li><a href="#view2">Accounts Details</a></li>
            <li><a href="#view3">Front Office Details</a></li>
            <li><a href="#view4">Marketing Details</a></li>
            <li><a href="#view5">Service Details</a></li>
            <li><a href="#view6">Stores Details</a></li>
            <li><a href="#view7">Task Sheet</a></li>
            <li><a href="#view8">Employee Details</a></li>
            <li><a href="#view9">Day At Glance</a></li>
        </ul>
        <div class="tabcontents">
             <div id="view2">
                <div style="width: 95%; margin: 0 auto ; padding: 30px 0 40px;">
                <ul class="tabs" data-persist="true">
                     <li><a href="#view21">Purchase</a></li>
                     <li><a href="#view22">Sales</a></li>
                     <li><a href="#view23">Payments</a></li>
                </ul>
        <div class="tabcontents">
            <div id="view21">
                 <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printpurchase')"  />
                <div id="printpurchase">
                <br><b>Purchase Details:</b><br><br>
                <table>
                    <tr>
                        <td style="width:150px"><b>Date</b></td>
                        <td style="width:150px"><b>Time</b></td>
                        <td style="width:150px"><b>Bill No.</b></td>
                        <td style="width:150px"><b>Product Name</td>
                        <td style="width:150px"><b>Quantity</td>    
                        <td style="width:150px"><b>Amount</td>
                        <td style="width:150px"><b>Payment Mode</td>
                        <td style="width:150px"><b>Payment Status</td>
                    </tr>
                    <%
                    query="select DATE_FORMAT(Date,'%b %d') as Date,Time,BillNo,Name,Quantity,Amount,PaymentMode,PaymentStatus from itemspurchased order by date desc,time desc";
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
                        <td><%=rs.getString(8)%></td>   
                    </tr>    
                 <%}%>
                </table>      
                </div>
            </div>
                 <div id="view22">
                     <!--<input type="button" value="Print" onclick="javascript:printDiv('printsales')" style="margin-left: 90%"/>-->
                     <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printsales')"  />

        <div id="printsales">
                <br><b>Sales Details:</b><br><br>
                <table>
                    <tr>
                        <td style="width:150px"><b>Date</b></td>
                        <td style="width:150px"><b>Time</b></td>
                        <td style="width:150px"><b>Bill No.</b></td>
                        <td style="width:150px"><b>Product Name</td>
                        <td style="width:150px"><b>Quantity</td>    
                        <td style="width:150px"><b>Amount</td>
                        <td style="width:150px"><b>Payment Mode</td>
                        <td style="width:150px"><b>Payment Status</td>
                    </tr>
                    <%
                    query="select DATE_FORMAT(Date,'%b %d') as Date,Time,BillNo,Name,Quantity,Time,Amount,PaymentMode,PaymentStatus from itemssold order by date desc,time desc";
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
                        <td><%=rs.getString(8)%></td>    
                    </tr>    
                 <%}%>
                </table>      
                     </div>
            </div>
            
             <div id="view23">
                  <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printpayment')"  />
        <div id="printpayment">
               <br><b>Payment Details:</b><br><br>
                <table>
                    <tr>
                        <td style="width:180px"><b>Date</b></td>
                        <td style="width:180px"><b>Time</b></td>
                        <td style="width:180px"><b>Bill No.</b></td>
                        <td style="width:180px"><b>Payment For</td>
                        <td style="width:180px"><b>Amount</td>
                        <td style="width:180px"><b>Payment Mode</td>
                        <td style="width:180px"><b>Payment Status</td>
                    </tr>
                    <%
                    query="select DATE_FORMAT(Date,'%b %d') as Date,Time,BillNo,PaymentFor,Amount,PaymentMode,PaymentStatus from payments order by Date desc,time desc";
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
        </div>
                 </div>
        </div>
                 <div id="view3">
       <div style="width: 100%; margin: 0 auto ; padding: 30px 0 40px;">
        <ul class="tabs" data-persist="true">
            <li><a href="#view31">Calls</a></li>
            <li><a href="#view32">Visitors</a></li>
            <li><a href="#view33">Couriers/Letters/Bills</a></li>
            <li><a href="#view34">Materials</a></li>
        </ul>
        <div class="tabcontents">
            <div id="view31">
                 <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printcalls')"  />
        <div id="printcalls">
                <br><b>Call Details:</b> <br><br>
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
                    <% 
                   query="select CallID,CallerName,ReceiverName,Number,Time,DATE_FORMAT(Date,'%b %d') as Date,Message,Remarks,CallType,"+
                           "TransferredTo,CallStatus from calls order by date desc,time desc " ;
                    System.out.println(query);
                    rs=st.executeQuery(query);
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
            
             <div id="view32">
                  <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printvisitors')"  />
        <div id="printvisitors">
                <br><b>Visitors Details:</b><br><br>
                <table>
                    <tr>
                        <td style="width:150px"><b>Date</td>
                        <td style="width:150px"><b>Time</td>
                        <td style="width:150px"><b>ID</b></td>
                        <td style="width:150px"><b>Name</td>
                        <td style="width:150px"><b>Purpose</td>    
                        <td style="width:150px"><b>Enquiry Message</td>
                        <td style="width:150px"><b>Handled By</td>
                        <td style="width:150px"><b>Status</td>   
                    </tr>
                    <%
                    query="select DATE_FORMAT(Date,'%b %d') as Date,Time,ID,Name,Purpose,EnquiryMsg,HandledBy,Status from visitors order by date desc,time desc";
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
                        <td><%=rs.getString(8)%></td>    
                    </tr>    
                 <%}%>
                </table>  
                    </div>
            </div>
                <div id="view33">
                     <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printcouriers')"  />
        <div id="printcouriers">
                <br><b>Couriers Details:</b><br><br>
                <table>
                    <tr>
                        <td style="width:100px"><b>Date</td>
                        <td style="width:100px"><b>Time</td>
                        <td style="width:100px"><b>ID</b></td>
                        <td style="width:100px"><b>From</b></td>
                        <td style="width:100px"><b>For</td>    
                        <td style="width:100px"><b>Urgency</td>
                        <td style="width:100px"><b>Type</td>
                        <td style="width:100px"><b>Courier No.</td>
                        <td style="width:100px"><b>Bill No.</td>
                        <td style="width:100px"><b>Remarks</td>
                        <td style="width:100px"><b>Response</td>
                        <td style="width:100px"><b>Status</td>  
                    </tr>
                    <%
                    query="select DATE_FORMAT(Date,'%b %d') as Date,Time,CourierFrom,ForDept,Urgency,Type,CourierNo,BillNo,Remarks,Response,Status from couriers order by date desc,time desc";
                    System.out.println(query);
                    try{
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
                        <td><%=rs.getString(9)%></td>
                        <td><%=rs.getString(10)%></td>
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
                <div id="view34">
                    <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printmaterials')"  />
        <div id="printmaterials">
                <br><b>Materials Details:</b><br><br>
                <table>
                    <tr>
                        <td style="width:100px"><b>Date</td>
                        <td style="width:100px"><b>Time</td>
                        <td style="width:100px"><b>ID</td>
                        <td style="width:100px"><b>Product Name</td>
                        <td style="width:100px"><b>From</td>
                        <td style="width:100px"><b>For</td>
                        <td style="width:100px"><b>Quantity</td>
                    </tr>
                    <%
                    query="select DATE_FORMAT(Date,'%b %d') as Date,Time,ID,ProductName,ProductFrom,ForDept,Quantity from materials order by date desc,time desc";
                    System.out.println(query);
                    rs=st.executeQuery(query);
                    try{
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
                 <%}
                    }catch(SQLException e){
                        e.printStackTrace();
                    }
                 %>
                </table> 
                    </div>
            </div>
        </div>
    </div>
            
            
        </div>
                <div id="view4">
                    <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printenquiry')"  />
        <div id="printenquiry">
                <br><b>Enquiry Details:</b><br><br>
                <table>
                    <tr>
                        <td style="width:150px"><b>Date</b></td>
                        <td style="width:150px"><b>Enquiry Time</td>
                        <td style="width:150px"><b>ID</b></td>
                        <td style="width:150px"><b>From</td>
                        <td style="width:150px"><b>Enquiry Mode</td>
                        <td style="width:150px"><b>Enquiry Message</td>
                        <td style="width:150px"><b>Response</td>
                        <td style="width:150px"><b>Quotation</td>
                        <td style="width:150px"><b>Response Time</td>
                        <td style="width:150px"><b>Status</td>
                        <td style="width:150px"><b>Follow Up</td>
                    </tr>
                    <%
                    query="select DATE_FORMAT(Date,'%b %d') as Date,EnquiryTime,ID,EnquiryFrom,EnquiryMode,EnquiryMsg,Response,Quotation,ResponseTime,Status,FollowUp from marketing order by Date desc,EnquiryTime desc";
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
                        <td><%=rs.getString(9)%></td>
                        <td><%=rs.getString(10)%></td>
                        <td><%=rs.getString(11)%></td>
                    </tr>    
                 <%}%>
                </table>  
                    </div>
            </div>
                <div id="view5">
                     <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printservice')"  />
        <div id="printservice">
                <br><b>Service Details:</b><br><br>
                <table>
                    <tr>
                        <td style="width:150px"><b>Date</b></td>
                        <td style="width:150px"><b>Request Time</td>
                        <td style="width:150px"><b>ID</b></td>
                        <td style="width:150px"><b>From</td>
                        <td style="width:150px"><b>Service Type</td>
                        <td style="width:150px"><b>Request Mode</td>
                        <td style="width:150px"><b>Issue</td>
                        <td style="width:150px"><b>Response</td>
                        <td style="width:150px"><b>Response Time</td>
                        <td style="width:150px"><b>Remarks</td>
                        <td style="width:150px"><b>Status</td>
                    </tr>
                    <%
                     query="select DATE_FORMAT(Date,'%b %d') as Date,RequestTime,ID,ServiceFrom,ServiceType,RequestMode,Issue,Response,ResponseTime,Remarks,Status from services order by date desc,RequestTime desc";
                System.out.println(query);
                rs=st.executeQuery(query);
                while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(7)%></td>
                    <td><%=rs.getString(8)%></td>
                    <td><%=rs.getString(9)%></td>
                    <td><%=rs.getString(10)%></td>
                    <td><%=rs.getString(11)%></td>
                </tr>
                <%}%>
                        
                </table>
                    </div>
                </div>
                <div id="view6">
             <div style="width: 80%; margin: 0 auto ; padding: 30px 0 40px;">
                     <ul class="tabs" data-persist="true">
                        <li><a href="#view61">Category Wise</a></li>
                        <li><a href="#view62">Product Wise</a></li>
                    </ul>
            <div class="tabcontents">
            <div id="view61">
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
                 <div id="view62">
                      <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printproduct')"  />
        <div id="printproduct">
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
                     <div id="view7">
              <form  action="AddTask" method="post">
                <input type="hidden" name="id" value="<%=id%>">
                <table>
                    <tr>
                        <td style="width:100px"><b>Task</td>
                        <td style="width:100px"><b>Category</td>
                        <td style="width:100px"><b>Company Name</td>
                        <td style="width:100px"><b>Priority</td>
                        <td style="width:100px"><b>Schedule Time</td>
                        <td style="width:100px"><b>Remarks</td>
                        <td style="width:100px"><b>Status</td>
                        <td style="width:100px"><b>Follow Up</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="task"></td>
                         <td>
                            <select name="category" style="width:100px">
                                <option value="Marketing">Marketing</option>
                                <option value="Service">Service</option>
                                <option value="Personal">Personal</option>
                                <option value="Admin">Admin</option>
                            </select>
                        </td>
                         <td><input type="text" name="companyname"></td>
                          <td>
                            <select name="priority" style="width:100px">
                                <option value="High">High</option>
                                <option value="Medium">Medium</option>
                                <option value="Low">Low</option>
                            </select>
                        </td>
                          <td><input type="text" name="scheduletime" placeholder="hh:mm:ss"></td>
                        <td><input type="text" name="remarks"></td>
                        <td>
                            <select name="status" style="width:100px">
                                <option value="Incomplete">Incomplete</option>
                                <option value="In Progress">In Progress</option>
                                <option value="Completed">Completed</option>
                            </select>
                        </td>
                         <td><input type="text" name="followup"></td>
                     </tr>
              </table>
                <p style="text-align: center"><input type="submit" value="Add"></p>
              </form><hr>
                <br><b>View Task Details:</b><br><br>
                 <form action="DispTasks.jsp">
                    <input type="hidden" name="id" value="<%=id%>">
                    From : <input type="text" id="fromdate" name="fromdate">&nbsp;&nbsp;
                    To : <input type="text" id="todate" name="todate">&nbsp;&nbsp;
                    <input type="submit" value="View"> 
                </form>
                <br>
                <br>
                    <br>
                 <b>Edit Task Details :</b> <br><br>
                <form action="EditTasks.jsp">  
                    <input type="hidden" name="empid" value="<%=id%>">
                    Enter ID: <input type="text" name="id">&nbsp;&nbsp;&nbsp;   
                    <input type="submit" value="Edit">
                </form><br>
                
                <hr/>
                 <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printtask')"  />
                <div id="printtask">
                <br><b>Task Details:&nbsp;&nbsp;<%=fmt.format(date)%></b> <br><br>
                <table>
                    <tr>
                        <td style="width:100px"><b>ID</td>
                        <td style="width:100px"><b>Date</td>
                        <td style="width:100px"><b>Time</td>
                        <td style="width:100px"><b>Task</td>
                        <td style="width:100px"><b>Category</td>
                        <td style="width:100px"><b>Company Name</td>
                        <td style="width:100px"><b>Priority</td>
                        <td style="width:100px"><b>Schedule Time</td>
                        <td style="width:100px"><b>Remarks</td>
                        <td style="width:100px"><b>Status</td>
                        <td style="width:100px"><b>Follow Up</td>
                    </tr>
                     <%
                    query="select DATE_FORMAT(Date,'%b %d') as Date,Time,ID,Task,Category,CompanyName,Priority,ScheduleTime,Remarks,"+
                           "Status,FollowUp from tasksheet where UserId='"+id+"' and Date='"+sdf.format(date)+"' order by "+
                            "Priority='High' desc, Priority='Medium' desc, Priority='Low' desc, Status='Incomplete' desc, "+
                            "Status='In Progress' desc, Status='Completed' desc, Time desc" ;
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
                        <td><%=rs.getString(9)%></td>
                        <td><%=rs.getString(10)%></td>
                        <td><%=rs.getString(11)%></td>
                   </tr>
                 <% } %>
                </table></div>
             </div>
                 <div id="view8">
                      <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printemp')"  />
        <div id="printemp">
                    <br>
                    <b> Employee Details :</b>
                    <br><br>
                    <table style="width: 100%">
                    <tr>
                        <td style="width:70px"><b>EmpID</td>
                        <td style="width:70px"><b>Full Name</td>
                        <td style="width:70px"><b>Gender</td>
                        <td style="width:70px"><b>Date Of Birth</td>
                        <td style="width:70px"><b>Marital Status</td>
                        <td style="width:70px"><b>Anniversary Date</td>
                        <td style="width:70px"><b>Phone No.</td>
                        <td style="width:70px"><b>Email Id</td>
                        <td style="width:70px"><b>Address</td>
                        <td style="width:70px"><b>City</td>
                        <td style="width:70px"><b>State</td>
                        <td style="width:70px"><b>Pin Code</td>
                        <td style="width:70px"><b>Country</td>
                        <td style="width:70px"><b>Bank Name</td>
                        <td style="width:70px"><b>Bank Account Number</td>
                        <td style="width:70px"><b>Department</td>
                        <td style="width:70px"><b>User Type</td>
                        <td style="width:70px"><b>Joining Date</td>
                        <td style="width:70px"><b>Aadhar Card No.</td>
                        <td style="width:70px"><b>PAN Card No. </td>
                        <td style="width:70px"><b>Other Details</td>
                    </tr>
                     <%
                    query="select EmpID,FullName,Gender,DATE_FORMAT(DateOfBirth,'%b %d, %Y') as DateOfBirth,MaritalStatus,DATE_FORMAT(AnniversaryDate,'%b %d, %Y') as AnniversaryDate,MobileNo,EmailID,Address,City,State,PinCode,Country,BankName,BankAccNo,Department,UserType,JoiningDate,AadharCardNo,PANCardNo,OtherDetails from employee order by EmpID asc";
                     rs=st.executeQuery(query);
                    while(rs.next()){
                     %>
                    <tr>
                        <td style="width:70px"><%=rs.getString(1)%></td>
                        <td style="width:70px"><%=rs.getString(2)%></td>
                        <td style="width:70px"><%=rs.getString(3)%></td>
                        <td style="width:70px"><%=rs.getString(4)%></td>
                        <td style="width:70px"><%=rs.getString(5)%></td>
                        <td style="width:70px"><%=rs.getString(6)%></td>
                        <td style="width:70px"><%=rs.getString(7)%></td>
                        <td style="width:70px"><%=rs.getString(8)%></td>
                        <td style="width:70px"><%=rs.getString(9)%></td>
                        <td style="width:70px"><%=rs.getString(10)%></td>
                        <td style="width:70px"><%=rs.getString(11)%></td>
                        <td style="width:70px"><%=rs.getString(12)%></td>
                        <td style="width:70px"><%=rs.getString(13)%></td>
                        <td style="width:70px"><%=rs.getString(14)%></td>
                        <td style="width:70px"><%=rs.getString(15)%></td>
                        <td style="width:70px"><%=rs.getString(16)%></td>
                        <td style="width:70px"><%=rs.getString(17)%></td>
                        <td style="width:70px"><%=rs.getString(18)%></td>
                        <td style="width:70px"><%=rs.getString(19)%></td>
                        <td style="width:70px"><%=rs.getString(20)%></td>
                        <td style="width:70px"><%=rs.getString(21)%></td>     
                    </tr>
                    <%}%>
                     </table>  
                        </div>
                </div>
                 <div id="view9" style="height: auto">
                     
                 <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printday')"  />
                 <div id="printday">     
                     <br><b>Call Details:&nbsp;<%=fmt.format(date)%> </b> <br><br>
                <table>
                    <tr>
                        <td style="width:100px"><b>Caller Name</td>
                        <td style="width:100px"><b>Receiver Name</td>
                        <td style="width:100px"><b>Contact Number</td>
                        <td style="width:100px"><b>Time</td>
                        <td style="width:100px"><b>Message</td>
                        <td style="width:100px"><b>Call Type</td>
                        <td style="width:100px"><b>Transferred To</td>
                        <td style="width:100px"><b>Call Status</td> 
                    </tr>
                    &nbsp;&nbsp;
                    <%
                   query="select CallerName,ReceiverName,Number,Time,Message,CallType,"+
                           "TransferredTo,CallStatus from calls where Date='"+sdf.format(date)+"' order by time desc " ;
                    System.out.println(query);
                    st=DBConnector.getStatement();
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
                        
                 <% }
                %>
                </table>    
                <br>
                <br><b>Accounts Details:&nbsp;&nbsp;<%=fmt.format(date)%></b>
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
                    <tr>
                        <td colspan="7">Purchase </td>
                    </tr>
                    <%
                    query="select BillNo,Name,Quantity,Time,Amount,PaymentMode,PaymentStatus from itemspurchased "+
                            "where Date='"+sdf.format(date)+"' order by Time desc" ;
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
                 <tr>
                        <td colspan="7">Sales </td>
                </tr>
                 <%
                    query="select BillNo,Name,Quantity,Time,Amount,PaymentMode,PaymentStatus from itemssold"+
                            " where Date='"+sdf.format(date)+"' order by Time desc";
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
              
                <br><br><b>Stock Details:</b><br><br>
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

                    <br><br><b>Service Details:&nbsp;&nbsp;<%=fmt.format(date)%></b><br><br>
                <table>
                    <tr>
                        <td style="width:150px"><b>Customer Name</td>
                        <td style="width:150px"><b>Service Type</td>
                        <td style="width:150px"><b>Request Mode</td>
                        <td style="width:150px"><b>Issue</td>
                        <td style="width:150px"><b>Request Time</td>
                        <td style="width:150px"><b>Response</td>
                        <td style="width:150px"><b>Response Time</td>
                        <td style="width:150px"><b>Remarks</td>
                        <td style="width:150px"><b>Status</td>
                    </tr>
                    <%
                    query="select ServiceFrom,ServiceType,RequestMode,Issue,RequestTime,Response,ResponseTime,Remarks,Status from services where Date='"+sdf.format(date)+"' order by RequestTime desc";
                    System.out.println(query);
                    rs=st.executeQuery(query);
                    while(rs.next()){ %>
                    <tr><td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td>
                        <td><%=rs.getString(8)%></td>
                        <td><%=rs.getString(9)%></td>
                        
                        
                    </tr>   
                 <%}%>
                </table> 
                 </div>
              </div>
                
                
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
        maxDate: <%=sdf.format(date)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#todate").datepicker("option", "minDate", dt);
        }
    });
    $("#todate").datepicker({
        numberOfMonths: 1,
        maxDate: <%=sdf.format(date)%>,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate());
            $("#fromdate").datepicker("option", "maxDate", dt);
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
