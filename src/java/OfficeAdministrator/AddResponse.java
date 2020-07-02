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
public class AddResponse extends HttpServlet {
    
    @Override
      @SuppressWarnings({"CallToPrintStackTrace", "StringEquality"})
    // Add Service Response
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String Msg=request.getParameter("msg");
        String Quotation=request.getParameter("quotation");
        String FollowUp=request.getParameter("followup");
        String Response=request.getParameter("response");
        String Status=request.getParameter("status");
        
       
            try {
                Statement st=DBConnector.getStatement();
                Date date=new Date(System.currentTimeMillis());
                SimpleDateFormat t=new SimpleDateFormat("kk:mm:ss");
                String Time= t.format(date);

                String query="update marketing set Response='"+Response+"',EnquiryMsg='"+Msg+"',ResponseTime='"+Time+"',"+
                        "Quotation='"+Quotation+"',FollowUp='"+FollowUp+"',Status='"+Status+"'"+
                         " where ID='"+id+"'";
                System.out.println(query);
                
                int i=st.executeUpdate(query);
                response.sendRedirect("Marketing.jsp");
            } catch (SQLException e) {
                PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("window.location.href=\"Marketing.jsp\";</script>");
            out.println("</body></html>");
            }
        

    }
    
    
    @Override
      @SuppressWarnings({"CallToPrintStackTrace", "StringEquality"})
    // Add Service Response
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String From=request.getParameter("from");
        String Issue=request.getParameter("issue");
        String Remarks=request.getParameter("remarks");
        String Response=request.getParameter("response");
        String Status=request.getParameter("status");
        
        
            try {
                Statement st=DBConnector.getStatement();
                Date date=new Date(System.currentTimeMillis());
                SimpleDateFormat t=new SimpleDateFormat("kk:mm:ss");
                String Time= t.format(date);

                String query="update services set Response='"+Response+"',Remarks='"+Remarks+"',ResponseTime='"+Time+"',Status='"+Status+"'"+
                         "where ID='"+id+"'";
                System.out.println(query);
                
                int i=st.executeUpdate(query);
                response.sendRedirect("Service.jsp");
            } catch (SQLException e) {
                PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("window.location.href=\"Service.jsp\";</script>");
            out.println("</body></html>");
            }
        

    }

 
    
}
