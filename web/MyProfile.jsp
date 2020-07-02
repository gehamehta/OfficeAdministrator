<%-- 
    Document   : MyProfile
    Created on : 20-Jun-2015, 12:27:43
    Author     : Ayushi
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="OfficeAdministrator.Encrypt"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="OfficeAdministrator.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/oa.png" type="image/png">
        <title>My Profile</title>
    </head>
    <body>
        <%
            String id=(String)(session.getAttribute("id"));
            System.out.println(id);
            String Name="",Password="",DOB="",Gender="",MaritalStatus="",AnniversaryDate="",MobileNo="",EmailId="",
                    BankName="",BankAccNo="",Address="",City="",State="",Country="",PinCode="",Department="",UserType="",JoiningDate="",
                    AadharCardNo="",PANCardNo="",OtherDetails="";
            
            String query="select * from employee where EmpID='"+id+"'";
            System.out.println(query);
            Statement st=DBConnector.getStatement();
            ResultSet rs=st.executeQuery(query);
            if(rs.next()){
                Name=rs.getString(1);
                Password=Encrypt.DecryptText(rs.getString(3));
                DOB=rs.getString(4);
                Gender=rs.getString(5);
                MaritalStatus=rs.getString(6);
                System.out.println(rs.getString(7));
                AnniversaryDate=rs.getString(7);
                MobileNo=rs.getString(8);
                EmailId=rs.getString(9);
                BankName=rs.getString(10);
                BankAccNo=rs.getString(11);
                Address=rs.getString(12);
                City=rs.getString(13);
                State=rs.getString(14);
                Country=rs.getString(16);
                PinCode=rs.getString(15);
                Department=rs.getString(17);
                UserType=rs.getString(18);
                JoiningDate=rs.getString(19);
                AadharCardNo=rs.getString(20);
                PANCardNo=rs.getString(21);
                OtherDetails=rs.getString(22);
            }
            session.setAttribute("id",id);
            //SimpleDateFormat fmt = new SimpleDateFormat("MMMM dd, yyyy");
            %>
            Your Details are:<br><br>
            <form action="UpdateProfile.jsp">
            <div style="float: left; width: 50%">
            <table>
                <tr>
                    <td>Employee ID:</td>
                    <td><%=id%></td>
                </tr>
                <tr>
                    <td>Full Name:</td>
                    <td><%=Name%></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><%=Gender%></td>
                </tr>
                 <tr>
                    <td>Marital Status:</td>
                    <td><%=MaritalStatus%></td>
                </tr>
                <tr>
                    <td>Mobile No.:</td>
                    <td><%=MobileNo%></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><%=Address%></td>
                </tr>
                <tr>
                    <td>PIN Code:</td>
                    <td><%=PinCode%></td>
                </tr>
                <tr>
                    <td>Country:</td>
                    <td><%=Country%><td>
                </tr>
                <tr>
                    <td>Bank Account No.:</td>
                    <td><%=BankAccNo%></td>
                </tr>
                <tr>
                    <td>Aadhar Card No.:</td>
                    <td><%=AadharCardNo%></td>
                </tr>
                <tr>
                    <td>Other Details:</td>
                    <td><%=OtherDetails%></td>
                </tr>
                <tr>
                    <td>Department :</td>
                    <td><%=Department%></td>
                </tr>
            </table> 
        </div>
        
        <div style="float: right; width: 50%;">
            <table>
                <tr>
                    <td>Password:</td>
                    <td><%=Password%></td>
                </tr>
                <tr>
                    <td>Date of Birth:</td>
                    <td><%=DOB%></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Anniversary Date:</td>
                    <td><%=AnniversaryDate%></td>
                </tr>
                <tr>
                    <td>Email ID:</td>
                    <td><%=EmailId%></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td><%=City%></td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td><%=State%></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Bank Name:</td>
                    <td><%=BankName%></td>
                </tr>
                <tr>
                    <td>PAN Card No.:</td>
                    <td><%=PANCardNo%></td>
                </tr>
                
                <tr>
                    <td>Joining Date</td>
                    <td><%=JoiningDate%></td>
                </tr>
                <tr><td> User Type :</td>
                    <td><%=UserType%></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
<input type="submit" value="Edit Details" style="margin-left: 45%">
             
    </form>
    </body>
</html>
