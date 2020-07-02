<%-- 
    Document   : UpdateProfile
    Created on : 20-Jun-2015, 12:27:57
    Author     : Ayushi
--%>

<%@page import="OfficeAdministrator.Encrypt"%>
<%@page import="OfficeAdministrator.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/oa.png" type="image/png">
        <title>Update Profile</title>
        <style>
            table tr,td{
                width: 170px;
                height: 40px;
            }
        </style>
         <script type="text/javascript">
        function show() { document.getElementById('adate').style.display = 'block';
                          document.getElementById('td').style.display = 'block';}
        function hide() { document.getElementById('adate').style.display = 'none';
                          document.getElementById('td').style.display = 'none';}
      </script>
    </head>
    <body>
        <%
            String id=(String)(session.getAttribute("id"));
            System.out.println(id);
            String Name="",Password="",DOB="",MobileNo="",MaritalStatus="",AnniversaryDate="",EmailId="",Address="",City="",State="",Country="",PinCode="",Gender="",JoiningDate="",UserType="",Department="",BankAccNo="",BankName="",AdharCardNo="",PANCardNo="",OtherDetails="";
            String query="select * from employee where EmpID='"+id+"'";
            Statement st=DBConnector.getStatement();
            ResultSet rs=st.executeQuery(query);
            while(rs.next()){
                Name=rs.getString(1);
                Password=Encrypt.DecryptText(rs.getString(3));
                DOB=rs.getString(4);
                Gender=rs.getString(5);
                MaritalStatus=rs.getString(6);
                AnniversaryDate=rs.getString(7);
                MobileNo=rs.getString(8);
                EmailId=rs.getString(9);
                BankName=rs.getString(10);
                BankAccNo=rs.getString(11);
                Address=rs.getString(12);
                City=rs.getString(13);
                State=rs.getString(14);
                PinCode=rs.getString(15);
                Country=rs.getString(16);
                Department=rs.getString(17);
                UserType=rs.getString(18);
                JoiningDate=rs.getString(19);
                AdharCardNo=rs.getString(20);
                PANCardNo=rs.getString(21);
                OtherDetails=rs.getString(22);
            } 
            
            %>
            Edit Details:<br><br>
            <form action="Register" method="post">
                <input type="hidden" name="id" value="<%=id%>">
        <div style="float: left; width: 50%">
            <table>
               
                <tr>
                    <td>Full Name:</td>
                    <td><input type="text" name="name"  value="<%=Name%>" required></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><input type="radio" name="gender"  value="Male" >Male
                        <input type="radio" name="gender" value="Female">Female</td>
                </tr>
                 <tr>
                    <td>Marital Status:</td>
                    <td><input type="radio" name="mstatus" value="Married" onclick="show();">Married
                        <input type="radio" name="mstatus" value="Unmarried"  onclick="hide();">Unmarried</td>
                </tr>
                <tr>
                    <td>Mobile No.:</td>
                    <td><input type="tel" pattern="^\d{10}$" value="<%=MobileNo%>" size="10" placeholder="10-digits" name="mobileno"  required></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" value="<%=Address%>" required></td>
                </tr>
                <tr>
                    <td>PIN Code:</td>
                    <td><input type="text" name="pin" pattern="^\d{6}$" size="6" value="<%=PinCode%>" placeholder="6-digits" required></td>
                </tr>
                <tr>
                    <td>Country:</td>
                    <td><input type="text" name="country" value="<%=Country%>"  disabled><td>
                </tr>
                <tr>
                    <td>Bank Account No.:</td>
                    <td><input type="text" name="ban" value="<%=BankAccNo%>" required></td>
                </tr>
                <tr>
                    <td>Aadhar Card No.:</td>
                    <td><input type="text" name="acn" value="<%=AdharCardNo%>" pattern="^\d{12}$" size="12" placeholder="12-digits"></td>
                </tr>
                <tr>
                    <td>Other Details (optional):</td>
                    <td><textarea name="otherdetails" value="<%=OtherDetails%>"></textarea> </td>
                </tr>
                        <tr>
                            <td>
                    Department : 
                    </td>
                    <td><select name="Department" value="<%=Department%>">
                            <option value ="Accounts">Accounts</option>
                            <option value ="Director">Director</option>
                            <option value ="FrontOffice">Front Office</option>
                            <option value ="Marketing">Marketing</option>
                            <option value ="Service">Service</option>
                            <option value ="Stores">Stores</option>
                        </select>
                    </td>
                        </tr>
            </table> 
        </div>
        <div style="float: right; width: 50%;">
            <table>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" value="<%=Password%>" required></td>
                </tr>
                <tr>
                    <td>Date of Birth:</td>
                    <td><input type="date" name="dob" value="<%=DOB%>" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="td" style="display: none;">Anniversary Date:</td>
                    <td><input type="date" name="adate"  value="<%=AnniversaryDate%>" id="adate" style="display: none;"></td>
                </tr>
                <tr>
                    <td>Email ID:</td>
                    <td><input type="email"  value="<%=EmailId%>" name="emailid" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder="me@example.com" required></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td><input type="text" value="<%=City%>" name="city" required></td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td><select name="state" value="<%=State%>">
                            <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                            <option value="Andhra Pradesh">Andhra Pradesh</option>
                            <option value="Assam">Assam</option>
                            <option value="Bihar">Bihar</option>
                            <option value="Chandigarh">Chandigarh</option>
                            <option value="Chhattisgarh">Chhattisgarh</option>
                            <option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
                            <option value="Daman and Diu">Daman and Diu</option>
                            <option value="Goa">Goa</option>
                            <option value="Gujarat">Gujarat</option>
                            <option value="Haryana">Haryana</option>
                            <option value="Himachal Pradesh">Himachal Pradesh</option>
                            <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                            <option value="Jharkhand">Jharkhand</option>
                            <option value="Karnataka">Karnataka</option>
                            <option value="Kerala">Kerala</option>
                            <option value="Lakshadweep">Lakshadweep</option>
                            <option value="Madhya Pradesh">Madhya Pradesh</option>
                            <option value="Maharashtra">Maharashtra</option>
                            <option value="Manipur">Manipur</option>
                            <option value="Meghalaya">Meghalaya</option>
                            <option value="Mizoram">Mizoram</option>
                            <option value="Nagaland">Nagaland</option>
                            <option value="National Capital Territory of Delhi">National Capital Territory of Delhi</option>
                            <option value="Odisha (Orissa)">Odisha (Orissa)</option>
                            <option value="Punjab">Punjab</option>
                            <option value="Puducherry(Pondicherry)">Puducherry(Pondicherry)</option>
                            <option value="Rajasthan">Rajasthan</option>
                            <option value="Sikkim">Sikkim</option>
                            <option value="Tamil Nadu">Tamil Nadu</option>
                            <option value="Telangana">Telangana</option>
                            <option value="Tripura">Tripura</option>
                            <option value="Uttar Pradesh">Uttar Pradesh</option>
                            <option value="Uttarakhand">Uttarakhand</option>
                            <option value="West Bengal">West Bengal</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Bank Name:</td>
                    <td><select name="bname" value="<%=BankName%>">
                            <option value="Allahabad Bank">Allahabad Bank</option>
                            <option value="Andhra Bank">Andhra Bank</option>
                            <option value="Bank of Baroda">Bank of Baroda</option>
                            <option value="Bank of India">Bank of India</option>
                            <option value="Bank of Maharashtra">Bank of Maharashtra</option>
                            <option value="Bank of Punjab">Bank of Punjab</option>
                            <option value="Canara Bank">Canara Bank</option>
                            <option value="Central Bank of India">Central Bank of India</option>
                            <option value="Citibank">Citibank</option>
                            <option value="Corporation Bank">Corporation Bank</option>
                            <option value="HDFC Bank Ltd.">HDFC Bank Ltd.</option>
                            <option value="ICICI Bank">ICICI Bank</option>
                            <option value="IDBI Bank">IDBI Bank</option>
                            <option value="Oriental Bank of Commerce">Oriental Bank of Commerce</option>
                            <option value="Punjab National Bank">Punjab National Bank</option>
                            <option value="Reserve Bank of India">Reserve Bank of India</option>
                            <option value="State Bank of India">State Bank of India</option>
                            <option value="State Bank of Indore">State Bank of Indore</option>
                            <option value="Union Bank of India">Union Bank of India</option>
                            <option value="Vijaya Bank">Vijaya Bank</option>
                            <option value="Other">Other</option>  
                    </select></td>
                </tr>
                <tr>
                    <td>PAN Card No.:</td>
                    <td><input type="text" value="<%=PANCardNo%>"name="panno" pattern="[A-Za-z]{5}\d{4}[A-Za-z]{1}" size="10" placeholder="AAAAA9999A"></td>
                </tr>
                
                <tr>
                    <td>Joining Date</td>
                    <td><input type="date" value="<%=JoiningDate%>"name="jdate" required></td>
                </tr>
                <tr><td> User Type :</td>
                    <td>
                    <select name="UserType" value="<%=UserType%>">
                        <option value ="Employee">Employee</option>
                        <option value ="Admin">Admin</option>
                    </select>
                    </td>
                </tr>
            </table>
        </div>
                        <br> <input type="submit" value="Update" style="margin-left: 40%">
        </form>
    </body>
</html>
