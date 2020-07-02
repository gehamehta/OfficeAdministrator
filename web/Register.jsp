<%--
    Document   : Register
    Created on : 2 Jun, 2015, 7:38:03 PM
    Author     : Rachna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/oa.png" type="image/png">
        <title>Register</title>
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
        if(id==null) 
            //response.sendRedirect("Login");
        %>    
        <h1 style=" text-align:center; font-size: 110%; font-family:sans serif;"><img src="images/oa.png"></h1><hr>
        <h1 style=" text-align:center;font-family:sans serif;">Register</h1><hr/>
        <br>
        <form action="Register" method="get">
        <div style="float: left; width: 50%">
            <table>
                <tr>
                    <td>Employee ID:</td>
                    <td><input type="text" name="empid" id="empid" required></td>
                </tr>
                <tr>
                    <td>Full Name:</td>
                    <td><input type="text" name="name" id="name" required></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><input type="radio" name="gender"  value="Male" checked>Male
                        <input type="radio" name="gender" value="Female">Female</td>
                </tr>
                 <tr>
                    <td>Marital Status:</td>
                    <td><input type="radio" name="mstatus" value="Married" onclick="show();">Married
                        <input type="radio" name="mstatus" value="Unmarried" checked onclick="hide();">Unmarried</td>
                </tr>
                <tr>
                    <td>Mobile No.:</td>
                    <td><input type="tel" pattern="^\d{10}$" size="10" placeholder="10-digits" name="mobileno"  required></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" required></td>
                </tr>
                <tr>
                    <td>PIN Code:</td>
                    <td><input type="text" name="pin" pattern="^\d{6}$" size="6" placeholder="6-digits" required></td>
                </tr>
                <tr>
                    <td>Country:</td>
                    <td><input type="text" name="country" value="India" disabled><td>
                </tr>
                <tr>
                    <td>Bank Account No.:</td>
                    <td><input type="text" name="ban"  required></td>
                </tr>
                <tr>
                    <td>Aadhar Card No.:</td>
                    <td><input type="text" name="acn" pattern="^\d{12}$" size="12" placeholder="12-digits"></td>
                </tr>
                <tr>
                    <td>Other Details (optional):</td>
                    <td><textarea name="otherdetails"></textarea> </td>
                </tr>
                        <tr>
                            <td>
                    Department : 
                    </td>
                    <td><select name="Department">
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
                    <td><input type="password" name="password" required></td>
                </tr>
                <tr>
                    <td>Date of Birth:</td>
                    <td><input type="date" name="dob" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td id="td" style="display: none;">Anniversary Date:</td>
                    <td><input type="date" name="adate" id="adate" style="display: none;"></td>
                </tr>
                <tr>
                    <td>Email ID:</td>
                    <td><input type="email" name="emailid" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder="me@example.com" required></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td><input type="text" name="city" required></td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td><select name="state">
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
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Bank Name:</td>
                    <td><select name="bname">
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
                    <td><input type="text" name="panno" pattern="[A-Za-z]{5}\d{4}[A-Za-z]{1}" size="10" placeholder="AAAAA9999A"></td>
                </tr>
                
                <tr>
                    <td>Joining Date</td>
                    <td><input type="date" name="jdate" required></td>
                </tr>
                <tr><td> User Type :</td><td>
                    <select name="UserType">
<option value ="Employee">Employee</option>
<option value ="Admin">Admin</option>
                    </td></tr>
            </table>
        </div>
            <input type="submit" value="Register" style="margin-left: 45%">
        </form>
    </body>
    
  
</html>
