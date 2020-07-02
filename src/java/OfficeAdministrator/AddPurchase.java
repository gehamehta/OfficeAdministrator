/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OfficeAdministrator;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rachna
 */
public class AddPurchase extends HttpServlet {

  @Override
  @SuppressWarnings({"CallToPrintStackTrace", "StringEquality"})
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String BillNo=request.getParameter("billno");
        String Name=request.getParameter("name");
        String Quantity=request.getParameter("quantity");
        String Amount=request.getParameter("amount");
        String PaymentMode=request.getParameter("paymentmode");
        String PaymentStatus=request.getParameter("status");
        
       
            try {
                Statement st=DBConnector.getStatement();
                Date date=new Date(System.currentTimeMillis());
                SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat t=new SimpleDateFormat("kk:mm:ss");
                String Time= t.format(date);
                String Date=d.format(date);

                String query="insert into itemspurchased values('"+BillNo+"','"+Name+"','"+Quantity+"','"+Time+"','"+Date+"'"+
                        ",'"+Amount+"','"+PaymentMode+"','"+PaymentStatus+"')";
                System.out.println(query);
                
                int i=st.executeUpdate(query);
                response.sendRedirect("Accounts.jsp");
            } catch (SQLException e) {
                 PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("window.location.href=\"Accounts.jsp\";</script>");
            out.println("</body></html>");
            }
        
    }
    
    @Override
  @SuppressWarnings({"CallToPrintStackTrace", "StringEquality"})
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String BillNo=request.getParameter("billno");
        String Name=request.getParameter("name");
        String Quantity=request.getParameter("quantity");
        String Amount=request.getParameter("amount");
        String PaymentMode=request.getParameter("paymentmode");
        String PaymentStatus=request.getParameter("status");
        
        
            try {
                Statement st=DBConnector.getStatement();
                String query="update itemspurchased set Name='"+Name+"',Quantity='"+Quantity+"',"+
                        "Amount='"+Amount+"',PaymentMode='"+PaymentMode+"',PaymentStatus='"+PaymentStatus+"' where BillNo='"+BillNo+"'";
                System.out.println(query);
                
                int i=st.executeUpdate(query);
                response.sendRedirect("Accounts.jsp");
            } catch (SQLException e) {
                 PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("window.location.href=\"Accounts.jsp\";</script>");
            out.println("</body></html>");
            }
        
    }
    
}
