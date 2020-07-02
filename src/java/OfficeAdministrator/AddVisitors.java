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
public class AddVisitors extends HttpServlet {
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Name=request.getParameter("name");
        String Purpose=request.getParameter("purpose");
        String EnquiryMsg=request.getParameter("enquirymsg");
        String HandledBy=request.getParameter("handledby");
        String Remarks=request.getParameter("remarks");
        String Status=request.getParameter("status");
        
        
            try {
                Statement st=DBConnector.getStatement();
                
                Date date=new Date(System.currentTimeMillis());
                SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat t=new SimpleDateFormat("kk:mm:ss");
                String Time= t.format(date);
                String Date=d.format(date);
                
                String query="insert into visitors(Name,Purpose,Date,Time,EnquiryMsg,HandledBy,Remarks,Status)"+
                        "values('"+Name+"','"+Purpose+"','"+Date+"','"+Time+"','"+EnquiryMsg+"'"+
                        ",'"+HandledBy+"','"+Remarks+"','"+Status+"')";
                System.out.println(query);
                
                int i=st.executeUpdate(query);
                response.sendRedirect("FrontOffice.jsp");
            } catch (SQLException e) {
                PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("window.location.href=\"FrontOffice.jsp\";</script>");
            out.println("</body></html>");
            }
        
    }
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String id=request.getParameter("id");
         String Name=request.getParameter("name");
        String Purpose=request.getParameter("purpose");
        String EnquiryMsg=request.getParameter("enquirymsg");
        String HandledBy=request.getParameter("handledby");
        String Remarks=request.getParameter("remarks");
        String Status=request.getParameter("status");
        
        
            try {
                Statement st=DBConnector.getStatement();
                
               
                
                String query="update visitors set Name='"+Name+"',Purpose='"+Purpose+"',EnquiryMsg='"+EnquiryMsg+"',HandledBy='"+HandledBy+"',Remarks='"+Remarks+"',Status='"+Status+"' where ID='"+id+"'";
                       
                System.out.println(query);
                
                int i=st.executeUpdate(query);
                response.sendRedirect("FrontOffice.jsp");
            } catch (SQLException e) {
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("window.location.href=\"FrontOffice.jsp\";</script>");
            out.println("</body></html>");
            }
        
    }


}
