/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OfficeAdministrator;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ayushi
 */
public class Register extends HttpServlet {

    @Override
    //Update Profile
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String id=request.getParameter("id");
    String Name=request.getParameter("name");
    String DOB=request.getParameter("dob");
    String Password=request.getParameter("password");
    String MobileNo=request.getParameter("mobileno");
    String MaritalStatus=request.getParameter("mstatus");
    String AnniversaryDate=request.getParameter("adate");
    String EmailId=request.getParameter("emailid");
    String Gender=request.getParameter("gender");
    String Address=request.getParameter("address");
    String City=request.getParameter("city");
    String PinCode=request.getParameter("pin");
    String State=request.getParameter("state");
    String Country="India";
    String BankAccountNo=request.getParameter("ban");
    String BankName=request.getParameter("bname");
    String AadharCardNo=request.getParameter("acn");
    String PANCardNo=request.getParameter("panno");
    String OtherDetails=request.getParameter("otherdetails");
    String Dept=request.getParameter("Department");
    String UserType=request.getParameter("UserType");
    String JoiningDate=request.getParameter("jdate");
    
    //if(AnniversaryDate.equals(""))
      //AnniversaryDate="0000-00-00";
            
    String query="update employee set FullName='"+Name+"',Password='"+Encrypt.EncryptText(Password)+"',DateOfBirth='"+DOB+"',"+
            "Gender='"+Gender+"',MaritalStatus='"+MaritalStatus+"',AnniversaryDate='"+AnniversaryDate+"',MobileNo='"+MobileNo+"'"+
            ",EmailID='"+EmailId+"',BankName='"+BankName+"',BankAccNo='"+BankAccountNo+"',Address='"+Address+"',City='"+City+"',"+
            "State='"+State+"',PinCode='"+PinCode+"',Country='"+Country+"',Department='"+Dept+"',Usertype='"+UserType+"',"+
            "JoiningDate='"+JoiningDate+"',AadharCardNo='"+AadharCardNo+"',PANCardNo='"+PANCardNo+"',OtherDetails='"+OtherDetails+"'"+
            " where EmpID='"+id+"'";
        System.out.println(query);
    Statement st=DBConnector.getStatement();
        try {
            int i=st.executeUpdate(query);
            query="select Department from employee where EmpID='"+id+"'";
            System.out.println(query);
                String Department="";
               
                ResultSet rs = st.executeQuery(query);
                 if(rs.next())
                      Department  =rs.getString(1);
                System.out.println(Department);
                   if(Department.equals("Front Office"))
                        response.sendRedirect("FrontOffice.jsp");
                   else if(Department.equals("Marketing"))
                        response.sendRedirect("Marketing.jsp");
                   else if(Department.equals("Accounts"))
                        response.sendRedirect("Accounts.jsp");
                   else if(Department.equals("Service"))
                        response.sendRedirect("Service.jsp");
                   else if(Department.equals("Stores"))
                        response.sendRedirect("Stores.jsp");
                   else if(Department.equals("Director"))
                       response.sendRedirect("Admin.jsp");    
            
        } catch (SQLException ex) {
            ex.printStackTrace();
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("</script>");
            out.println("</body></html>");
        
    }
    }

    @Override
    //Register 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
    String id=request.getParameter("empid");
    String Name=request.getParameter("name");
    String DOB=request.getParameter("dob");
    String Password=request.getParameter("password");
    String MobileNo=request.getParameter("mobileno");
    String MaritalStatus=request.getParameter("mstatus");
    String AnniversaryDate=request.getParameter("adate");
    String EmailId=request.getParameter("emailid");
    String Gender=request.getParameter("gender");
    String Address=request.getParameter("address");
    String City=request.getParameter("city");
    String PinCode=request.getParameter("pin");
    String State=request.getParameter("state");
    String Country="India";
    String BankAccountNo=request.getParameter("ban");
    String BankName=request.getParameter("bname");
    String AdharCardNo=request.getParameter("acn");
    String PANCardNo=request.getParameter("panno");
    String OtherDetails=request.getParameter("otherdetails");
    String Department=request.getParameter("Department");
    String UserType=request.getParameter("UserType");
    String JoiningDate=request.getParameter("jdate");
     
    //if(AnniversaryDate.equals(""))
      //AnniversaryDate="0000-00-00";
            
            String query="insert into employee values('"+Name+"','"+id+"','"+Encrypt.EncryptText(Password)+"','"+DOB+"','"+Gender+"','"+MaritalStatus+"','"+AnniversaryDate+"','"+MobileNo+"',"+
                    "'"+EmailId+"','"+BankName+"','"+BankAccountNo+"','"+Address+"','"+City+"','"+State+"','"+PinCode+"','"+Country+"','"+Department+"','"+UserType+"','"+JoiningDate+"','"+AdharCardNo+"','"+PANCardNo+"','"+OtherDetails+"')";
            System.out.println(query);
            Statement st=DBConnector.getStatement();
            int i=st.executeUpdate(query);
            
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Employee Successfully Added\");");
            out.println("window.location.href=\"Admin.jsp\";</script>");
            out.println("</body></html>");
            //response.sendRedirect("Admin.jsp");
        } catch (SQLException ex) {
            ex.printStackTrace();
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("window.location.href=\"Admin.jsp\";</script>");
            out.println("</body></html>");
        }
    
    
    }

}
