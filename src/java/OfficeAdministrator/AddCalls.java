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
public class AddCalls extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String CallerName=request.getParameter("callername");
        String ReceiverName=request.getParameter("receivername");
        String Number=request.getParameter("number");
        String Message=request.getParameter("message");
        String Remarks=request.getParameter("remarks");
        String CallType=request.getParameter("calltype");
        String TransferredTo=request.getParameter("transferredto");
        String CallStatus=request.getParameter("callstatus");
        
        if(Number=="")
            Number="0000000000";
        
       
            try {
                Statement st=DBConnector.getStatement();
                
                Date date=new Date(System.currentTimeMillis());
                SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat t=new SimpleDateFormat("kk:mm:ss");
                String Time= t.format(date);
                String Date=d.format(date);
                System.out.println("Date");
                
                String query="insert into calls(CallerName,ReceiverName,Number,Time,Message,Remarks,CallStatus,"+
                        "TransferredTo,CallType,Date) values('"+CallerName+"','"+ReceiverName+"','"+Number+"','"+Time+"'"+
                        ",'"+Message+"','"+Remarks+"','"+CallStatus+"','"+TransferredTo+"','"+CallType+"','"+Date+"')";
                System.out.println(query);
                
                int i=st.executeUpdate(query);
                response.sendRedirect("FrontOffice.jsp");
            } catch (SQLException ex) {
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("window.location.href=\"FrontOffice.jsp\";</script>");
            out.println("</body></html>");
            }
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String CallerName=request.getParameter("callername");
        String ReceiverName=request.getParameter("receivername");
        String Number=request.getParameter("number");
        String Message=request.getParameter("message");
        String Remarks=request.getParameter("remarks");
        String CallType=request.getParameter("calltype");
        String TransferredTo=request.getParameter("transferredto");
        String CallStatus=request.getParameter("callstatus");
        
        if(Number=="")
            Number="0000000000";
        
            try {
                Statement st=DBConnector.getStatement();
                
                String query="update calls set CallerName='"+CallerName+"',ReceiverName='"+ReceiverName+"',Number='"+Number+"'"+
                        ",Message='"+Message+"',Remarks='"+Remarks+"',CallStatus='"+CallStatus+"',"+
                        "TransferredTo='"+TransferredTo+"',CallType='"+CallType+"' where CallID='"+id+"'";
                        
                System.out.println(query);
                
                int i=st.executeUpdate(query);
                response.sendRedirect("FrontOffice.jsp");
            } catch (SQLException ex) {
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<script type=\"text/javascript\">");
            out.println("window.alert(\"Something went wrong !! \n Please try again..\");");
            out.println("window.location.href=\"FrontOffice.jsp\";</script>");
            out.println("</body></html>");
            }
        
    }

}
