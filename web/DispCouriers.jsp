<%-- 
    Document   : DispCouriers
    Created on : 23-Jun-2015, 10:48:28
    Author     : Ayushi
--%>

<%@page import="java.text.ParseException"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="OfficeAdministrator.DBConnector"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/tabcontent.css" rel='stylesheet' type='text/css' />
        <link rel="shortcut icon" href="images/oa.png" type="image/png">
        <script src="css/tabcontent.js" type="text/javascript"></script>
        <title>Couriers Details</title>
    </head>
    <body>
        
        <%
            String from=request.getParameter("fromdate");
            String to=request.getParameter("todate");
            DateFormat userDateFormat = new SimpleDateFormat("MM/dd/yyyy");
            DateFormat dateFormatNeeded = new SimpleDateFormat("yyyy-MM-dd");
            DateFormat df = new SimpleDateFormat("MMMM dd, yyyy");
            Date frm = userDateFormat.parse(from);
            Date t = userDateFormat.parse(to);
            String fromDate = dateFormatNeeded.format(frm);
            String toDate = dateFormatNeeded.format(t);
        %>
        <input type="image" src="images/print.jpg" alt="Print" style="margin-left: 95%"
                            onclick="javascript:printDiv('printcouriers')"  />
        <div id="printcouriers">
        <br><b>Couriers Details:&nbsp; &nbsp; &nbsp;<%=df.format(frm)%> to <%=df.format(t)%><br><br></b>
        
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
            <% while(fromDate.compareTo(toDate)<=0){
                    %>&nbsp;&nbsp;
                    <%
                  String query="select DATE_FORMAT(Date,'%b %d') as Date,Time,ID,CourierFrom,ForDept,Urgency,Type,CourierNo,BillNo,Remarks,Response,Status from couriers where Date= '"+fromDate+"' order by Date asc, Time asc";
                    System.out.println(query);
                    Statement st=DBConnector.getStatement();
                    ResultSet rs=st.executeQuery(query);
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
                 <% }
                    fromDate=incDate(fromDate);
                   }
                %>
            </table>
        </div>
    </body>
    
<%! public String incDate(String d){
SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
Calendar c = Calendar.getInstance(); 
try { c.setTime(df.parse(d));
 
c.add(Calendar.DAY_OF_MONTH, 1); // number of days to add 
String dt = df.format(c.getTime());
System.out.println("final date now : " + dt);
Date date= df.parse(dt);
String date1=df.format(date);
System.out.println("New date:"+date1);
return date1;
}catch (ParseException e) 
{ // TODO Auto-generated catch block e.printStackTrace();
 } 
return null;
}
%>
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

